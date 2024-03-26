import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:rio/rio.dart';
import 'package:sliver_tools/sliver_tools.dart';

typedef RioSliverStickyHeaderState = SliverStickyHeaderState;
typedef RioListGroupeBy<Item, GroupeValue> = GroupeValue Function(Item item);
typedef RioListCanSelect<Item> = bool Function(Item item);
typedef RioListSort<T> = int Function(T a, T b);
typedef RioListGroupeHeaderBuilder<Item, GroupeValue> = Widget Function(
  BuildContext context,
  SliverStickyHeaderState state,
  GroupeValue groupe,
);
typedef RioListActionsBuilder<Item> = List<RioListSlidableAction> Function(
  BuildContext context,
  RioListItemInfo<Item> itemInfo,
);
typedef RioListItemBuilder<Item> = Widget Function(
  BuildContext context,
  RioListItemInfo<Item> itemInfo,
);

typedef RioListSepartorBuilder = Widget Function(
  BuildContext context,
  int index,
);

enum RioListSlidableActionMotion {
  behind,
  drawer,
  scroll,
  stretch,
}

class RioListItemInfo<Item> {
  final Item value;
  final int index;
  final bool selected;
  final bool canSelect;

  RioListItemInfo({
    required this.value,
    required this.index,
    required this.selected,
    required this.canSelect,
  });
}

Map<RioListSlidableActionMotion, Widget> _actionMotionMap = {
  RioListSlidableActionMotion.behind: const BehindMotion(),
  RioListSlidableActionMotion.drawer: const DrawerMotion(),
  RioListSlidableActionMotion.scroll: const ScrollMotion(),
  RioListSlidableActionMotion.stretch: const StretchMotion(),
};

class RioListSlidableActionProps<Item> {
  RioListSlidableActionProps({
    this.disabled = false,
    this.endActionsBuilder,
    this.startActionsBuilder,
    this.endExtentRatio = 0.5,
    this.startExtentRatio = 0.5,
    this.motion = RioListSlidableActionMotion.stretch,
  });
  final bool disabled;
  final RioListActionsBuilder<Item>? endActionsBuilder;
  final RioListActionsBuilder<Item>? startActionsBuilder;
  final double endExtentRatio;
  final double startExtentRatio;
  final RioListSlidableActionMotion motion;
}

class RioListSlidableAction {
  RioListSlidableAction({
    required this.onPressed,
    this.label,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.flex = 1,
  });
  final VoidCallback onPressed;
  final String? label;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final int flex;
}

class RioListView<Item, GroupeValue> extends StatelessWidget {
  const RioListView.builder({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.separatorBuilder,
    this.itemSort,
    this.onItemPressed,
    this.onItemSelected,
    this.buttonTheme,
    this.selectedButtonTheme,
    this.slidableActionProps,
    this.selectedItems = const [],
    this.canSelect,
  })  : headerBuilder = null,
        groupSpacing = 0,
        sticky = false,
        groupSort = null,
        firstHeaderPinned = false,
        groupBy = null;

  const RioListView.groupedBuilder({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.groupSort,
    this.itemSort,
    required RioListGroupeBy<Item, GroupeValue> this.groupBy,
    required RioListGroupeHeaderBuilder<Item, GroupeValue> this.headerBuilder,
    this.separatorBuilder,
    this.sticky = true,
    this.groupSpacing = 8,
    this.onItemPressed,
    this.onItemSelected,
    this.buttonTheme,
    this.selectedButtonTheme,
    this.slidableActionProps,
    this.firstHeaderPinned = false,
    this.selectedItems = const [],
    this.canSelect,
  });

  final RioListGroupeHeaderBuilder<Item, GroupeValue>? headerBuilder;
  final RioListItemBuilder<Item> itemBuilder;
  final RioListSepartorBuilder? separatorBuilder;
  final RioListSort<Item>? itemSort;
  final RioListSort<GroupeValue>? groupSort;
  final RioListGroupeBy<Item, GroupeValue>? groupBy;
  final RioListCanSelect<Item>? canSelect;
  final List<Item> items;
  final bool sticky;
  final double groupSpacing;
  final ValueChanged<RioListItemInfo<Item>>? onItemPressed;
  final ValueChanged<RioListItemInfo<Item>>? onItemSelected;
  final RioButtonTheme? buttonTheme;
  final RioListSlidableActionProps<Item>? slidableActionProps;
  final RioButtonTheme? selectedButtonTheme;
  final bool firstHeaderPinned;

