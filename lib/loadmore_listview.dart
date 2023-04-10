import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

typedef LoadMoreCallback = Future<void> Function();

class LoadMoreListView extends StatefulWidget {
  ///builder
  const LoadMoreListView.builder({
    Key? key,
    required this.itemBuilder,
    this.onLoadMore,
    this.onRefresh,
    this.itemCount = 0,
    this.hasMoreItem = true,
    this.loadMoreWidget,
    //refresh
    this.refreshBackgroundColor = Colors.blueAccent,
    this.refreshDisplacement = 40.0,
    this.refreshEdgeOffset = 0.0,
    this.refreshColor = Colors.white,
    this.refreshSemanticsLabel,
    this.refreshSemanticsValue,
    this.refreshStrokeWidth = RefreshProgressIndicator.defaultStrokeWidth,
    this.refreshTriggerMode = RefreshIndicatorTriggerMode.onEdge,
    //ListView.builder
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
    //animation
    this.scrollToLoadMoreWidgetDuration = const Duration(milliseconds: 100),
    this.scrollToLoadMoreWidgetCurve = Curves.fastOutSlowIn,
  })  : separatorBuilder = null,
        slivers = null,
        scrollBehavior = null,
        center = null,
        anchor = 0.0,
        super(key: key);

  ///separated
  const LoadMoreListView.separated({
    Key? key,
    required this.itemBuilder,
    required this.separatorBuilder,
    this.onLoadMore,
    this.onRefresh,
    this.itemCount = 0,
    this.hasMoreItem = true,
    this.loadMoreWidget,
    //refresh
    this.refreshBackgroundColor = Colors.blueAccent,
    this.refreshDisplacement = 40.0,
    this.refreshEdgeOffset = 0.0,
    this.refreshColor = Colors.white,
    this.refreshSemanticsLabel,
    this.refreshSemanticsValue,
    this.refreshStrokeWidth = RefreshProgressIndicator.defaultStrokeWidth,
    this.refreshTriggerMode = RefreshIndicatorTriggerMode.onEdge,
    //ListView.separated
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
    //animation
    this.scrollToLoadMoreWidgetDuration = const Duration(milliseconds: 100),
    this.scrollToLoadMoreWidgetCurve = Curves.fastOutSlowIn,
  })  : itemExtent = null,
        prototypeItem = null,
        semanticChildCount = null,
        slivers = null,
        scrollBehavior = null,
        center = null,
        anchor = 0.0,
        super(key: key);

  /// CustomScrollView
  const LoadMoreListView.customScrollView({
    Key? key,
    required List<Widget> slivers,
    this.onLoadMore,
    this.onRefresh,
    this.hasMoreItem = true,
    this.loadMoreWidget,
    //refresh
    this.refreshBackgroundColor = Colors.blueAccent,
    this.refreshDisplacement = 40.0,
    this.refreshEdgeOffset = 0.0,
    this.refreshColor = Colors.white,
    this.refreshSemanticsLabel,
    this.refreshSemanticsValue,
    this.refreshStrokeWidth = RefreshProgressIndicator.defaultStrokeWidth,
    this.refreshTriggerMode = RefreshIndicatorTriggerMode.onEdge,
    //ListView.separated
    this.controller,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.primary,
    this.shrinkWrap = false,
    this.cacheExtent,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
    this.scrollBehavior,
    this.center,
    this.anchor = 0.0,
    //animation
    this.scrollToLoadMoreWidgetDuration = const Duration(milliseconds: 100),
    this.scrollToLoadMoreWidgetCurve = Curves.fastOutSlowIn,
  })  : this.slivers = slivers,
        this.itemExtent = null,
        this.prototypeItem = null,
        this.itemBuilder = null,
        this.separatorBuilder = null,
        this.semanticChildCount = null,
        this.itemCount = 0,
        this.addAutomaticKeepAlives = true,
        this.addRepaintBoundaries = true,
        this.addSemanticIndexes = true,
        this.padding = null,
        this.findChildIndexCallback = null,
        super(key: key);

  ///Is there more data to load
  final bool hasMoreItem;

  ///Trigger the bottom loadMore callback
  final LoadMoreCallback? onLoadMore;

  ///pull down onRefresh callback
  final RefreshCallback? onRefresh;

  ///Widget displayed at the bottom when loading
  final Widget? loadMoreWidget;

  //---ListView---
  ///itemCount like Listview
  final int itemCount;

  ///itemBuilder like Listview
  final IndexedWidgetBuilder? itemBuilder;

  ///separatorBuilder like Listview
  final IndexedWidgetBuilder? separatorBuilder;

  ///controller like Listview
  final ScrollController? controller;

  ///scrollDirection like Listview
  final Axis scrollDirection;

  ///reverse like Listview
  final bool reverse;

  ///primary like Listview
  final bool? primary;

  ///shrinkWrap like Listview
  final bool shrinkWrap;

  ///padding like Listview
  final EdgeInsetsGeometry? padding;

  ///itemExtent like Listview
  final double? itemExtent;

  ///prototypeItem like Listview
  final Widget? prototypeItem;

