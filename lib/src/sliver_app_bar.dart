import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rio/rio.dart';

class RioSliverAppBar extends StatelessWidget {
  const RioSliverAppBar({
    super.key,
    this.actions,
    this.leading,
    this.flexibleSpace,
    this.bottom,
    this.leadingWidth,
    this.expandedHeight,
    this.toolbarHeight = kToolbarHeight,
    this.useGlassContainer = true,
  });

  final List<Widget>? actions;
  final Widget? leading;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final double? leadingWidth;
  final double? expandedHeight;
  final double toolbarHeight;
  final bool useGlassContainer;

  @override
  Widget build(BuildContext context) {
    final wrappedFlexibleSpace = useGlassContainer
        ? RioContainer.glass(
            borderRadius: BorderRadius.zero,
            child: flexibleSpace,
          )
        : flexibleSpace;

    final onSurface = RioTheme.of(context).colorScheme.onSurface;

    return SliverAppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      forceElevated: false,
      pinned: true,
      automaticallyImplyLeading: false,
      floating: false,
      expandedHeight: expandedHeight,
      leadingWidth: leadingWidth,
      toolbarHeight: toolbarHeight,
      actions: actions,
      leading: leading,
      bottom: bottom,
      scrolledUnderElevation: 0,
      foregroundColor: onSurface,
      titleTextStyle: TextStyle(color: onSurface),
      flexibleSpace: wrappedFlexibleSpace,
      systemOverlayStyle: RioTheme.of(context).brightness == Brightness.dark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
    );
  }
}
