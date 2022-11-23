import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

typedef LoadMoreCallback = Future<void> Function();

class LoadMoreListView extends StatefulWidget {
  final bool haveMoreItem;
  final LoadMoreCallback? onLoadMore;
  final RefreshCallback? onRefresh;
  final Widget? loadMoreWidget;

  ///ListView
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder? separatorBuilder;
  final ScrollController? controller;
  final Axis scrollDirection;
  final bool reverse;
  final bool? primary;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final double? itemExtent;
  final Widget? prototypeItem;
  final ChildIndexGetter? findChildIndexCallback;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final int? semanticChildCount;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String? restorationId;
  final Clip clipBehavior;

  ///Refresh
  final double refreshDisplacement;
  final double refreshEdgeOffset;
  final Color? refreshColor;
  final Color refreshBackgroundColor;
  final String? refreshSemanticsLabel;
  final String? refreshSemanticsValue;
  final double refreshStrokeWidth;
  final RefreshIndicatorTriggerMode refreshTriggerMode;

  ///animation
  final Duration scrollToLoadMoreWidgetDuration;
  final Curve scrollToLoadMoreWidgetCurve;

  const LoadMoreListView.builder({
    Key? key,
    required this.itemBuilder,
    this.onLoadMore,
    this.onRefresh,
    this.itemCount = 0,
    this.haveMoreItem = true,
    this.loadMoreWidget,

    ///refresh
    this.refreshBackgroundColor = Colors.blueAccent,
    this.refreshDisplacement = 40.0,
    this.refreshEdgeOffset = 0.0,
    this.refreshColor,
    this.refreshSemanticsLabel,
    this.refreshSemanticsValue,
    this.refreshStrokeWidth = RefreshProgressIndicator.defaultStrokeWidth,
    this.refreshTriggerMode = RefreshIndicatorTriggerMode.onEdge,

    ///ListView.builder
    this.controller,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.primary,
    this.shrinkWrap = false,
    this.padding,
    this.itemExtent,
    this.prototypeItem,
    this.findChildIndexCallback,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    this.semanticChildCount,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,

    ///animation
    this.scrollToLoadMoreWidgetDuration = const Duration(milliseconds: 100),
    this.scrollToLoadMoreWidgetCurve = Curves.fastOutSlowIn,
  })  : separatorBuilder = null,
        super(key: key);

  const LoadMoreListView.separated({
    Key? key,
    required this.itemBuilder,
    required this.separatorBuilder,
    this.onLoadMore,
    this.onRefresh,
    this.itemCount = 0,
    this.haveMoreItem = true,
    this.loadMoreWidget,

    ///refresh
    this.refreshBackgroundColor = Colors.blueAccent,
    this.refreshDisplacement = 40.0,
    this.refreshEdgeOffset = 0.0,
    this.refreshColor,
    this.refreshSemanticsLabel,
    this.refreshSemanticsValue,
    this.refreshStrokeWidth = RefreshProgressIndicator.defaultStrokeWidth,
    this.refreshTriggerMode = RefreshIndicatorTriggerMode.onEdge,

    ///ListView.separated
    this.controller,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.primary,
    this.shrinkWrap = false,
    this.padding,
    this.findChildIndexCallback,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,

    ///animation
    this.scrollToLoadMoreWidgetDuration = const Duration(milliseconds: 100),
    this.scrollToLoadMoreWidgetCurve = Curves.fastOutSlowIn,
  })  : itemExtent = null,
        prototypeItem = null,
        semanticChildCount = null,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _LoadMoreListViewState();
}

class _LoadMoreListViewState extends State<LoadMoreListView> {
  bool _isLoadMore = false;
  late bool _isControllerCreateAtThisState;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.controller ?? ScrollController();
    _isControllerCreateAtThisState = widget.controller == null;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollEndNotification>(
      onNotification: (ScrollEndNotification scrollEnd) {
        final metrics = scrollEnd.metrics;
        if (!metrics.atEdge) return true;
        if (metrics.pixels == 0) return true;

        loadMore();
        return true;
      },
      child: widget.onRefresh == null
          ? getListViewWidget()
          : RefreshIndicator(
              onRefresh: widget.onRefresh!,
              backgroundColor: widget.refreshBackgroundColor,
              displacement: widget.refreshDisplacement,
              edgeOffset: widget.refreshEdgeOffset,
              color: widget.refreshColor,
              semanticsLabel: widget.refreshSemanticsLabel,
              semanticsValue: widget.refreshSemanticsValue,
              strokeWidth: widget.refreshStrokeWidth,
              triggerMode: widget.refreshTriggerMode,
              child: getListViewWidget(),
            ),
    );
  }

  @override
  void dispose() {
    if (_isControllerCreateAtThisState) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  Widget getListViewWidget() {
    if (widget.separatorBuilder == null) {
      return _getListViewBuilderWidget();
    } else {
      return _getListViewSeparatedWidget();
    }
  }

  Widget _getListViewBuilderWidget() {
    return ListView.builder(
      controller: _scrollController,
      physics: const ClampingScrollPhysics(),
      itemBuilder: itemBuilder,
      itemCount: widget.itemCount + (_isLoadMore ? 1 : 0),

      ///ListView
      scrollDirection: widget.scrollDirection,
      reverse: widget.reverse,
      primary: widget.primary,
      shrinkWrap: widget.shrinkWrap,
      padding: widget.padding,
      itemExtent: widget.itemExtent,
      prototypeItem: widget.prototypeItem,
      findChildIndexCallback: widget.findChildIndexCallback,
      addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
      addRepaintBoundaries: widget.addRepaintBoundaries,
      addSemanticIndexes: widget.addSemanticIndexes,
      cacheExtent: widget.cacheExtent,
      semanticChildCount: widget.semanticChildCount,
      dragStartBehavior: widget.dragStartBehavior,
      keyboardDismissBehavior: widget.keyboardDismissBehavior,
      restorationId: widget.restorationId,
      clipBehavior: widget.clipBehavior,
    );
  }

  Widget _getListViewSeparatedWidget() {
    return ListView.separated(
      controller: _scrollController,
      physics: const ClampingScrollPhysics(),
      separatorBuilder: widget.separatorBuilder!,
      itemBuilder: itemBuilder,
      itemCount: widget.itemCount + (_isLoadMore ? 1 : 0),

      ///ListView
      scrollDirection: widget.scrollDirection,
      reverse: widget.reverse,
      primary: widget.primary,
      shrinkWrap: widget.shrinkWrap,
      padding: widget.padding,
      findChildIndexCallback: widget.findChildIndexCallback,
      addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
      addRepaintBoundaries: widget.addRepaintBoundaries,
      addSemanticIndexes: widget.addSemanticIndexes,
      cacheExtent: widget.cacheExtent,
      dragStartBehavior: widget.dragStartBehavior,
      keyboardDismissBehavior: widget.keyboardDismissBehavior,
      restorationId: widget.restorationId,
      clipBehavior: widget.clipBehavior,
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    if (index == widget.itemCount) {
      return widget.loadMoreWidget ??
          Container(
            margin: const EdgeInsets.all(20.0),
            alignment: Alignment.center,
            child: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
            ),
          );
    }
    return widget.itemBuilder(context, index);
  }

  loadMore() async {
    if (!widget.haveMoreItem) return;
    if (_isLoadMore) return;
    if (widget.onLoadMore == null) return;

    setState(() {
      _isLoadMore = true;
    });
    await Future.delayed(const Duration(milliseconds: 50));
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
    );
    //call back
    await widget.onLoadMore!();
    setState(() {
      _isLoadMore = false;
    });
  }
}