  /// To use this, you must provide onItemPressed
  final List<Item> selectedItems;

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
            onItemPressed: onItemPressed,
            buttonTheme: buttonTheme,
            firstHeaderPinned: firstHeaderPinned,
            selectedButtonTheme: selectedButtonTheme,
            selectedItems: selectedItems,
            slidableActionProps: slidableActionProps,
            canSelect: canSelect,
          ),
        if (groupBy == null)
          RioListViewSliver<Item, GroupeValue>.builder(
            items: items,
            itemBuilder: itemBuilder,
            separatorBuilder: separatorBuilder,
            itemSort: itemSort,
            onItemPressed: onItemPressed,
            buttonTheme: buttonTheme,
            slidableActionProps: slidableActionProps,
            selectedButtonTheme: selectedButtonTheme,
            selectedItems: selectedItems,
            canSelect: canSelect,
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
    this.onItemPressed,
    this.onItemSelected,
    this.buttonTheme,
    this.selectedButtonTheme,
    this.slidableActionProps,
    this.selectedItems = const [],
    this.canSelect,
  })  : headerBuilder = null,
        groupSpacing = 0,
        sticky = false,
        groupSort = null,
        firstHeaderPinned = false,
        groupBy = null;

  const RioListViewSliver.groupedBuilder({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.groupSort,
    this.itemSort,
    required RioListGroupeBy<Item, GroupeValue> this.groupBy,
    required RioListGroupeHeaderBuilder<Item, GroupeValue> this.headerBuilder,
    this.separatorBuilder,
    this.sticky = true,
    this.groupSpacing = 8,
    this.onItemPressed,
    this.onItemSelected,
    this.buttonTheme,
    this.selectedButtonTheme,
    this.slidableActionProps,
    this.firstHeaderPinned = false,
    this.selectedItems = const [],
    this.canSelect,
  });

  final RioListGroupeHeaderBuilder<Item, GroupeValue>? headerBuilder;
  final RioListItemBuilder<Item> itemBuilder;
  final RioListSepartorBuilder? separatorBuilder;
  final RioListGroupeBy<Item, GroupeValue>? groupBy;
  final RioListSort<Item>? itemSort;
  final RioListSort<GroupeValue>? groupSort;
  final RioListCanSelect<Item>? canSelect;
  final List<Item> items;
  final bool sticky;
  final double groupSpacing;
  final ValueChanged<RioListItemInfo<Item>>? onItemPressed;
  final ValueChanged<RioListItemInfo<Item>>? onItemSelected;
  final RioButtonTheme? buttonTheme;
  final RioButtonTheme? selectedButtonTheme;
  final RioListSlidableActionProps<Item>? slidableActionProps;
  final bool firstHeaderPinned;

  /// To use this, you must provide onItemPressed
  final List<Item> selectedItems;

  @override
  Widget build(BuildContext context) {
    final items = List<Item>.from(this.items);
    if (itemSort != null) items.sort(itemSort!);

    if (groupBy != null) {
      return _buildGroupList(items);
    }

    return _buildList(items);
  }

  Widget _buildButton(
    BuildContext context, {
    required RioListItemInfo<Item> itemInfo,
  }) {
    final childWidget = itemBuilder.call(context, itemInfo);
    if (onItemPressed != null ||
        (onItemSelected != null && itemInfo.canSelect)) {
      RioButtonTheme buttonTheme = RioButtonTheme(
        padding: EdgeInsets.zero,
        variant:
            itemInfo.selected ? RioButtonVariant.soft : RioButtonVariant.plain,
        color: RioTheme.of(context).colorScheme.onSurface,
      ).merge(this.buttonTheme).merge(selectedButtonTheme);

      return RioButton(
        onPressed: () async {
          await Slidable.of(context)?.close();
          onItemPressed?.call(itemInfo);
          onItemSelected?.call(itemInfo);
        },
        theme: buttonTheme,
        child: childWidget,
      );
    }
    return childWidget;
  }

  Widget? _buildItem(BuildContext context, Item item, int index) {
    final selected = selectedItems.contains(item);
    final canSelect = this.canSelect?.call(item) ?? true;
    final itemInfo = RioListItemInfo<Item>(
      value: item,
      index: index,
      selected: selected,
      canSelect: canSelect,
    );
    if (slidableActionProps != null) {
      return Slidable(
        key: Key(index.toString()),
        enabled: !slidableActionProps!.disabled,
        startActionPane: slidableActionProps!.startActionsBuilder != null
            ? ActionPane(
                extentRatio: slidableActionProps!.endExtentRatio,
                motion: _actionMotionMap[slidableActionProps!.motion]!,
                children: slidableActionProps?.startActionsBuilder
                        ?.call(context, itemInfo)
                        .map(
                          (action) => _SlidableActino<Item>(
                            action: action,
                            item: item,
                            borderRadius: buttonTheme?.borderRadius,
                          ),
                        )
                        .toList() ??
                    [],
              )
            : null,
        endActionPane: slidableActionProps!.endActionsBuilder != null
            ? ActionPane(
                extentRatio: slidableActionProps!.endExtentRatio,
                motion: _actionMotionMap[slidableActionProps!.motion]!,
                children: slidableActionProps?.endActionsBuilder
                        ?.call(context, itemInfo)
                        .map(
                          (action) => _SlidableActino<Item>(
                            action: action,
                            item: item,
                            borderRadius: buttonTheme?.borderRadius,
                          ),
                        )
                        .toList() ??
                    [],
              )
            : null,
        child: Builder(
          builder: (context) {
            return _buildButton(
              context,
              itemInfo: itemInfo,
            );
          },
        ),
      );
    }

    return _buildButton(
      context,
      itemInfo: itemInfo,
    );
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

  Widget _buildGroupList(List<Item> items) {
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
        if (!firstHeaderPinned) SliverStickyHeader(),
        ...listViews,
      ],
    );
  }
}

class _SlidableActino<Item> extends StatelessWidget {
  const _SlidableActino({
    required this.action,
    required this.item,
    this.borderRadius,
  });
  final RioListSlidableAction action;
  final Item item;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    final foregroundColor =
        action.foregroundColor ?? RioTheme.of(context).colorScheme.onSurface;
    return Expanded(
      flex: action.flex,
      child: RioButton(
        onPressed: () {
          Slidable.of(context)?.close();
          action.onPressed();
        },
        theme: RioButtonTheme(
          color: action.backgroundColor,
          padding: EdgeInsets.zero,
          borderRadius: borderRadius,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (action.icon != null)
              Flexible(
                child: Icon(
                  action.icon!,
                  color: foregroundColor,
                ),
              ),
            if (action.label != null)
              Flexible(
                child: Text(
                  action.label!,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: foregroundColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
