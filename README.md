# Load More Listview

An Listview with the Load more item and refresh

![LoadMoreListView.builder](https://media.giphy.com/media/BsyHEpLrxFCCLaANKg/giphy.gif)

## Getting Started

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  loadmore_listview: ^1.0.3
```


Import it:

```dart
import 'package:loadmore_listview/loadmore_listview.dart';
```
## Usage Examples

### LoadMoreListView.builder
```dart
LoadMoreListView.builder(
    //is there more data to load
    haveMoreItem: true,
    //Trigger the bottom loadMore callback
    onLoadMore: () async{
      //wait for your api to fetch more items
      await Future.delayed(const Duration(seconds: 1));
    },
    //pull down refresh callback
    onRefresh: () async{
      //wait for your api to update the list
      await Future.delayed(const Duration(seconds: 1));
    },
    //you can set your loadMore Animation
    loadMoreWidget: Container(
        margin: const EdgeInsets.all(20.0),
        alignment: Alignment.center,
        child: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
        ),
    ),
    //ListView
    itemCount: 20,
    itemBuilder: (context, index) {
        return Container(
            margin: const EdgeInsets.all(30),
            width: double.infinity,
            alignment: Alignment.center,
            child: Text('$index'),
        );
    },
);
```

### LoadMoreListView.separated
```dart
LoadMoreListView.separated(
    //...
    separatorBuilder: (context, index) {
      return const Divider();
    },
);
```