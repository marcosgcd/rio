import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:sliver_tools/sliver_tools.dart';

typedef RioSliverStickyHeaderState = SliverStickyHeaderState;
typedef RioSliverGroupeBy<Item, GroupeValue> = GroupeValue Function(Item item);
typedef RioSliverGroupeHeaderBuilder<Item, GroupeValue> = Widget Function(
  BuildContext context,
  SliverStickyHeaderState state,
  GroupeValue groupe,
);
typedef RioListSliverItemBuilder<Item> = Widget Function(
  BuildContext context,
  Item item,
  int index,
);

class RioListView<Item, GroupeValue> extends StatelessWidget {
  const RioListView.builder({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.separatorBuilder,
  })  : headerBuilder = null,
        groupBy = null;

  const RioListView.groupedBuilder({
    super.key,
    required this.items,
    required this.itemBuilder,
    required RioSliverGroupeBy<Item, GroupeValue> this.groupBy,
    required RioSliverGroupeHeaderBuilder<Item, GroupeValue> this.headerBuilder,
    this.separatorBuilder,
  });

  final RioSliverGroupeHeaderBuilder<Item, GroupeValue>? headerBuilder;
  final RioListSliverItemBuilder<Item> itemBuilder;
  final RioListSliverItemBuilder<Item>? separatorBuilder;
  final RioSliverGroupeBy<Item, GroupeValue>? groupBy;
  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        if (groupBy != null)
          RioListViewSliver.groupedBuilder(
            items: items,
            itemBuilder: itemBuilder,
            groupBy: groupBy!,
            headerBuilder: headerBuilder!,
            separatorBuilder: separatorBuilder,
          ),
        if (groupBy == null)
          RioListViewSliver.builder(
            items: items,
            itemBuilder: itemBuilder,
            separatorBuilder: separatorBuilder,
          ),
      ],
    );
  }
}

class RioListViewSliver<Item, GroupeValue> extends StatelessWidget {
  const RioListViewSliver.builder({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.separatorBuilder,
  })  : headerBuilder = null,
        groupBy = null;

  const RioListViewSliver.groupedBuilder({
    super.key,
    required this.items,
    required this.itemBuilder,
    required RioSliverGroupeBy<Item, GroupeValue> this.groupBy,
    required RioSliverGroupeHeaderBuilder<Item, GroupeValue> this.headerBuilder,
    this.separatorBuilder,
  });

  final RioSliverGroupeHeaderBuilder<Item, GroupeValue>? headerBuilder;
  final RioListSliverItemBuilder<Item> itemBuilder;
  final RioListSliverItemBuilder<Item>? separatorBuilder;
  final RioSliverGroupeBy<Item, GroupeValue>? groupBy;
  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    if (groupBy != null) {
      return _buildGroupList();
    }

    return _buildList(items);
  }

  Widget? _buildItem(BuildContext context, Item item, int index) {
    return itemBuilder.call(context, item, index);
  }

  Widget _buildList(
    List<Item> items, {
    int startIndex = 0,
  }) {
    if (separatorBuilder != null) {
      return SliverList.separated(
        itemCount: items.length,
        separatorBuilder: (context, index) => separatorBuilder!.call(
          context,
          items[index],
          index + startIndex,
        ),
        itemBuilder: (context, index) => _buildItem(
          context,
          items[index],
          index + startIndex,
        ),
      );
    }
    return SliverList.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => _buildItem(
        context,
        items[index],
        index + startIndex,
      ),
    );
  }

  Widget _buildGroupList() {
    final Map<GroupeValue, List<Item>> groups = {};

    if (groupBy != null) {
      for (final item in items) {
        final key = groupBy?.call(item);
        if (key != null) {
          groups.putIfAbsent(key, () => []);
          groups[key]?.add(item);
        }
      }
    }

    final List<Widget> listViews = [];
    var startIndex = 0;
    for (var i = 0; i < groups.length; i++) {
      final group = groups.entries.elementAt(i);

      listViews.add(
        SliverStickyHeader.builder(
          builder: (context, state) => headerBuilder!.call(
            context,
            state,
            group.key,
          ),
          sliver: _buildList(group.value, startIndex: startIndex),
        ),
      );
      startIndex += group.value.length;
    }

    return MultiSliver(
      children: [
        SliverStickyHeader(),
        ...listViews,
      ],
    );
  }
}
