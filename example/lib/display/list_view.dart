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
  return SafeArea(child: _buildUseCase(context, true));
}

Widget _buildUseCase(BuildContext context, bool grouped) {
  final separeted =
      context.knobs.boolean(label: "Separated", initialValue: true);

  final separatorBuilder =
      separeted ? (context, item, index) => const Divider(height: 1) : null;

  // ignore: prefer_function_declarations_over_variables
  final itemBuilder = (context, item, index) {
    return ListTile(
      title: Text(item),
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

  _name.sort();

  if (grouped) {
    return RioListView<String, String>.groupedBuilder(
      items: _name,
      separatorBuilder: separatorBuilder,
      itemBuilder: itemBuilder,
      groupBy: (item) => item[0],
      headerBuilder: headerBuilder,
    );
  } else {
    return RioListView<String, String>.builder(
      items: _name,
      separatorBuilder: separatorBuilder,
      itemBuilder: (context, item, index) {
        return ListTile(
          title: Text(item),
        );
      },
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
