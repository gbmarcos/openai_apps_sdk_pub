# Changelog

## 1.0.0

Initial release of OpenAI Apps SDK bridge for Flutter.

### Features

- `callTool()` - Call backend tools through MCP server
- `sendFollowUpMessage()` - Send programmatic messages to ChatGPT
- `openExternal()` - Open external URLs
- `requestDisplayMode()` - Request display mode changes (inline, fullscreen, pip)
- `initInlineModeSizeConfig()` - Configure inline mode height (experimental, addresses resizing issues)
- Access to `theme` property (light/dark mode)
- Access to `locale` property
- Access to `displayMode` property
- Access to `deviceType` property
- Access to `hasHoverCapability` property
- Access to `hasTouchCapability` property
- Access to `safeAreaInsets` property
- `themeStream` - Listen to theme changes
- `localeStream` - Listen to locale changes
- `displayModeStream` - Listen to display mode changes
- `safeAreaStream` - Listen to safe area changes
- `globalsStream` - Listen to global state changes

