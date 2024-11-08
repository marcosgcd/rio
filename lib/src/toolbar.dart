import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'toolbar.tailor.dart';

@TailorMixinComponent()
class RioToolbarTheme extends ThemeExtension<RioToolbarTheme>
    with DiagnosticableTreeMixin, _$RioToolbarThemeTailorMixin {
  const RioToolbarTheme({
    this.margin = EdgeInsets.zero,
  });

  @override
  final EdgeInsets margin;
}

abstract class RioToolbarItem {
  const RioToolbarItem({
    required this.action,
    required this.label,
    this.disabled = false,
    this.icon,
    this.tooltip,
  });

  final FutureOr<void> Function() action;
  final bool disabled;
  final Widget label;
  final String? tooltip;
  final Widget? icon;

  Widget build(BuildContext context);
}

class RioToolbarItemButton extends RioToolbarItem {
  const RioToolbarItemButton({
    required super.action,
    required super.label,
    super.disabled,
    super.icon,
    super.tooltip,
    this.buttonTheme,
  });

  final RioButtonTheme? buttonTheme;

  @override
  Widget build(BuildContext context) {
    var theme = buttonTheme ?? RioTheme.of(context).buttonTheme;
    theme = theme.copyWith(
      color: buttonTheme?.color ?? RioTheme.of(context).colorScheme.onSurface,
      variant: buttonTheme?.variant ?? RioButtonVariant.plain,
    );
    return RioButton(
      disabled: disabled,
      theme: theme,
      leading: icon,
      onPressed: action,
      tooltip: tooltip,
      child: label,
    );
  }
}

class RioToolbarItemIconButton extends RioToolbarItem {
  const RioToolbarItemIconButton({
    required super.action,
    required super.label,
    required Widget icon,
    super.disabled,
    this.iconButtonTheme,
  }) : super(icon: icon);

  final RioIconButtonTheme? iconButtonTheme;

  @override
  Widget build(BuildContext context) {
    var theme = iconButtonTheme ?? RioTheme.of(context).iconButtonTheme;
    theme = theme.copyWith(
      color:
          iconButtonTheme?.color ?? RioTheme.of(context).colorScheme.onSurface,
      variant: iconButtonTheme?.variant ?? RioButtonVariant.plain,
    );

    var tooltip = this.tooltip;

    if (tooltip == null && label is Text) {
      tooltip = (label as Text).data;
    }

    return RioIconButton(
      disabled: disabled,
      theme: theme,
      tooltip: tooltip,
      onPressed: action,
      icon: icon!,
    );
  }
}

class RioToolbar extends StatefulWidget {
  const RioToolbar({
    super.key,
    required this.items,
    this.moreButtonTheme,
  });
  final List<RioToolbarItem> items;
  final RioIconButtonTheme? moreButtonTheme;

  @override
  State<RioToolbar> createState() => _RioToolbarState();
}

class _RioToolbarState extends State<RioToolbar> {
  List<GlobalKey> _itemKeys = [];
  int _visibleItemsCount = 0;
  int _overflowItemsCount = 0;
  double? _lastBuildMaxWidth;

  @override
  void initState() {
    super.initState();
    _genereateKeys();
  }

  @override
  void didUpdateWidget(RioToolbar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.items.length != widget.items.length) {
      _genereateKeys();
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => _calculateVisibleButtons(_lastBuildMaxWidth!, force: true),
      );
    }
  }

  void _genereateKeys() =>
      _itemKeys = List.generate(widget.items.length + 1, (_) => GlobalKey());

  void _calculateVisibleButtons(double maxWidth, {bool force = false}) {
    if (maxWidth == _lastBuildMaxWidth && force == false) return;

    _lastBuildMaxWidth = maxWidth;

    final moreButtonWidth = _itemKeys.last.currentContext?.size?.width ?? 0;

    var availableWidth =
        _overflowItemsCount == 0 ? maxWidth : maxWidth - moreButtonWidth;
    double usedWidth = 0;

    var visibleItemsCount = 0;
    var overflowItemsCount = 0;

    for (var i = 0; i < widget.items.length; i++) {
      final GlobalKey key = _itemKeys[i];
      final itemWidth = key.currentContext!.size?.width ?? 0;

      if (usedWidth + itemWidth <= availableWidth) {
        usedWidth += itemWidth;
        visibleItemsCount++;
      } else {
        usedWidth = availableWidth;
        overflowItemsCount++;
      }
    }

    _visibleItemsCount = visibleItemsCount;
    _overflowItemsCount = overflowItemsCount;

    setState(() {});

    if (force == false) {
      _calculateVisibleButtons(maxWidth, force: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) => _calculateVisibleButtons(constraints.maxWidth),
            );

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              child: Row(
                children: _buildToolbarItems(),
              ),
            );
          },
        ),
        Offstage(
          child: Row(
            children: _buildOffstageButtons(),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildToolbarItems() {
    final List<Widget> items = [];

    for (var i = 0; i < _visibleItemsCount; i++) {
      items.add(SizedBox(child: _buildItem(i)));
    }

    if (_overflowItemsCount != 0 &&
        widget.items.length >= _overflowItemsCount) {
      items.add(
        _MoreButton(
          iconButtonTheme: widget.moreButtonTheme,
          items: widget.items
              .getRange(_visibleItemsCount, widget.items.length)
              .toList(),
        ),
      );
    }

    return items;
  }

  List<Widget> _buildOffstageButtons() {
    final List<Widget> offstageButtons = [];

    for (int i = 0; i < widget.items.length; i++) {
      offstageButtons.add(_buildItem(i, key: _itemKeys[i]));
    }

    offstageButtons.add(
      _MoreButton(
        key: _itemKeys.last,
        iconButtonTheme: widget.moreButtonTheme,
      ),
    );

    return offstageButtons;
  }

  Widget _buildItem(int index, {Key? key}) {
    if (index > widget.items.length - 1) return SizedBox(key: key);

    final item = widget.items[index];

    return ChildSizeChangedListener(
      onSizeChanged: (Size newSize) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => _calculateVisibleButtons(_lastBuildMaxWidth!, force: true),
        );
      },
      child: SizedBox(
        key: key,
        child: item.build(context),
      ),
    );
  }
}

class _MoreButton extends StatelessWidget {
  const _MoreButton({
    super.key,
    this.items = const [],
    this.iconButtonTheme,
  });
  final List<RioToolbarItem> items;
  final RioIconButtonTheme? iconButtonTheme;

  @override
  Widget build(BuildContext context) {
    RioIconButtonTheme theme =
        iconButtonTheme ?? RioTheme.of(context).iconButtonTheme;
    theme = theme.copyWith(
      color:
          iconButtonTheme?.color ?? RioTheme.of(context).colorScheme.onSurface,
      variant: iconButtonTheme?.variant ?? RioButtonVariant.plain,
    );
    return RioIconButton(
      onPressedAwaitMode: RioButtonOnPressedAwaitMode.highlight,
      theme: theme,
      onPressed: () async {
        final result = await showRioMenu<VoidCallback>(
          context,
          items: items
              .map(
                (e) => RioMenuItem(
                  title: e.label,
                  value: e.action,
                  icon: e.icon,
                ),
              )
              .toList(),
        );

        if (result != null) {
          result();
        }
      },
      icon: const Icon(Icons.more_horiz),
    );
  }
}
