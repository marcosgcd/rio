import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Solid',
  type: RioAvatar,
  path: "Display",
)
Widget useCaseRioAvatarSolid(BuildContext context) {
  return _buildUseCase(context, variant: RioButtonVariant.solid);
}

@widgetbook.UseCase(
  name: 'Soft',
  type: RioAvatar,
  path: "Display",
)
Widget useCaseRioAvatarSoft(BuildContext context) {
  return _buildUseCase(context, variant: RioButtonVariant.soft);
}

@widgetbook.UseCase(
  name: 'Outlined',
  type: RioAvatar,
  path: "Display",
)
Widget useCaseRioAvatarOutlined(BuildContext context) {
  return _buildUseCase(context, variant: RioButtonVariant.outlined);
}

@widgetbook.UseCase(
  name: 'Plain',
  type: RioAvatar,
  path: "Display",
)
Widget useCaseRioAvatarPlain(BuildContext context) {
  return _buildUseCase(context, variant: RioButtonVariant.plain);
}

Widget _buildUseCase(
  BuildContext context, {
  required RioButtonVariant variant,
}) {
  final radius = context.knobs.double
      .slider(label: "Radius", initialValue: 42, max: 128, min: 8);
  final borderRadius = context.knobs.double.slider(
    label: "Border Radius",
    initialValue: 10,
    max: 50,
    min: 0,
  );
  final name = context.knobs.stringOrNull(
    label: "Name",
    initialValue: "Marcos Guimaraes Cruz Dantas",
  );
  final clickable =
      context.knobs.boolean(label: "Clickable", initialValue: true);
  final colorFromName =
      context.knobs.boolean(label: "Color from name", initialValue: true);
  final showInitials =
      context.knobs.boolean(label: "Show initials", initialValue: true);

  final theme = RioAvatarTheme(
    borderRadius: BorderRadius.circular(borderRadius),
    variant: variant,
  );

  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RioAvatar(
          theme: theme,
          radius: radius,
          name: name,
          onPressed: clickable ? () {} : null,
          colorFromName: colorFromName,
          image: const NetworkImage(
            "https://www.dasding.de/newszone/1664472093039,avatar-elemente-100~_v-1x1@2dL_-029cdd853d61a51824ed2ee643deeae504b065c1.jpg",
          ),
        ),
        const SizedBox(height: 16),
        RioAvatar(
          theme: theme,
          radius: context.knobs.double
              .slider(label: "Radius", initialValue: 42, max: 128, min: 8),
          name: name,
          onPressed: clickable ? () {} : null,
          colorFromName: colorFromName,
          showInitials: showInitials,
        ),
        const SizedBox(height: 16),
        RioAvatar(
          theme: theme,
          radius: radius,
          name: "Sebastian Schreiner",
          onPressed: clickable ? () {} : null,
          colorFromName: colorFromName,
          showInitials: showInitials,
        ),
        const SizedBox(height: 16),
        RioAvatar(
          theme: theme,
          radius: radius,
          name: "Regina Cruz Rackow",
          onPressed: clickable ? () {} : null,
          showInitials: showInitials,
          colorFromName: colorFromName,
        ),
        const SizedBox(height: 16),
        RioAvatar(
          theme: theme,
          radius: radius,
          onPressed: clickable ? () {} : null,
          colorFromName: colorFromName,
          showInitials: showInitials,
        ),
        const SizedBox(height: 16),
        RioAvatar(
          theme: theme,
          radius: radius,
          onPressed: clickable ? () {} : null,
          colorFromName: colorFromName,
          child: const Icon(Icons.add),
        ),
      ],
    ),
  );
}
