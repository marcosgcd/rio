import 'package:rio/rio.dart';

@Deprecated(
  'Use RioContainer.glass(...) instead. '
  'RioGlassContainer is a compatibility wrapper and will be removed in a future release.',
)
class RioGlassContainer extends RioContainer {
  const RioGlassContainer({
    super.key,
    super.theme,
    super.child,
    super.padding,
    super.margin,
    super.height,
    super.width,
    super.borderRadius,
    super.border,
    super.color,
    super.opacity = 0.5,
    super.blur = 5,
    super.borderWidth = 1,
    super.disableGlassEffect = false,
  }) : super.glass();
}
