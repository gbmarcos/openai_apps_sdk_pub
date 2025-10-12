// src/server.ts
import express from 'express';
import cors from 'cors';
import path from 'path';
import { McpServer } from '@modelcontextprotocol/sdk/server/mcp.js';
import { StreamableHTTPServerTransport } from '@modelcontextprotocol/sdk/server/streamableHttp.js';
import { randomUUID } from 'crypto';

const app = express();
const PORT = process.env.PORT || 8000;

// Middleware
app.use(cors({
  origin: '*',
  exposedHeaders: ['Mcp-Session-Id'],
  allowedHeaders: ['Content-Type', 'mcp-session-id'],
}));
app.use(express.json());

// Servir Flutter build
const flutterPath = path.join('', '../../example/build/web');
app.use('/widget', express.static(flutterPath));

// Store transports por session ID
const transports: { [sessionId: string]: StreamableHTTPServerTransport } = {};

// Crear servidor MCP
function createMcpServer(): McpServer {
  const server = new McpServer({
    name: 'theme-demo-server',
    version: '1.0.0',
  });

  // Registrar tool: theme-demo
  server.registerTool(
    'theme-demo',
    {
      title: 'Theme Demo Widget',
      description: 'Muestra un widget que reacciona al tema de ChatGPT (light/dark)',
      inputSchema: {
        // Sin parámetros necesarios
      },
    },
    async () => {
      console.log('✅ theme-demo tool called');
      
      return {
        content: [
          {
            type: 'text',
            text: 'Widget de demostración de tema cargado. El widget cambiará automáticamente entre modo claro y oscuro según el tema de ChatGPT.',
          },
        ],
        _meta: {
          'openai/outputTemplate': 'ui://widget/index.html',
        },
      };
    }
  );

  console.log('🔧 MCP Server configured with theme-demo tool');
  return server;
}

// Handle POST requests (client-to-server)
app.post('/mcp', async (req, res) => {
  const sessionId = req.headers['mcp-session-id'] as string | undefined;
  let transport: StreamableHTTPServerTransport;

  try {
    if (sessionId && transports[sessionId]) {
      // Reusar transport existente
      transport = transports[sessionId];
      console.log(`♻️  Reusing transport for session: ${sessionId}`);
    } else {
      // Crear nuevo transport
      console.log('🆕 Creating new transport');
      
      transport = new StreamableHTTPServerTransport({
        sessionIdGenerator: () => randomUUID(),
        onsessioninitialized: (newSessionId) => {
          transports[newSessionId] = transport;
          console.log(`✅ Session initialized: ${newSessionId}`);
        },
      });

      // Cleanup cuando se cierre
      transport.onclose = () => {
        if (transport.sessionId) {
          delete transports[transport.sessionId];
          console.log(`🗑️  Transport closed for session: ${transport.sessionId}`);
        }
      };

      // Crear y conectar servidor MCP
      const mcpServer = createMcpServer();
      await mcpServer.connect(transport);
      console.log('🔗 MCP Server connected to transport');
    }

    // Manejar request
    await transport.handleRequest(req, res, req.body);
  } catch (error) {
    console.error('❌ Error handling MCP request:', error);
    if (!res.headersSent) {
      res.status(500).json({
        jsonrpc: '2.0',
        error: {
          code: -32603,
          message: 'Internal server error',
        },
        id: null,
      });
    }
  }
});

// Handle GET requests (server-to-client notifications via SSE)
app.get('/mcp', async (req, res) => {
  const sessionId = req.headers['mcp-session-id'] as string | undefined;

  if (!sessionId || !transports[sessionId]) {
    res.status(400).send('Invalid or missing session ID');
    return;
  }

  const transport = transports[sessionId];
  console.log(`📡 SSE connection for session: ${sessionId}`);
  await transport.handleRequest(req, res);
});

// Handle DELETE requests (session termination)
app.delete('/mcp', async (req, res) => {
  const sessionId = req.headers['mcp-session-id'] as string | undefined;

  if (!sessionId || !transports[sessionId]) {
    res.status(400).send('Invalid or missing session ID');
    return;
  }

  const transport = transports[sessionId];
  console.log(`🛑 Session termination requested: ${sessionId}`);
  await transport.handleRequest(req, res);
});

// Health check
app.get('/health', (req, res) => {
  res.json({
    status: 'ok',
    timestamp: new Date().toISOString(),
    activeSessions: Object.keys(transports).length,
  });
});

// Root endpoint info
app.get('/', (req, res) => {
  res.json({
    name: 'Theme Demo MCP Server',
    version: '1.0.0',
    endpoints: {
      mcp: '/mcp',
      widget: '/widget/',
      health: '/health',
    },
    documentation: 'https://modelcontextprotocol.io',
  });
});

// Start server
app.listen(PORT, () => {
  console.log('═══════════════════════════════════════════════════════');
  console.log('🚀 MCP Server with Flutter Widget');
  console.log('═══════════════════════════════════════════════════════');
  console.log(`📍 Server URL:    http://localhost:${PORT}`);
  console.log(`🔧 MCP Endpoint:  http://localhost:${PORT}/mcp`);
  console.log(`📦 Flutter Widget: http://localhost:${PORT}/widget/`);
  console.log(`❤️  Health Check:  http://localhost:${PORT}/health`);
  console.log('═══════════════════════════════════════════════════════');
  console.log('');
  console.log('📝 To use with ngrok:');
  console.log(`   ngrok http ${PORT}`);
  console.log('');
  console.log('✨ Ready to accept connections!');
});