import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:sliver_tools/sliver_tools.dart';

typedef RioSliverStickyHeaderState = SliverStickyHeaderState;
typedef RioSliverGroupeBy<Item, GroupeValue> = GroupeValue Function(Item item);
typedef RioSliverSort<T> = int Function(T a, T b);
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
    this.itemSort,
  })  : headerBuilder = null,
        groupSpacing = 0,
        sticky = false,
        groupSort = null,
        groupBy = null;

  const RioListView.groupedBuilder({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.groupSort,
    this.itemSort,
    required RioSliverGroupeBy<Item, GroupeValue> this.groupBy,
    required RioSliverGroupeHeaderBuilder<Item, GroupeValue> this.headerBuilder,
    this.separatorBuilder,
    this.sticky = true,
    this.groupSpacing = 8,
  });

  final RioSliverGroupeHeaderBuilder<Item, GroupeValue>? headerBuilder;
  final RioListSliverItemBuilder<Item> itemBuilder;
  final RioListSliverItemBuilder<Item>? separatorBuilder;
  final RioSliverSort<Item>? itemSort;
  final RioSliverSort<GroupeValue>? groupSort;
  final RioSliverGroupeBy<Item, GroupeValue>? groupBy;
  final List<Item> items;
  final bool sticky;
  final double groupSpacing;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        if (groupBy != null)
          RioListViewSliver<Item, GroupeValue>.groupedBuilder(
            items: items,
            itemBuilder: itemBuilder,
            groupBy: groupBy!,
            headerBuilder: headerBuilder!,
            separatorBuilder: separatorBuilder,
            itemSort: itemSort,
            groupSort: groupSort,
            sticky: sticky,
            groupSpacing: groupSpacing,
          ),
        if (groupBy == null)
          RioListViewSliver<Item, GroupeValue>.builder(
            items: items,
            itemBuilder: itemBuilder,
            separatorBuilder: separatorBuilder,
            itemSort: itemSort,
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
    this.itemSort,
  })  : headerBuilder = null,
        groupSpacing = 0,
        sticky = false,
        groupSort = null,
        groupBy = null;

  const RioListViewSliver.groupedBuilder({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.groupSort,
    this.itemSort,
    required RioSliverGroupeBy<Item, GroupeValue> this.groupBy,
    required RioSliverGroupeHeaderBuilder<Item, GroupeValue> this.headerBuilder,
    this.separatorBuilder,
    this.sticky = true,
    this.groupSpacing = 8,
  });

  final RioSliverGroupeHeaderBuilder<Item, GroupeValue>? headerBuilder;
  final RioListSliverItemBuilder<Item> itemBuilder;
  final RioListSliverItemBuilder<Item>? separatorBuilder;
  final RioSliverGroupeBy<Item, GroupeValue>? groupBy;
  final RioSliverSort<Item>? itemSort;
  final RioSliverSort<GroupeValue>? groupSort;
  final List<Item> items;
  final bool sticky;
  final double groupSpacing;

  @override
  Widget build(BuildContext context) {
    if (itemSort != null) items.sort(itemSort!);

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

    final groupItems = groups.keys.toList();
    if (groupSort != null) {
      groupItems.sort(groupSort!);
    }

    for (var i = 0; i < groupItems.length; i++) {
      final groupKey = groupItems[i];
      final items = groups[groupKey]!;

      listViews.add(
        SliverStickyHeader.builder(
          sticky: sticky,
          builder: (context, state) => headerBuilder!.call(
            context,
            state,
            groupKey,
          ),
          sliver: SliverPadding(
            padding: EdgeInsets.only(bottom: groupSpacing),
            sliver: _buildList(items, startIndex: startIndex),
          ),
        ),
      );
      startIndex += items.length;
    }

    return MultiSliver(
      children: [
        SliverStickyHeader(),
        ...listViews,
      ],
    );
  }
}
