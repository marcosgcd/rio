import 'package:flutter/material.dart';
import 'package:rio/rio.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'default',
  type: RioListView,
  path: "Display",
)
Widget useCaseRioListView(BuildContext context) {
  return Scaffold(body: SafeArea(child: _buildUseCase(context, false)));
}

@widgetbook.UseCase(
  name: 'grouped',
  type: RioListView,
  path: "Display",
)
Widget useCaseRioListViewGrouped(BuildContext context) {
  return Scaffold(body: SafeArea(child: _buildUseCase(context, true)));
}

Widget _buildUseCase(BuildContext context, bool grouped) {
  final separeted =
      context.knobs.boolean(label: "Separated", initialValue: true);

  final borderRadius = context.knobs.double
      .slider(label: "Border Radius", initialValue: 10, min: 0, max: 32);

  final separatorBuilder =
      separeted ? (context, item, index) => const Divider(height: 1) : null;

  final buttonTheme =
      RioButtonTheme(borderRadius: BorderRadius.circular(borderRadius));

  // ignore: prefer_function_declarations_over_variables
  final itemBuilder = (context, item, index) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Text(item),
        ],
      ),
    );
  };
  // ignore: prefer_function_declarations_over_variables
  final headerBuilder = (context, state, group) {
    return Container(
      color: RioTheme.of(context).colorScheme.surface,
      padding: const EdgeInsets.all(8.0),
      child: Text(group),
    );
  };

  final slidableActionProps = RioListSlidableActionProps<String>(
    endActions: [
      RioListSlidableAction(
        icon: Icons.edit,
        backgroundColor: RioTheme.of(context).colorScheme.surface,
        foregroundColor: RioTheme.of(context).colorScheme.onSurface,
        label: "Edit",
        onPressed: (item) => print("Edit $item"),
      ),
      RioListSlidableAction(
        icon: Icons.delete,
        backgroundColor: Theme.of(context).colorScheme.errorContainer,
        foregroundColor: Theme.of(context).colorScheme.onErrorContainer,
        label: "Delete",
        onPressed: (item) => print("Delete $item"),
      ),
    ],
  );

  if (grouped) {
    final sticky = context.knobs.boolean(label: "Sticky", initialValue: true);
    final groupSpacing = context.knobs.double
        .slider(label: "Group Spacing", initialValue: 8, min: 0, max: 32);

    return RioListView<String, String>.groupedBuilder(
      items: _name,
      separatorBuilder: separatorBuilder,
      itemBuilder: itemBuilder,
      groupBy: (item) => item[0],
      itemSort: (a, b) => a.compareTo(b),
      groupSort: (a, b) => a.compareTo(b),
      headerBuilder: headerBuilder,
      sticky: sticky,
      groupSpacing: groupSpacing,
      onItemPressed: (value) => print(value),
      slidableActionProps: slidableActionProps,
      buttonTheme: buttonTheme,
    );
  } else {
    return RioListView<String, String>.builder(
      items: _name,
      itemBuilder: itemBuilder,
      separatorBuilder: separatorBuilder,
      itemSort: (a, b) => a.compareTo(b),
      onItemPressed: (value) => print(value),
      slidableActionProps: slidableActionProps,
      buttonTheme: buttonTheme,
    );
  }
}

List<String> _name = [
  "Liam Smith",
  "Olivia Johnson",
  "Noah Williams",
  "Emma Brown",
  "Oliver Jones",
  "Ava Garcia",
  "Elijah Miller",
  "Charlotte Davis",
  "William Rodriguez",
  "Sophia Martinez",
  "James Hernandez",
  "Amelia Lopez",
  "Benjamin Gonzalez",
  "Isabella Wilson",
  "Lucas Anderson",
  "Mia Taylor",
  "Henry Thomas",
  "Evelyn Moore",
  "Alexander Jackson",
  "Harper Martin",
  "Michael Lee",
  "Camila Perez",
  "Ethan Thompson",
  "Abigail White",
  "Daniel Harris",
  "Emily Clark",
  "Matthew Lewis",
  "Elizabeth Hall",
  "Jackson Hill",
  "Avery Young",
  "David Scott",
  "Sofia Green",
  "Joseph Adams",
  "Ella Baker",
  "Samuel Nelson",
  "Madison Carter",
  "Sebastian Mitchell",
  "Scarlett Perez",
  "Carter Roberts",
  "Victoria Turner",
  "Wyatt Phillips",
  "Aria Campbell",
  "Jayden Parker",
  "Grace Evans",
  "John Edwards",
  "Chloe Collins",
  "Owen Stewart",
  "Penelope Sanchez",
  "Jack Morris",
  "Lily Rogers",
  "Luke Reed",
  "Hannah Cook",
  "Dylan Morgan",
  "Claire Cooper",
  "Matthew Morgan",
  "Natalie Rivera",
  "David Cox",
  "Zoe Howard",
  "William Ward",
  "Gabriella Foster",
  "Olivia Powell",
  "Elijah Long",
  "Anna Hughes",
  "Samuel Flores",
  "Brooklyn Butler",
  "Daniel Simmons",
  "Aaliyah Foster",
  "Lucas Patterson",
  "Leah Perry",
  "Jackson Jenkins",
  "Skylar Reed",
  "David West",
  "Madison Brooks",
  "Carter Cole",
  "Ellie Russell",
  "Daniel Griffin",
  "Aubrey Diaz",
  "Wyatt Hayes",
  "Addison Myers",
  "Luke Barnes",
  "Samantha Bryant",
  "Gabriel Vasquez",
  "Avery Sullivan",
  "Jackson Cox",
  "Bella Gray",
  "David James",
  "Layla Alexander",
  "Oliver Washington",
  "Sophia Price",
  "Joseph Rogers",
  "Harper Hughes",
  "Michael Richardson",
  "Evelyn Brooks",
  "Andrew Kelly",
  "Avery Coleman",
  "Ella Mitchell",
  "Alexander Long",
  "Chloe Watson",
  "Matthew Patterson",
  "Grace Sanchez",
];
