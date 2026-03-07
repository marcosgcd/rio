import 'package:flutter/material.dart';
import 'package:rio/rio.dart';

class RioSettingsDivider extends StatelessWidget {
  const RioSettingsDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      color: RioTheme.of(context).colorScheme.surface.withValues(alpha: 0.75),
    );
  }
}

class RioSettingsSection extends StatelessWidget {
  const RioSettingsSection({
    super.key,
    required this.children,
    this.title,
    this.titlePadding = const EdgeInsets.only(left: 32, top: 16),
    this.margin,
    this.disableGlassEffect = true,
    this.autoDividers = true,
  });

  final List<Widget> children;
  final Widget? title;
  final EdgeInsets titlePadding;
  final EdgeInsets? margin;
  final bool disableGlassEffect;
  final bool autoDividers;

  List<Widget> _buildChildren() {
    if (autoDividers == false || children.length < 2) return children;

    final sectionChildren = <Widget>[];

    for (var i = 0; i < children.length; i++) {
      final child = children[i];
      sectionChildren.add(child);

      if (i == children.length - 1) continue;

      final nextChild = children[i + 1];
      final hasManualDivider =
          child is RioSettingsDivider || nextChild is RioSettingsDivider;
      if (hasManualDivider) continue;

      sectionChildren.add(const RioSettingsDivider());
    }

    return sectionChildren;
  }

  @override
  Widget build(BuildContext context) {
    final sectionChildren = _buildChildren();

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: titlePadding,
              child: DefaultTextStyle(
                style: Theme.of(context).textTheme.titleLarge ??
                    const TextStyle(fontSize: 20),
                child: title!,
              ),
            ),
          RioContainer.glass(
            color: RioTheme.of(context).colorScheme.surface,
            disableGlassEffect: disableGlassEffect,
            margin: margin ??
                EdgeInsets.fromLTRB(16, title == null ? 16 : 8, 16, 8),
            child: Column(children: sectionChildren),
          ),
        ],
      ),
    );
  }
}

class RioSettingsTile extends StatelessWidget {
  const RioSettingsTile({
    super.key,
    required this.label,
    this.onPressed,
    this.disabled = false,
    this.caption,
    this.captionWidget,
    this.trailing,
    this.chevronIcon,
  });

  final Widget label;
  final VoidCallback? onPressed;
  final bool disabled;
  final String? caption;
  final Widget? captionWidget;
  final Widget? trailing;
  final IconData? chevronIcon;

  @override
  Widget build(BuildContext context) {
    final onSurface = RioTheme.of(context).colorScheme.onSurface;

    final content = Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
      height: 55,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.labelLarge ??
                      const TextStyle(fontSize: 14),
                  child: label,
                ),
                if (captionWidget != null) Flexible(child: captionWidget!),
                if (caption != null && captionWidget == null)
                  Flexible(
                    child: Text(
                      caption!,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: onSurface.withValues(alpha: 0.5),
                          ),
                    ),
                  ),
              ],
            ),
          ),
          if (trailing != null) trailing!,
          if (onPressed != null && trailing == null && disabled == false)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(
                chevronIcon ?? Icons.chevron_right,
                color: onSurface.withValues(alpha: 0.5),
              ),
            ),
        ],
      ),
    );

    if (onPressed == null) {
      return content;
    }

    return RioButton(
      key: ValueKey(disabled),
      disabled: disabled,
      onPressedAwaitMode: RioButtonOnPressedAwaitMode.highlight,
      theme: RioButtonTheme(
        padding: EdgeInsets.zero,
        borderRadius: BorderRadius.zero,
        variant: disabled ? RioButtonVariant.soft : RioButtonVariant.plain,
      ),
      onPressed: onPressed,
      child: content,
    );
  }
}
