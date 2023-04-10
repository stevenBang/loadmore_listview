import 'package:flutter/material.dart';
import 'package:loadmore_listview/loadmore_listview.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  final List<Widget> _tabs = const [
    Tab(text: 'builder'),
    Tab(text: 'separated'),
    Tab(text: 'customScrollView'),
  ];
  late TabController _tabController;
  bool _hasNextData = true;
  List<String> list = [];
  final _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
  final Random _rnd = Random();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) => getList());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Load More and Refresh'),
        ),
        body: Column(
          children: [
            TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              tabs: _tabs,
              onTap: (index) {
                getList();
              },
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  LoadMoreListView.builder(
                    hasMoreItem: _hasNextData,
                    onLoadMore: loaMoreList,
                    onRefresh: refreshList,
                    refreshBackgroundColor: Colors.blueAccent,
                    refreshColor: Colors.white,
                    loadMoreWidget: Container(
                      margin: const EdgeInsets.all(20.0),
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
                      ),
                    ),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(30),
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(list[index]),
                      );
                    },
                  ),
                  LoadMoreListView.separated(
                    hasMoreItem: _hasNextData,
                    onLoadMore: loaMoreList,
                    onRefresh: refreshList,
                    refreshBackgroundColor: Colors.blueAccent,
                    refreshColor: Colors.white,
                    loadMoreWidget: Container(
                      margin: const EdgeInsets.all(20.0),
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
                      ),
                    ),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(30),
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(list[index]),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                  ),
                  LoadMoreListView.customScrollView(
                    hasMoreItem: _hasNextData,
                    onLoadMore: loaMoreList,
                    onRefresh: refreshList,
                    refreshBackgroundColor: Colors.blueAccent,
                    refreshColor: Colors.white,
                    loadMoreWidget: Container(
                      margin: const EdgeInsets.all(20.0),
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
                      ),
                    ),
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(30),
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Text(list[index]),
                            );
                          },
                          childCount: list.length,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future getList() async {
    list.clear();
    _hasNextData = true;
    setState(() {
      for (int i = 0; i < 20; i++) {
        list.add(getRandomString(10));
      }
    });
  }

  Future refreshList() async {
    list.clear();
    await loaMoreList();
  }

  Future loaMoreList() async {
    await Future.delayed(const Duration(seconds: 1)); //await API Response
    setState(() {
      for (int i = 0; i < 20; i++) {
        list.add(getRandomString(10));
      }
      _hasNextData = list.length < 100;
    });
  }

  String getRandomString(int length) => String.fromCharCodes(
      Iterable.generate(length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
