import 'dart:async';

import 'package:flutter/material.dart';
import 'package:remove_emoji/remove_emoji.dart';
import 'package:rio/rio.dart';

class RioAvatarTheme extends RioButtonTheme {
  const RioAvatarTheme({
    super.variant,
    super.margin,
    super.borderRadius,
    super.border,
    super.color,
    super.disableScaleAnimation,
    super.disableHighlight,
    super.scaleValue,
  });

  const RioAvatarTheme.defaultTheme()
      : super(
          padding: EdgeInsets.zero,
          scaleValue: 16,
        );

  @override
  RioAvatarTheme copyWith({
    RioButtonVariant? variant,
    EdgeInsets? margin,
    EdgeInsets? padding,
    double? gap,
    BorderRadiusGeometry? borderRadius,
    BoxBorder? border,
    Color? color,
    bool? disableScaleAnimation,
    bool? disableHighlight,
    double? scaleValue,
    RioButtonIconPosition? iconPosition,
  }) {
    return RioAvatarTheme(
      variant: variant ?? this.variant,
      margin: margin ?? this.margin,
      borderRadius: borderRadius ?? this.borderRadius,
      border: border ?? this.border,
      color: color ?? this.color,
      disableScaleAnimation:
          disableScaleAnimation ?? this.disableScaleAnimation,
      disableHighlight: disableHighlight ?? this.disableHighlight,
      scaleValue: scaleValue ?? this.scaleValue,
    );
  }

  @override
  RioAvatarTheme lerp(
    covariant ThemeExtension<RioButtonTheme>? other,
    double t,
  ) {
    if (other is! RioIconButtonTheme) return this;

    return RioAvatarTheme(
      variant: t < 0.5 ? variant : other.variant,
      margin: t < 0.5 ? margin : other.margin,
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      border: t < 0.5 ? border : other.border,
      color: Color.lerp(color, other.color, t),
      disableScaleAnimation:
          t < 0.5 ? disableScaleAnimation : other.disableScaleAnimation,
      disableHighlight: t < 0.5 ? disableHighlight : other.disableHighlight,
      scaleValue: t < 0.5 ? scaleValue : other.scaleValue,
    );
  }
}

class RioAvatar extends StatelessWidget {
  const RioAvatar({
    super.key,
    this.image,
    this.onImageError,
    this.radius = 20,
    this.name,
    this.onPressed,
    this.colorFromName = true,
    this.showInitials = true,
    this.child,
    this.maxInitials = 2,
    this.onPressedMode = RioButtonOnPressedAwaitMode.none,
    this.theme,
  }) : assert(image != null || onImageError == null);

  final RioAvatarTheme? theme;
  final double radius;
  final String? name;
  final ImageProvider? image;
  final ImageErrorListener? onImageError;
  final FutureOr<void> Function()? onPressed;
  final bool colorFromName;
  final bool showInitials;
  final int maxInitials;
  final RioButtonOnPressedAwaitMode onPressedMode;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));

    final theme = RioTheme.of(context).avatarTheme.merge(this.theme);
    Color color = theme.color ?? Theme.of(context).colorScheme.primary;
    final borderRadius = theme.borderRadius ??
        BorderRadius.circular(RioTheme.of(context).defaultBorderRadius);

    final initials = name != null ? _getInitials(name!, maxInitials) : null;

    if (image == null && colorFromName && name != null) {
      color = _getColorFromName(
        name!,
        isDark: Theme.of(context).brightness == Brightness.dark,
      );
    }

    if (image != null) {
      color = Colors.white;
    }

    Widget? childWidget = child;

    childWidget ??= Center(
      child: IconTheme.merge(
        data: IconThemeData(size: radius),
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: initials == null || !showInitials
              ? const Icon(Icons.person)
              : FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: Text(
                      initials,
                      style: TextStyle(fontSize: radius / 1.25),
                    ),
                  ),
                ),
        ),
      ),
    );

    return AbsorbPointer(
      absorbing: onPressed == null,
      child: RioButton(
        onPressedAwaitMode: onPressedMode,
        onPressed: onPressed,
        clipBehavior: Clip.antiAlias,
        theme: theme.copyWith(
          color: color,
          padding: EdgeInsets.zero,
          borderRadius: borderRadius,
          variant: theme.variant,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: radius * 2,
            maxWidth: radius * 2,
            minWidth: radius * 2,
            minHeight: radius * 2,
          ),
          child: AnimatedContainer(
            duration: kThemeChangeDuration,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              image: image != null
                  ? DecorationImage(
                      image: image!,
                      onError: onImageError,
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: image != null ? null : childWidget,
          ),
        ),
      ),
    );
  }
}

final removeEmoji = RemoveEmoji();
String? _getInitials(String input, int maxInitials) {
  final List<String> words = removeEmoji.clean(input).trim().split(" ");
  if (words.first.isEmpty) return null;

  final initials = StringBuffer();
  for (final word in words) {
    if (word.isEmpty) continue;
    initials.write(word[0]);

    if (initials.length == maxInitials) {
      break;
    }
  }
  return initials.toString().toUpperCase();
}

Color _getColorFromName(String name, {bool isDark = false}) {
  final input = name.toLowerCase();
  int sum = 0;
  for (int i = 0; i < input.length; i++) {
    int value = input.codeUnitAt(i) - 96;
    if (value < 1 || value > 26) value = 0;
    sum += value;
  }
  return _colors[sum % _colors.length];
}

List<Color> _colors = [
  Colors.red,
  Colors.pink,
  Colors.purple,
  Colors.deepPurple,
  Colors.indigo,
  Colors.blue,
  Colors.lightBlue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.lightGreen,
  Colors.lime,
  Colors.amber,
  Colors.orange,
  Colors.deepOrange,
  Colors.brown,
  Colors.blueGrey,
];
