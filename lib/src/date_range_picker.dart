import 'package:flutter/material.dart';
import 'package:rio/rio.dart';

@immutable
class RioDateRangeHighlight {
  const RioDateRangeHighlight({required this.range, this.color});

  final DateTimeRange range;
  final Color? color;
}

@immutable
class RioCalendarMarker {
  const RioCalendarMarker({required this.date, this.color});

  final DateTime date;
  final Color? color;
}

class RioDateRangePicker extends StatefulWidget {
  const RioDateRangePicker({
    super.key,
    required this.value,
    this.onChanged,
    this.theme,
    this.decoration,
    this.modalTheme,
    this.disabled = false,
    this.clearable = true,
    this.minimumDate,
    this.maximumDate,
    this.initialMonth,
    this.modalHeight = 500,
    this.clearTooltip,
    this.clearText,
    this.highlightedDates = const <DateTime>{},
    this.highlightedDateRanges = const <DateTimeRange>[],
    this.highlightedDateRangeStyles = const <RioDateRangeHighlight>[],
    this.dateMarkers = const <RioCalendarMarker>[],
    this.highlightedDateColor,
    this.highlightToday = true,
  }) : assert(modalHeight > 0, 'modalHeight must be greater than 0');

  final DateTimeRange? value;
  final ValueChanged<DateTimeRange?>? onChanged;
  final RioTextFieldTheme? theme;
  final RioTextFieldDecoration? decoration;
  final RioModalTheme? modalTheme;
  final bool disabled;
  final bool clearable;
  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final DateTime? initialMonth;
  final double modalHeight;
  final String? clearTooltip;
  final String? clearText;
  final Set<DateTime> highlightedDates;
  final List<DateTimeRange> highlightedDateRanges;
  final List<RioDateRangeHighlight> highlightedDateRangeStyles;
  final List<RioCalendarMarker> dateMarkers;
  final Color? highlightedDateColor;
  final bool highlightToday;

  @override
  State<RioDateRangePicker> createState() => _RioDateRangePickerState();
}

class _RioDateRangePickerState extends State<RioDateRangePicker> {
  late final TextEditingController _controller;

  bool get _isEnabled => !widget.disabled && widget.onChanged != null;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    _syncControllerText();
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant RioDateRangePicker oldWidget) {
    _syncControllerText();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = RioTheme.of(context).colorScheme;
    final iconColor = _isEnabled
        ? colorScheme.hint
        : colorScheme.onSurface.withValues(alpha: 0.38);
    final hasValue = widget.value != null;
    final decoration = widget.decoration?.copyWith(
      hintText: hasValue ? null : widget.decoration?.hintText,
    );

    return RioTextField(
      readOnly: true,
      showCursor: false,
      controller: _controller,
      disabled: !_isEnabled,
      theme: widget.theme,
      decoration: decoration,
      suffixIcon: Icon(
        Icons.date_range_rounded,
        size: 20,
        color: iconColor,
      ),
      mouseCursor:
          _isEnabled ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
      onTap: _isEnabled ? _openPicker : null,
    );
  }

  void _syncControllerText() {
    final value = widget.value;
    final text = value == null
        ? ''
        : _formatRange(
            _normalizeDate(value.start),
            _normalizeDate(value.end),
          );
    if (_controller.text == text) {
      return;
    }
    _controller.value = TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }

  DateTime _normalizeDate(DateTime value) {
    return DateTime(value.year, value.month, value.day);
  }

  String _formatDate(DateTime value) {
    final day = value.day.toString().padLeft(2, '0');
    final month = value.month.toString().padLeft(2, '0');
    final year = value.year.toString().padLeft(4, '0');
    return '$day.$month.$year';
  }

  String _formatRange(DateTime start, DateTime end) {
    if (_isSameDate(start, end)) {
      return _formatDate(start);
    }
    return '${_formatDate(start)} - ${_formatDate(end)}';
  }

  bool _isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  Future<void> _openPicker() async {
    final clearText = widget.clearText ?? 'Clear';
    final viewportMaxHeight =
        (MediaQuery.of(context).size.height - 78).clamp(1.0, double.infinity);
    final effectiveModalHeight =
        widget.modalHeight.clamp(1.0, viewportMaxHeight);
    final modalTheme = const RioModalTheme(
      padding: EdgeInsets.zero,
      useSafeArea: false,
    ).merge(widget.modalTheme).copyWith(
          maxHeight: effectiveModalHeight,
        );

    await showRioModal<void>(
      context,
      theme: modalTheme,
      floatingHeader: widget.decoration?.label,
      builder: (_) {
        final currentValue = widget.value;
        final selectionLabel = currentValue == null
            ? 'Select date range'
            : _formatRange(
                _normalizeDate(currentValue.start),
                _normalizeDate(currentValue.end),
              );

        return _RioDateRangePickerModal(
          selectionLabel: selectionLabel,
          value: widget.value,
          modalHeight: effectiveModalHeight,
          minimumDate: widget.minimumDate,
          maximumDate: widget.maximumDate,
          initialMonth: widget.initialMonth,
          clearable: widget.clearable,
          clearTooltip: widget.clearTooltip,
          clearText: clearText,
          highlightedDates: widget.highlightedDates,
          highlightedDateRanges: widget.highlightedDateRanges,
          highlightedDateRangeStyles: widget.highlightedDateRangeStyles,
          dateMarkers: widget.dateMarkers,
          highlightedDateColor: widget.highlightedDateColor,
          highlightToday: widget.highlightToday,
          onChanged: (value) {
            widget.onChanged?.call(value);
          },
        );
      },
    );
  }
}