  ///findChildIndexCallback like Listview
  final ChildIndexGetter? findChildIndexCallback;

  ///addAutomaticKeepAlives like Listview
  final bool addAutomaticKeepAlives;

  ///addRepaintBoundaries like Listview
  final bool addRepaintBoundaries;

  ///addSemanticIndexes like Listview
  final bool addSemanticIndexes;

  ///cacheExtent like Listview
  final double? cacheExtent;

  ///semanticChildCount like Listview
  final int? semanticChildCount;

  ///dragStartBehavior like Listview
  final DragStartBehavior dragStartBehavior;

  ///keyboardDismissBehavior like Listview
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  ///restorationId like Listview
  final String? restorationId;

  ///clipBehavior like Listview
  final Clip clipBehavior;

  //---RefreshIndicator---
  ///Displacement like RefreshIndicator
  final double refreshDisplacement;

  ///EdgeOffset like RefreshIndicator
  final double refreshEdgeOffset;

  ///Color like RefreshIndicator
  final Color? refreshColor;

  ///BackgroundColor like RefreshIndicator
  final Color refreshBackgroundColor;

  ///SemanticsLabel like RefreshIndicator
  final String? refreshSemanticsLabel;

  ///SemanticsValue like RefreshIndicator
  final String? refreshSemanticsValue;

  ///StrokeWidth like RefreshIndicator
  final double refreshStrokeWidth;

  ///TriggerMode like RefreshIndicator
  final RefreshIndicatorTriggerMode refreshTriggerMode;

  //---animation---
  ///When the bottom event is triggered, the animation duration of the bottom Widget is displayed
  final Duration scrollToLoadMoreWidgetDuration;

  ///When the bottom event is triggered, display the animated Curve of the bottom Widget
  final Curve scrollToLoadMoreWidgetCurve;

  //---CustomScrollView---
  /// CustomScrollView slivers
  final List<Widget>? slivers;

  /// CustomScrollView ScrollBehavior
  final ScrollBehavior? scrollBehavior;

  /// CustomScrollView center
  final Key? center;

  /// CustomScrollView anchor
  final double anchor;

  @override
  State<StatefulWidget> createState() => _LoadMoreListViewState();
}

class _LoadMoreListViewState extends State<LoadMoreListView> {
  ///Is it loading
  bool _isLoadMore = false;

  ///Whether to create ScrollController in State
  late bool _isControllerCreateAtThisState;

  ///ListView's ScrollController
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    //If there is no controller, assign one
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
    if (widget.slivers != null) {
      return _getCustomScrollView();
    } else if (widget.separatorBuilder == null) {
      return _getListViewBuilderWidget();
    } else {
      return _getListViewSeparatedWidget();
    }
  }

  Widget _getListViewBuilderWidget() {
    return ListView.builder(
      controller: _scrollController,
      physics: const ClampingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      itemBuilder: itemBuilder,
      itemCount: widget.itemCount + (_isLoadMore ? 1 : 0),
      //ListView
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
      physics: const ClampingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      separatorBuilder: widget.separatorBuilder!,
      itemBuilder: itemBuilder,
      itemCount: widget.itemCount + (_isLoadMore ? 1 : 0),
      //ListView
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

  Widget _getCustomScrollView() {
    return CustomScrollView(
      controller: _scrollController,
      physics: const ClampingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      slivers: [
        ...widget.slivers!,
        if (_isLoadMore)
          SliverToBoxAdapter(
            child: _getLoadMoreWidget(),
          ),
      ],
      scrollDirection: widget.scrollDirection,
      reverse: widget.reverse,
      primary: widget.primary,
      shrinkWrap: widget.shrinkWrap,
      cacheExtent: widget.cacheExtent,
      dragStartBehavior: widget.dragStartBehavior,
      keyboardDismissBehavior: widget.keyboardDismissBehavior,
      restorationId: widget.restorationId,
      clipBehavior: widget.clipBehavior,
      semanticChildCount: widget.semanticChildCount,
      scrollBehavior: widget.scrollBehavior,
      center: widget.center,
      anchor: widget.anchor,
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    //index is usually less than itemCount, if it is equal, it means loading
    if (index == widget.itemCount) {
      return _getLoadMoreWidget();
    }
    return widget.itemBuilder!(context, index);
  }

  loadMore() async {
    //If there are no more items, jump out
    if (!widget.hasMoreItem) return;
    //If loading, jump out
    if (_isLoadMore) return;
    //If there is no onLoadMore call back, jump out
    if (widget.onLoadMore == null) return;

    setState(() {
      //is loading
      _isLoadMore = true;
    });
    //wait isLoadMore setState
    await Future.delayed(const Duration(milliseconds: 50));
    //scroll to loadMoreWidget
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
    );
    //call onLoadMore
    await widget.onLoadMore!();
    setState(() {
      //loaded
      _isLoadMore = false;
    });
  }

  Widget _getLoadMoreWidget() {
    return widget.loadMoreWidget ??
        Container(
          margin: const EdgeInsets.all(20.0),
          alignment: Alignment.center,
          child: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
          ),
        );
  }
}
