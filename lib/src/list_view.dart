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

class RioListView<Item, GroupeValue> extends StatefulWidget {
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
    this.isItemSelected,
    this.enablePullToSearch = false,
    this.enablePullToRefresh = false,
    this.onRefresh,
    this.onSearchChanged,
    this.searchHintText = 'Search',
    this.pullToSearchTriggerOffset = 56,
  })  : headerBuilder = null,
        assert(
          !enablePullToRefresh || onRefresh != null,
          'onRefresh must be provided when enablePullToRefresh is true',
        ),
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
    this.isItemSelected,
    this.enablePullToSearch = false,
    this.enablePullToRefresh = false,
    this.onRefresh,
    this.onSearchChanged,
    this.searchHintText = 'Search',
    this.pullToSearchTriggerOffset = 56,
  }) : assert(
          !enablePullToRefresh || onRefresh != null,
          'onRefresh must be provided when enablePullToRefresh is true',
        );

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

  // Use this if you want custom selection logic
  final bool Function(Item item)? isItemSelected;

  /// To use this, you must provide onItemPressed
  final List<Item> selectedItems;

  /// Shows a search field after pulling down from the top.
  final bool enablePullToSearch;

  /// Triggers [onRefresh] when pulling down far enough.
  final bool enablePullToRefresh;

  /// Callback used by the pull-to-refresh interaction.
  final Future<void> Function()? onRefresh;

  /// Called whenever the value of the pull-to-search field changes.
  final ValueChanged<String>? onSearchChanged;

  /// Hint text shown in the pull-to-search field.
  final String searchHintText;

  /// Pull distance required to show the search field.
  final double pullToSearchTriggerOffset;

  @override
  State<RioListView<Item, GroupeValue>> createState() =>
      _RioListViewState<Item, GroupeValue>();
}

class _RioListViewState<Item, GroupeValue>
    extends State<RioListView<Item, GroupeValue>> {
  final TextEditingController _searchController = TextEditingController();
  bool _searchVisible = false;
  double _pullDistance = 0;

  bool get _hasPullFeatures =>
      widget.enablePullToSearch || widget.enablePullToRefresh;

  void _showSearchIfNeeded() {
    if (!widget.enablePullToSearch) return;
    if (_searchVisible) return;
    if (_pullDistance < widget.pullToSearchTriggerOffset) return;

    setState(() {
      _searchVisible = true;
    });
  }

  void _hideSearchIfNeeded(ScrollNotification notification) {
    if (!widget.enablePullToSearch || !_searchVisible) return;
    if (notification.metrics.pixels <= notification.metrics.minScrollExtent) {
      return;
    }
    setState(() {
      _searchVisible = false;
    });
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (!widget.enablePullToSearch) return false;

    final atTop = notification.metrics.extentBefore == 0;
    var deltaY = 0.0;

    if (notification is ScrollUpdateNotification) {
      deltaY = notification.dragDetails?.delta.dy ?? 0;
    } else if (notification is OverscrollNotification) {
      deltaY = notification.dragDetails?.delta.dy ?? 0;
    }

    if (deltaY > 0 && atTop) {
      _pullDistance += deltaY;
      _showSearchIfNeeded();
    }

    if (notification is ScrollUpdateNotification &&
        deltaY < 0 &&
        notification.metrics.pixels > notification.metrics.minScrollExtent) {
      _pullDistance = 0;
      _hideSearchIfNeeded(notification);
    }

    if (notification is ScrollEndNotification) {
      _pullDistance = 0;
    }

    return false;
  }

  Widget _buildSearchSliver() {
    if (!widget.enablePullToSearch) {
      return const SliverToBoxAdapter(
        child: SizedBox.shrink(),
      );
    }

    return SliverToBoxAdapter(
      child: RioExpandableVisibility(
        expanded: _searchVisible,
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 300),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: RioTextField(
            controller: _searchController,
            onChanged: widget.onSearchChanged,
            prefixIcon: const Icon(Icons.search),
            decoration: RioTextFieldDecoration(
              hintText: widget.searchHintText,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContentSliver() {
    if (widget.groupBy != null) {
      return RioListViewSliver<Item, GroupeValue>.groupedBuilder(
        items: widget.items,
        itemBuilder: widget.itemBuilder,
        groupBy: widget.groupBy!,
        headerBuilder: widget.headerBuilder!,
        separatorBuilder: widget.separatorBuilder,
        itemSort: widget.itemSort,
        groupSort: widget.groupSort,
        sticky: widget.sticky,
        groupSpacing: widget.groupSpacing,
        onItemPressed: widget.onItemPressed,
        buttonTheme: widget.buttonTheme,
        firstHeaderPinned: widget.firstHeaderPinned,
        selectedButtonTheme: widget.selectedButtonTheme,
        selectedItems: widget.selectedItems,
        isItemSelected: widget.isItemSelected,
        slidableActionProps: widget.slidableActionProps,
        canSelect: widget.canSelect,
      );
    }

    return RioListViewSliver<Item, GroupeValue>.builder(
      items: widget.items,
      itemBuilder: widget.itemBuilder,
      separatorBuilder: widget.separatorBuilder,
      itemSort: widget.itemSort,
      onItemPressed: widget.onItemPressed,
      buttonTheme: widget.buttonTheme,
      slidableActionProps: widget.slidableActionProps,
      selectedButtonTheme: widget.selectedButtonTheme,
      selectedItems: widget.selectedItems,
      isItemSelected: widget.isItemSelected,
      canSelect: widget.canSelect,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget child = NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: CustomScrollView(
        physics:
            _hasPullFeatures ? const AlwaysScrollableScrollPhysics() : null,
        slivers: [
          _buildSearchSliver(),
          _buildContentSliver(),
        ],
      ),
    );

    if (widget.enablePullToRefresh) {
      child = RefreshIndicator(
        onRefresh: widget.onRefresh!,
        backgroundColor: RioTheme.of(context).colorScheme.surface.withValues(alpha: 8.3),
        child: child,
      );
    }

    return child;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
    this.isItemSelected,
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
    this.isItemSelected,
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

  // Use this if you want custom selection logic
  final bool Function(Item item)? isItemSelected;

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
    final selected = isItemSelected?.call(item) ?? selectedItems.contains(item);
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
        groupTag: 1,
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