class _RioDateRangePickerModal extends StatelessWidget {
  const _RioDateRangePickerModal({
    required this.selectionLabel,
    required this.value,
    required this.onChanged,
    required this.modalHeight,
    this.minimumDate,
    this.maximumDate,
    this.initialMonth,
    this.clearable = true,
    this.clearTooltip,
    this.clearText = 'Clear',
    this.highlightedDates = const <DateTime>{},
    this.highlightedDateRanges = const <DateTimeRange>[],
    this.highlightedDateRangeStyles = const <RioDateRangeHighlight>[],
    this.dateMarkers = const <RioCalendarMarker>[],
    this.highlightedDateColor,
    this.highlightToday = true,
  });

  final String selectionLabel;
  final DateTimeRange? value;
  final ValueChanged<DateTimeRange?> onChanged;
  final double modalHeight;
  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final DateTime? initialMonth;
  final bool clearable;
  final String? clearTooltip;
  final String clearText;
  final Set<DateTime> highlightedDates;
  final List<DateTimeRange> highlightedDateRanges;
  final List<RioDateRangeHighlight> highlightedDateRangeStyles;
  final List<RioCalendarMarker> dateMarkers;
  final Color? highlightedDateColor;
  final bool highlightToday;

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w700,
          color: RioTheme.of(context).colorScheme.onSurface,
        );

    return SafeArea(
      top: false,
      child: SizedBox(
        height: modalHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      selectionLabel,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: titleStyle,
                    ),
                  ),
                  if (clearable && value != null)
                    RioTooltip(
                      message: clearTooltip,
                      child: RioButton(
                        theme: const RioButtonTheme(
                          variant: RioButtonVariant.plain,
                          margin: EdgeInsets.zero,
                        ),
                        onPressed: () {
                          onChanged(null);
                          Navigator.of(context).pop();
                        },
                        child: Text(clearText),
                      ),
                    ),
                ],
              ),
            ),
            const RioDivider(),
            Expanded(
              child: RioDateRangeCalendar(
                value: value,
                onChanged: onChanged,
                minimumDate: minimumDate,
                maximumDate: maximumDate,
                initialMonth: initialMonth,
                highlightedDates: highlightedDates,
                highlightedDateRanges: highlightedDateRanges,
                highlightedDateRangeStyles: highlightedDateRangeStyles,
                dateMarkers: dateMarkers,
                highlightedDateColor: highlightedDateColor,
                highlightToday: highlightToday,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RioDateRangeCalendar extends StatefulWidget {
  const RioDateRangeCalendar({
    super.key,
    required this.value,
    this.onChanged,
    this.readOnly = false,
    this.minimumDate,
    this.maximumDate,
    this.initialMonth,
    this.showWeekdayHeader = true,
    this.unboundedHeight = 420,
    this.highlightedDates = const <DateTime>{},
    this.highlightedDateRanges = const <DateTimeRange>[],
    this.highlightedDateRangeStyles = const <RioDateRangeHighlight>[],
    this.dateMarkers = const <RioCalendarMarker>[],
    this.highlightedDateColor,
    this.highlightToday = true,
  }) : assert(unboundedHeight > 0, 'unboundedHeight must be greater than 0');

  final DateTimeRange? value;
  final ValueChanged<DateTimeRange?>? onChanged;
  final bool readOnly;
  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final DateTime? initialMonth;
  final bool showWeekdayHeader;
  final double unboundedHeight;
  final Set<DateTime> highlightedDates;
  final List<DateTimeRange> highlightedDateRanges;
  final List<RioDateRangeHighlight> highlightedDateRangeStyles;
  final List<RioCalendarMarker> dateMarkers;
  final Color? highlightedDateColor;
  final bool highlightToday;

  @override
  State<RioDateRangeCalendar> createState() => _RioDateRangeCalendarState();
}

class _RioDateRangeCalendarState extends State<RioDateRangeCalendar> {
  static const _weekdaysPerRow = 7;

  final GlobalKey _centerSliverKey = GlobalKey();
  late DateTime? _selectedStart;
  late DateTime? _selectedEnd;
  late DateTime _baseMonth;
  late Set<int> _highlightedDateKeys;
  late List<DateTimeRange> _highlightedDateRanges;
  late List<_NormalizedHighlightedRange> _highlightedDateRangeStyles;
  late Map<int, RioCalendarMarker> _dateMarkersByKey;

  bool get _isInteractive => !widget.readOnly && widget.onChanged != null;

  @override
  void initState() {
    super.initState();
    _syncSelectionFromWidget();
    _syncHighlightedDatesFromWidget();
    _baseMonth = _resolveInitialMonth();
  }

  @override
  void didUpdateWidget(covariant RioDateRangeCalendar oldWidget) {
    final shouldSyncSelection = !_isSameRange(oldWidget.value, widget.value);
    final didMinDateChange =
        !_isSameDateOrNull(oldWidget.minimumDate, widget.minimumDate);
    final didMaxDateChange =
        !_isSameDateOrNull(oldWidget.maximumDate, widget.maximumDate);

    if (shouldSyncSelection) {
      _syncSelectionFromWidget();
    }
    _syncHighlightedDatesFromWidget();
    if (didMinDateChange || didMaxDateChange) {
      _baseMonth = _clampMonthToBounds(_baseMonth);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = RioTheme.of(context).colorScheme;
    final localizations = MaterialLocalizations.of(context);
    final weekdayLabels = _weekdayLabels(localizations);
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.showWeekdayHeader) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 6),
            child: Row(
              children: [
                for (final label in weekdayLabels)
                  Expanded(
                    child: Center(
                      child: Text(
                        label,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: colorScheme.caption,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const RioDivider(),
        ],
        Expanded(
          child: CustomScrollView(
            center: _centerSliverKey,
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final month = _monthForOffset(-(index + 1));
                    return _buildMonthSection(
                      context,
                      month,
                      localizations,
                    );
                  },
                  childCount: _previousMonthCount,
                ),
              ),
              SliverList(
                key: _centerSliverKey,
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final month = _monthForOffset(index);
                    return _buildMonthSection(
                      context,
                      month,
                      localizations,
                    );
                  },
                  childCount: _currentAndFutureMonthCount,
                ),
              ),
            ],
          ),
        ),
      ],
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxHeight.isFinite) {
          return content;
        }
        return SizedBox(
          height: widget.unboundedHeight,
          child: content,
        );
      },
    );
  }

  Widget _buildMonthSection(
    BuildContext context,
    DateTime month,
    MaterialLocalizations localizations,
  ) {
    final colorScheme = RioTheme.of(context).colorScheme;
    final days = _monthCellsForMonth(month, localizations.firstDayOfWeekIndex);
    final titleStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w700,
          color: colorScheme.onSurface,
        );

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 6, 8, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              localizations.formatMonthYear(month),
              style: titleStyle,
            ),
          ),
          const SizedBox(height: 4),
          GridView.builder(
            shrinkWrap: true,
            primary: false,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: days.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _weekdaysPerRow,
              mainAxisSpacing: 2,
              crossAxisSpacing: 0,
              childAspectRatio: 1.1,
            ),
            itemBuilder: (context, index) {
              final day = days[index];
              return _buildDayCell(context, day);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDayCell(BuildContext context, DateTime? day) {
    if (day == null) {
      return const SizedBox.expand();
    }

    final colorScheme = RioTheme.of(context).colorScheme;
    final normalizedDay = _normalizeDate(day);
    final isWithinBounds = _isSelectable(normalizedDay);
    final selectable = _isInteractive && isWithinBounds;
    final isStart =
        _selectedStart != null && _isSameDate(_selectedStart!, normalizedDay);
    final isEnd =
        _selectedEnd != null && _isSameDate(_selectedEnd!, normalizedDay);
    final isBoundary = isStart || isEnd;
    final hasCompletedRange = _selectedStart != null && _selectedEnd != null;
    final isSingleDayRange =
        hasCompletedRange && _isSameDate(_selectedStart!, _selectedEnd!);
    final isInCompletedRange = hasCompletedRange &&
        !normalizedDay.isBefore(_selectedStart!) &&
        !normalizedDay.isAfter(_selectedEnd!);
    final showRangeBand = isInCompletedRange && !isSingleDayRange;
    final highlightBaseColor =
        widget.highlightedDateColor ?? colorScheme.primary;
    final dayHighlightColor = _highlightColorForDay(
      normalizedDay,
      fallbackColor: highlightBaseColor,
    );
    final isTodayHighlighted = _isTodayHighlighted(normalizedDay);
    final isCustomHighlighted = _isCustomHighlightedDate(normalizedDay);
    final isHighlighted = dayHighlightColor != null;
    final showHighlightedBackground = isHighlighted;
    final previousHighlightColor = showHighlightedBackground
        ? _highlightColorForDay(
            normalizedDay.subtract(const Duration(days: 1)),
            fallbackColor: highlightBaseColor,
          )
        : null;
    final nextHighlightColor = showHighlightedBackground
        ? _highlightColorForDay(
            normalizedDay.add(const Duration(days: 1)),
            fallbackColor: highlightBaseColor,
          )
        : null;
    final hasHighlightedPrev = showHighlightedBackground &&
        _isSameHighlightColor(previousHighlightColor, dayHighlightColor);
    final hasHighlightedNext = showHighlightedBackground &&
        _isSameHighlightColor(nextHighlightColor, dayHighlightColor);
    final isHighlightStart = !hasHighlightedPrev;
    final isHighlightEnd = !hasHighlightedNext;
    final showHighlightedBand =
        showHighlightedBackground && (!isHighlightStart || !isHighlightEnd);
    final showIsolatedHighlight =
        showHighlightedBackground && !showHighlightedBand;
    final brightness = Theme.of(context).brightness;
    final isLightTheme = brightness == Brightness.light;
    final foregroundColor = !isWithinBounds
        ? colorScheme.caption.withValues(alpha: 0.35)
        : isBoundary
            ? colorScheme.onPrimary
            : colorScheme.onSurface;
    final resolvedHighlightColor = dayHighlightColor ?? highlightBaseColor;
    final hasExplicitCustomColor = isCustomHighlighted &&
        _customHighlightColorForDay(normalizedDay) != null;
    final highlightFillOpacity = isLightTheme ? 0.24 : 0.16;
    final todayFillOpacity = isLightTheme ? 0.12 : 0.22;
    final baseHighlightOverlayColor = hasExplicitCustomColor
        ? resolvedHighlightColor
        : resolvedHighlightColor.withValues(alpha: highlightFillOpacity);
    final highlightBandColor = RioColorUtils.getSolidColorFromTransparent(
      baseHighlightOverlayColor,
      colorScheme.surface,
    );
    final isolatedHighlightColor = highlightBandColor;
    final rangeBandColor = RioColorUtils.getSolidColorFromTransparent(
      colorScheme.primary.withValues(alpha: 0.2),
      colorScheme.surface,
    );
    final dayLabel = Text(
      '${day.day}',
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: foregroundColor,
            fontWeight: isBoundary ? FontWeight.w700 : FontWeight.w500,
          ),
    );
    final boundaryInset = isBoundary && isHighlighted ? 2.0 : 0.0;
    final marker = _dateMarkersByKey[_dateKey(normalizedDay)];
    final markerColor = marker?.color;
    final resolvedMarkerColor = marker == null
        ? null
        : isBoundary
            ? colorScheme.onPrimary
            : !isWithinBounds
                ? (markerColor ?? colorScheme.primary).withValues(alpha: 0.4)
                : (markerColor ?? colorScheme.primary);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: selectable ? () => _onDayTapped(normalizedDay) : null,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          if (showHighlightedBand)
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: _RangeBandSegment(
                isStart: isHighlightStart,
                isEnd: isHighlightEnd,
                color: highlightBandColor,
                roundedCaps: true,
                halfCaps: false,
              ),
            ),
          if (showRangeBand)
            Positioned(
              top: 0,
              bottom: 0,
              left: isStart ? 0 : -0.8,
              right: isEnd ? 0 : -0.8,
              child: _RangeBandSegment(
                isStart: isStart,
                isEnd: isEnd,
                color: rangeBandColor,
              ),
            ),
          if (showIsolatedHighlight)
            SizedBox(
              width: 34,
              height: 34,
              child: Center(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: isolatedHighlightColor,
                    shape: BoxShape.circle,
                  ),
                  child: const SizedBox(width: 30, height: 30),
                ),
              ),
            ),
          if (isTodayHighlighted && !isBoundary)
            SizedBox(
              width: 34,
              height: 34,
              child: Center(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: resolvedHighlightColor.withValues(
                      alpha: todayFillOpacity,
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: resolvedHighlightColor.withValues(alpha: 0.95),
                      width: isLightTheme ? 2.0 : 1.6,
                    ),
                  ),
                  child: const SizedBox(width: 28, height: 28),
                ),
              ),
            ),
          SizedBox(
            width: 34,
            height: 34,
            child: isBoundary
                ? Padding(
                    padding: EdgeInsets.all(boundaryInset),
                    child: DecoratedBox(
                      decoration: isTodayHighlighted
                          ? BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: colorScheme.onPrimary.withValues(
                                  alpha: isLightTheme ? 0.92 : 0.84,
                                ),
                                width: 1.2,
                              ),
                            )
                          : const BoxDecoration(),
                      child: RioContainer(
                        theme: RioContainerTheme(
                          color: colorScheme.primary,
                        ),
                        child: Center(child: dayLabel),
                      ),
                    ),
                  )
                : Center(child: dayLabel),
          ),
          if (resolvedMarkerColor != null)
            Positioned(
              top: 3,
              child: IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: resolvedMarkerColor,
                    shape: BoxShape.circle,
                  ),
                  child: const SizedBox(width: 5, height: 5),
                ),
              ),
            ),
        ],
      ),
    );
  }

  DateTime _monthForOffset(int offset) {
    return DateTime(_baseMonth.year, _baseMonth.month + offset, 1);
  }

  int? get _previousMonthCount {
    final minimumDate = widget.minimumDate;
    if (minimumDate == null) {
      return null;
    }
    final baseIndex = _monthIndex(_baseMonth);
    final minIndex =
        _monthIndex(DateTime(minimumDate.year, minimumDate.month, 1));
    final count = baseIndex - minIndex;
    return count < 0 ? 0 : count;
  }

  int? get _currentAndFutureMonthCount {
    final maximumDate = widget.maximumDate;
    if (maximumDate == null) {
      return null;
    }
    final baseIndex = _monthIndex(_baseMonth);
    final maxIndex =
        _monthIndex(DateTime(maximumDate.year, maximumDate.month, 1));
    final count = (maxIndex - baseIndex) + 1;
    return count < 0 ? 0 : count;
  }

  int _monthIndex(DateTime month) {
    return month.year * 12 + month.month;
  }

  void _onDayTapped(DateTime day) {
    if (!_isInteractive || !_isSelectable(day)) {
      return;
    }

    late DateTimeRange nextRange;
    setState(() {
      final start = _selectedStart;
      final end = _selectedEnd;

      if (start == null || end == null) {
        _selectedStart = day;
        _selectedEnd = day;
        nextRange = DateTimeRange(start: day, end: day);
      } else if (_isSameDate(start, end)) {
        if (day.isBefore(start)) {
          _selectedStart = day;
          _selectedEnd = start;
          nextRange = DateTimeRange(start: day, end: start);
        } else {
          _selectedStart = start;
          _selectedEnd = day;
          nextRange = DateTimeRange(start: start, end: day);
        }
      } else {
        _selectedStart = day;
        _selectedEnd = day;
        nextRange = DateTimeRange(start: day, end: day);
      }
    });

    widget.onChanged?.call(nextRange);
  }

  List<String> _weekdayLabels(MaterialLocalizations localizations) {
    final weekdays = localizations.narrowWeekdays;
    final firstDayOfWeekIndex = localizations.firstDayOfWeekIndex;
    return [
      for (var i = 0; i < _weekdaysPerRow; i++)
        weekdays[(firstDayOfWeekIndex + i) % _weekdaysPerRow],
    ];
  }

  List<DateTime?> _monthCellsForMonth(
    DateTime month,
    int firstDayOfWeekIndex,
  ) {
    final monthStart = DateTime(month.year, month.month, 1);
    final monthStartWeekday = monthStart.weekday % _weekdaysPerRow;
    final leadingCells =
        (monthStartWeekday - firstDayOfWeekIndex + _weekdaysPerRow) %
            _weekdaysPerRow;
    final daysInMonth = DateUtils.getDaysInMonth(month.year, month.month);
    final usedCells = leadingCells + daysInMonth;
    final rowCount = (usedCells / _weekdaysPerRow).ceil();
    final cellCount = rowCount * _weekdaysPerRow;

    return List<DateTime?>.generate(
      cellCount,
      (index) {
        final day = index - leadingCells + 1;
        if (day < 1 || day > daysInMonth) {
          return null;
        }
        return DateTime(month.year, month.month, day);
      },
    );
  }

  DateTime _resolveInitialMonth() {
    final selectedStart = _selectedStart;
    final baseDate = selectedStart ?? widget.initialMonth ?? DateTime.now();
    final clampedDate = _clampToBounds(baseDate);
    return DateTime(clampedDate.year, clampedDate.month, 1);
  }

  DateTime _clampMonthToBounds(DateTime month) {
    var result = DateTime(month.year, month.month, 1);
    final min = widget.minimumDate;
    if (min != null) {
      final minMonth = DateTime(min.year, min.month, 1);
      if (result.isBefore(minMonth)) {
        result = minMonth;
      }
    }
    final max = widget.maximumDate;
    if (max != null) {
      final maxMonth = DateTime(max.year, max.month, 1);
      if (result.isAfter(maxMonth)) {
        result = maxMonth;
      }
    }
    return result;
  }

  DateTime _clampToBounds(DateTime value) {
    final normalizedValue = _normalizeDate(value);
    final min =
        widget.minimumDate == null ? null : _normalizeDate(widget.minimumDate!);
    final max =
        widget.maximumDate == null ? null : _normalizeDate(widget.maximumDate!);
    if (min != null && normalizedValue.isBefore(min)) {
      return min;
    }
    if (max != null && normalizedValue.isAfter(max)) {
      return max;
    }
    return normalizedValue;
  }

  bool _isSelectable(DateTime day) {
    final min =
        widget.minimumDate == null ? null : _normalizeDate(widget.minimumDate!);
    if (min != null && day.isBefore(min)) {
      return false;
    }
    final max =
        widget.maximumDate == null ? null : _normalizeDate(widget.maximumDate!);
    if (max != null && day.isAfter(max)) {
      return false;
    }
    return true;
  }

  DateTime _normalizeDate(DateTime value) {
    return DateTime(value.year, value.month, value.day);
  }

  void _syncHighlightedDatesFromWidget() {
    _highlightedDateKeys =
        widget.highlightedDates.map(_normalizeDate).map(_dateKey).toSet();
    _highlightedDateRanges =
        _normalizeAndMergeHighlightedRanges(widget.highlightedDateRanges);
    _highlightedDateRangeStyles = _normalizeAndMergeHighlightedRangeStyles(
      widget.highlightedDateRangeStyles,
    );
    _dateMarkersByKey = {
      for (final marker in widget.dateMarkers)
        _dateKey(_normalizeDate(marker.date)): RioCalendarMarker(
          date: _normalizeDate(marker.date),
          color: marker.color,
        ),
    };
  }

  List<DateTimeRange> _normalizeAndMergeHighlightedRanges(
    List<DateTimeRange> ranges,
  ) {
    if (ranges.isEmpty) {
      return const <DateTimeRange>[];
    }

    final normalizedRanges = ranges.map((range) {
      var start = _normalizeDate(range.start);
      var end = _normalizeDate(range.end);
      if (end.isBefore(start)) {
        final swap = start;
        start = end;
        end = swap;
      }
      return DateTimeRange(start: start, end: end);
    }).toList(growable: false)
      ..sort((a, b) => a.start.compareTo(b.start));

    final mergedRanges = <DateTimeRange>[];
    for (final range in normalizedRanges) {
      if (mergedRanges.isEmpty) {
        mergedRanges.add(range);
        continue;
      }

      final lastRange = mergedRanges.last;
      final joinsLast = !range.start.isAfter(
        lastRange.end.add(const Duration(days: 1)),
      );
      if (!joinsLast) {
        mergedRanges.add(range);
        continue;
      }

      final mergedEnd =
          range.end.isAfter(lastRange.end) ? range.end : lastRange.end;
      mergedRanges[mergedRanges.length - 1] = DateTimeRange(
        start: lastRange.start,
        end: mergedEnd,
      );
    }

    return mergedRanges;
  }

  List<_NormalizedHighlightedRange> _normalizeAndMergeHighlightedRangeStyles(
    List<RioDateRangeHighlight> ranges,
  ) {
    if (ranges.isEmpty) {
      return const <_NormalizedHighlightedRange>[];
    }

    final normalizedRanges = ranges.map((entry) {
      var start = _normalizeDate(entry.range.start);
      var end = _normalizeDate(entry.range.end);
      if (end.isBefore(start)) {
        final swap = start;
        start = end;
        end = swap;
      }
      return _NormalizedHighlightedRange(
        start: start,
        end: end,
        color: entry.color,
      );
    }).toList(growable: false)
      ..sort((a, b) => a.start.compareTo(b.start));

    final mergedRanges = <_NormalizedHighlightedRange>[];
    for (final range in normalizedRanges) {
      if (mergedRanges.isEmpty) {
        mergedRanges.add(range);
        continue;
      }

      final lastRange = mergedRanges.last;
      final joinsLast = !range.start.isAfter(
        lastRange.end.add(const Duration(days: 1)),
      );
      final canMerge = joinsLast && lastRange.color == range.color;
      if (!canMerge) {
        mergedRanges.add(range);
        continue;
      }

      final mergedEnd =
          range.end.isAfter(lastRange.end) ? range.end : lastRange.end;
      mergedRanges[mergedRanges.length - 1] = _NormalizedHighlightedRange(
        start: lastRange.start,
        end: mergedEnd,
        color: lastRange.color,
      );
    }

    return mergedRanges;
  }

  bool _isTodayHighlighted(DateTime day) {
    return widget.highlightToday &&
        _isSameDate(day, _normalizeDate(DateTime.now()));
  }

  bool _isCustomHighlightedDate(DateTime day) {
    if (_highlightStyleForDay(day) != null) {
      return true;
    }

    if (_highlightedDateKeys.contains(_dateKey(day))) {
      return true;
    }

    return _isDayInPlainHighlightedRange(day);
  }

  bool _isDayInPlainHighlightedRange(DateTime day) {
    for (final range in _highlightedDateRanges) {
      if (day.isBefore(range.start)) {
        return false;
      }
      if (!day.isAfter(range.end)) {
        return true;
      }
    }
    return false;
  }

  _NormalizedHighlightedRange? _highlightStyleForDay(DateTime day) {
    for (final range in _highlightedDateRangeStyles) {
      if (day.isBefore(range.start)) {
        return null;
      }
      if (!day.isAfter(range.end)) {
        return range;
      }
    }
    return null;
  }

  Color? _customHighlightColorForDay(DateTime day) {
    return _highlightStyleForDay(day)?.color;
  }

  Color? _highlightColorForDay(
    DateTime day, {
    required Color fallbackColor,
  }) {
    final styleMatch = _highlightStyleForDay(day);
    final hasPlainHighlight = _highlightedDateKeys.contains(_dateKey(day)) ||
        _isDayInPlainHighlightedRange(day);
    final isToday = _isTodayHighlighted(day);
    if (styleMatch == null && !hasPlainHighlight && !isToday) {
      return null;
    }
    return styleMatch?.color ?? fallbackColor;
  }

  bool _isSameHighlightColor(Color? left, Color? right) {
    if (left == null || right == null) {
      return false;
    }
    return left == right;
  }

  int _dateKey(DateTime value) {
    return value.year * 10000 + value.month * 100 + value.day;
  }

  void _syncSelectionFromWidget() {
    _selectedStart =
        widget.value == null ? null : _normalizeDate(widget.value!.start);
    _selectedEnd =
        widget.value == null ? null : _normalizeDate(widget.value!.end);
  }

  bool _isSameRange(DateTimeRange? a, DateTimeRange? b) {
    if (a == null || b == null) {
      return a == b;
    }
    return _isSameDate(a.start, b.start) && _isSameDate(a.end, b.end);
  }

  bool _isSameDateOrNull(DateTime? a, DateTime? b) {
    if (a == null || b == null) {
      return a == b;
    }
    return _isSameDate(a, b);
  }

  bool _isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}

