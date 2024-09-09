import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChildSizeChangedListener extends SingleChildRenderObjectWidget {
  const ChildSizeChangedListener({
    super.key,
    required Widget child,
    required this.onSizeChanged,
  }) : super(child: child);

  final ValueChanged<Size> onSizeChanged;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderSizeChangedListener(onSizeChanged: onSizeChanged);
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RenderSizeChangedListener renderObject,
  ) {
    renderObject.onSizeChanged = onSizeChanged;
  }
}

class RenderSizeChangedListener extends RenderProxyBox {
  RenderSizeChangedListener({required this.onSizeChanged});

  ValueChanged<Size> onSizeChanged;
  Size? _oldSize;
  bool _firstLayout = true;

  @override
  void performLayout() {
    super.performLayout();
    final newSize = child!.size;
    if (_oldSize != newSize && !_firstLayout) {
      onSizeChanged(newSize);
    }
    _oldSize = newSize;
    _firstLayout = false;
  }
}
