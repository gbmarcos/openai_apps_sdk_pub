import 'package:example/src/core/cubits/cubits.dart';
import 'package:example/src/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openai_apps_sdk/openai_apps_sdk.dart';

/// A page demonstrating all OpenAI Apps SDK functionalities
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _openAiBridge = OpenAiAppsSDKBridge();
  String _toolResult = '';
  String _widgetStateValue = '';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadWidgetState();
  }

  void _loadWidgetState() {
    try {
      final state = _openAiBridge.widgetState;
      if (state != null) {
        _widgetStateValue = state['value']?.toString() ?? '';
      }
    } catch (e) {
      debugPrint('Error loading widget state: $e');
    }
  }

  Future<void> _callMcpTool() async {
    setState(() => _isLoading = true);
    try {
      // Example MCP tool call - adjust tool name and args based on your MCP server
      final result = await _openAiBridge.callTool(
        'get-random-number',
        {'min': 0, 'max': 100},
      );
      setState(() => _toolResult = result);
    } catch (e) {
      setState(() => _toolResult = 'Error: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _updateWidgetState() async {
    setState(() => _isLoading = true);
    try {
      final newValue = DateTime.now().toIso8601String();
      await _openAiBridge.setWidgetState({
        'value': newValue,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      });
      setState(() => _widgetStateValue = newValue);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.widgetStateUpdated)),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.errorMessage(e.toString()))),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final displayMode = context.watch<OpenAiDisplayModeCubit>().state;
    final safeArea = context.watch<OpenAiSafeAreaCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.homeAppBarTitle),
        elevation: 2,
      ),
      body: SafeArea(
        minimum: EdgeInsets.only(
          top: safeArea.top,
          bottom: safeArea.bottom,
          left: safeArea.left,
          right: safeArea.right,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Display Mode Control
              _SectionCard(
                title: context.l10n.displayModeTitle,
                icon: Icons.aspect_ratio,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SegmentedButton<OpenAiDisplayMode>(
                      segments: [
                        ButtonSegment(
                          value: OpenAiDisplayMode.inline,
                          label: Text(context.l10n.displayModeInline),
                          icon: const Icon(Icons.view_compact),
                        ),
                        ButtonSegment(
                          value: OpenAiDisplayMode.fullscreen,
                          label: Text(context.l10n.displayModeFullscreen),
                          icon: const Icon(Icons.fullscreen),
                        ),
                        ButtonSegment(
                          value: OpenAiDisplayMode.pip,
                          label: Text(context.l10n.displayModePip),
                          icon: const Icon(Icons.picture_in_picture),
                        ),
                      ],
                      selected: {displayMode},
                      onSelectionChanged:
                          (Set<OpenAiDisplayMode> newSelection) async {
                            await _openAiBridge.requestDisplayMode(
                              newSelection.first,
                            );
                          },
                    ),
                    const SizedBox(height: 8),
                    Text(
                      context.l10n.displayModeCurrent(displayMode.data),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Actions Section
              _SectionCard(
                title: context.l10n.actionsTitle,
                icon: Icons.touch_app,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Follow-up Message
                    ElevatedButton.icon(
                      onPressed: _isLoading
                          ? null
                          : () async {
                              final currentOpenAiLocale = _openAiBridge.locale;

                              await _openAiBridge.sendFollowUpMessage(
                                'Dime la hora actual${currentOpenAiLocale != null ? ' en el lenguaje ${currentOpenAiLocale}' : ''}',
                              );
                            },
                      icon: const Icon(Icons.message),
                      label: Text(context.l10n.sendFollowUpMessage),
                    ),
                    const SizedBox(height: 12),

                    // Call MCP Tool
                    ElevatedButton.icon(
                      onPressed: _isLoading ? null : _callMcpTool,
                      icon: _isLoading
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator.adaptive(
                                strokeWidth: 2,
                              ),
                            )
                          : const Icon(Icons.build),
                      label: Text(context.l10n.callMcpTool),
                    ),
                    if (_toolResult.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.l10n.toolResult,
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _toolResult,
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontFamily: 'monospace',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    const SizedBox(height: 12),

                    // Open External Link
                    ElevatedButton.icon(
                      onPressed: _isLoading
                          ? null
                          : () {
                              _openAiBridge.openExternal(
                                'https://flutter.dev',
                              );
                            },
                      icon: const Icon(Icons.open_in_new),
                      label: Text(context.l10n.openExternalLink),
                    ),
                    const SizedBox(height: 12),

                    // Update Widget State
                    ElevatedButton.icon(
                      onPressed: _isLoading ? null : _updateWidgetState,
                      icon: const Icon(Icons.save),
                      label: Text(context.l10n.updateWidgetState),
                    ),
                    if (_widgetStateValue.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.l10n.currentWidgetState,
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _widgetStateValue,
                              style: theme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // OpenAI Globals Panel
              _SectionCard(
                title: context.l10n.openAiGlobalsTitle,
                icon: Icons.info_outline,
                child: _OpenAiGlobalsPanel(openAiBridge: _openAiBridge),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.icon,
    required this.child,
  });

  final String title;
  final IconData icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: theme.colorScheme.outlineVariant,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}

class _OpenAiGlobalsPanel extends StatelessWidget {
  const _OpenAiGlobalsPanel({required this.openAiBridge});

  final OpenAiAppsSDKBridge openAiBridge;

  dynamic _getDataSafely(dynamic Function() function) {
    try {
      return function();
    } catch (e) {
      return 'Error: $e';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    context.watch<OpenAiGlobalsCubit>().state;

    final globalsItems = [
      _GlobalItem(
        label: context.l10n.globalTheme,
        value: _getDataSafely(() => openAiBridge.theme.data),
        icon: Icons.palette,
      ),
      _GlobalItem(
        label: context.l10n.globalLocale,
        value: _getDataSafely(
          () => openAiBridge.locale ?? context.l10n.notAvailable,
        ),
        icon: Icons.language,
      ),
      _GlobalItem(
        label: context.l10n.globalDeviceType,
        value: _getDataSafely(() => openAiBridge.deviceType?.data),
        icon: Icons.devices,
      ),
      _GlobalItem(
        label: context.l10n.globalDisplayMode,
        value: _getDataSafely(() => openAiBridge.displayMode.data),
        icon: Icons.aspect_ratio,
      ),
      _GlobalItem(
        label: context.l10n.globalMaxHeight,
        value: _getDataSafely(
          () =>
              openAiBridge.maxHeight?.toStringAsFixed(0) ??
              context.l10n.notAvailable,
        ),
        icon: Icons.height,
      ),
      _GlobalItem(
        label: context.l10n.globalHoverCapability,
        value: _getDataSafely(() => openAiBridge.hasHoverCapability),
        icon: Icons.mouse,
      ),
      _GlobalItem(
        label: context.l10n.globalTouchCapability,
        value: _getDataSafely(() => openAiBridge.hasTouchCapability),
        icon: Icons.touch_app,
      ),
      _GlobalItem(
        label: context.l10n.globalSafeAreaTop,
        value: _getDataSafely(
          () => openAiBridge.safeAreaInsets.top.toStringAsFixed(1),
        ),
        icon: Icons.vertical_align_top,
      ),
      _GlobalItem(
        label: context.l10n.globalSafeAreaBottom,
        value: _getDataSafely(
          () => openAiBridge.safeAreaInsets.bottom.toStringAsFixed(1),
        ),
        icon: Icons.vertical_align_bottom,
      ),
      _GlobalItem(
        label: context.l10n.globalSafeAreaLeft,
        value: _getDataSafely(
          () => openAiBridge.safeAreaInsets.left.toStringAsFixed(1),
        ),
        icon: Icons.keyboard_arrow_left,
      ),
      _GlobalItem(
        label: context.l10n.globalSafeAreaRight,
        value: _getDataSafely(
          () => openAiBridge.safeAreaInsets.right.toStringAsFixed(1),
        ),
        icon: Icons.keyboard_arrow_right,
      ),
      _GlobalItem(
        label: context.l10n.globalWidgetState,
        value: _getDataSafely(
          () =>
              openAiBridge.widgetState?['value']?.toString() ??
              context.l10n.notAvailable,
        ),
        icon: Icons.widgets,
      ),
      _GlobalItem(
        label: context.l10n.globalToolInput,
        value: _getDataSafely(
          () => openAiBridge.toolInput.toString(),
        ),
        icon: Icons.input,
      ),
      _GlobalItem(
        label: context.l10n.globalToolOutput,
        value: _getDataSafely(
          () =>
              openAiBridge.toolOutput?.toString() ?? context.l10n.notAvailable,
        ),
        icon: Icons.output,
      ),
    ];

    return Column(
      children: [
        for (var i = 0; i < globalsItems.length; i++) ...[
          _GlobalItemWidget(item: globalsItems[i]),
          if (i < globalsItems.length - 1)
            Divider(
              height: 16,
              color: theme.colorScheme.outlineVariant.withOpacity(0.5),
            ),
        ],
      ],
    );
  }
}

class _GlobalItem {
  const _GlobalItem({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final dynamic value;
  final IconData icon;
}

class _GlobalItemWidget extends StatelessWidget {
  const _GlobalItemWidget({required this.item});

  final _GlobalItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Icon(
          item.icon,
          size: 18,
          color: theme.colorScheme.secondary,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            item.label,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        Expanded(
          child: Text(
            item.value.toString(),
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }
}