class _NormalizedHighlightedRange {
  const _NormalizedHighlightedRange({
    required this.start,
    required this.end,
    this.color,
  });

  final DateTime start;
  final DateTime end;
  final Color? color;
}

class _RangeBandSegment extends StatelessWidget {
  const _RangeBandSegment({
    required this.isStart,
    required this.isEnd,
    required this.color,
    this.roundedCaps = false,
    this.halfCaps = true,
  });

  final bool isStart;
  final bool isEnd;
  final Color color;
  final bool roundedCaps;
  final bool halfCaps;

  @override
  Widget build(BuildContext context) {
    const edgeRadius = Radius.circular(10);

    Widget band({BorderRadius? borderRadius}) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
        ),
      );
    }

    if (isStart && !isEnd) {
      return Align(
        alignment: Alignment.centerRight,
        child: FractionallySizedBox(
          widthFactor: halfCaps ? 0.5 : 1,
          heightFactor: 0.64,
          child: band(
            borderRadius: roundedCaps
                ? const BorderRadius.horizontal(left: Radius.circular(10))
                : null,
          ),
        ),
      );
    }

    if (isEnd && !isStart) {
      return Align(
        alignment: Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: halfCaps ? 0.5 : 1,
          heightFactor: 0.64,
          child: band(
            borderRadius: roundedCaps
                ? const BorderRadius.horizontal(right: Radius.circular(10))
                : null,
          ),
        ),
      );
    }

    return FractionallySizedBox(
      widthFactor: 1,
      heightFactor: 0.64,
      child: band(
        borderRadius: roundedCaps && isStart && isEnd
            ? BorderRadius.all(edgeRadius)
            : null,
      ),
    );
  }
}
