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
  return const Scaffold(body: SafeArea(child: _Example(grouped: false)));
}

@widgetbook.UseCase(
  name: 'grouped',
  type: RioListView,
  path: "Display",
)
Widget useCaseRioListViewGrouped(BuildContext context) {
  return const Scaffold(body: SafeArea(child: _Example(grouped: true)));
}

@widgetbook.UseCase(
  name: 'pull search + refresh',
  type: RioListView,
  path: "Display",
)
Widget useCaseRioListViewPullSearchRefresh(BuildContext context) {
  return const Scaffold(body: SafeArea(child: _PullSearchRefreshExample()));
}

class _Example extends StatefulWidget {
  const _Example({this.grouped = false});
  final bool grouped;

  @override
  State<_Example> createState() => _ExampleState();
}

class _ExampleState extends State<_Example> {
  final List<String> _selectedItems = [];

  RioListItemBuilder<String> itemBuilder = (context, itemInfo) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Text(itemInfo.value),
        ],
      ),
    );
  };

  RioListSepartorBuilder separatorBuilder = (context, index) {
    return const Divider(height: 1);
  };

  RioListGroupeHeaderBuilder headerBuilder = (context, state, group) {
    return Container(
      color: RioTheme.of(context).colorScheme.surface,
      padding: const EdgeInsets.all(8.0),
      child: Text(group),
    );
  };

  void onPressed(RioListItemInfo<String> item) {
    if (_selectedItems.contains(item.value)) {
      _selectedItems.remove(item.value);
    } else {
      _selectedItems.add(item.value);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final separeted =
        context.knobs.boolean(label: "Separated", initialValue: true);

    final borderRadius = context.knobs.double
        .slider(label: "Border Radius", initialValue: 10, min: 0, max: 32);

    final separatorBuilder =
        separeted ? (context, index) => const Divider(height: 1) : null;

    final buttonTheme = RioButtonTheme(
      borderRadius: BorderRadius.circular(borderRadius),
    );

    final slidableActionProps = RioListSlidableActionProps<String>(
      endActionsBuilder: (context, item) => [
        RioListSlidableAction(
          icon: Icons.edit,
          backgroundColor: RioTheme.of(context).colorScheme.surface,
          foregroundColor: RioTheme.of(context).colorScheme.onSurface,
          label: "Edit",
          onPressed: () => debugPrint("Edit $item"),
        ),
        RioListSlidableAction(
          icon: Icons.delete,
          backgroundColor: Theme.of(context).colorScheme.errorContainer,
          foregroundColor: Theme.of(context).colorScheme.onErrorContainer,
          label: "Delete",
          onPressed: () => debugPrint("Delete $item"),
        ),
      ],
    );

    if (widget.grouped) {
      final sticky = context.knobs.boolean(label: "Sticky", initialValue: true);
      final groupSpacing = context.knobs.double
          .slider(label: "Group Spacing", initialValue: 8, min: 0, max: 32);

      return RioListView<String, String>.groupedBuilder(
        items: _names,
        separatorBuilder: separatorBuilder,
        itemBuilder: itemBuilder,
        groupBy: (item) => item[0],
        itemSort: (a, b) => a.compareTo(b),
        groupSort: (a, b) => a.compareTo(b),
        headerBuilder: headerBuilder,
        sticky: sticky,
        groupSpacing: groupSpacing,
        onItemPressed: onPressed,
        selectedItems: _selectedItems,
        slidableActionProps: slidableActionProps,
        buttonTheme: buttonTheme,
      );
    } else {
      return RioListView<String, String>.builder(
        items: _names,
        itemBuilder: itemBuilder,
        separatorBuilder: separatorBuilder,
        itemSort: (a, b) => a.compareTo(b),
        onItemPressed: onPressed,
        selectedItems: _selectedItems,
        slidableActionProps: slidableActionProps,
        buttonTheme: buttonTheme,
      );
    }
  }
}

class _PullSearchRefreshExample extends StatefulWidget {
  const _PullSearchRefreshExample();

  @override
  State<_PullSearchRefreshExample> createState() =>
      _PullSearchRefreshExampleState();
}

class _PullSearchRefreshExampleState extends State<_PullSearchRefreshExample> {
  late List<String> _items;
  String _query = "";
  int _refreshCount = 0;

  @override
  void initState() {
    super.initState();
    _items = List<String>.from(_names);
  }

  Future<void> _onRefresh() async {
    await Future<void>.delayed(const Duration(milliseconds: 700));
    setState(() {
      _refreshCount += 1;
      _items = _items.reversed.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems = _items.where((name) {
      final query = _query.trim().toLowerCase();
      if (query.isEmpty) return true;
      return name.toLowerCase().contains(query);
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            "Pull down for search, pull further to refresh (${_refreshCount}x)",
          ),
        ),
        Expanded(
          child: RioListView<String, String>.builder(
            items: filteredItems,
            itemBuilder: (context, itemInfo) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Text(itemInfo.value),
              );
            },
            separatorBuilder: (context, index) => const Divider(height: 1),
            enablePullToSearch: true,
            enablePullToRefresh: true,
            onSearchChanged: (value) {
              setState(() {
                _query = value;
              });
            },
            onRefresh: _onRefresh,
            searchHintText: "Search names",
          ),
        ),
      ],
    );
  }
}

List<String> _names = [
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
