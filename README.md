# Load More Listview

An Listview with the Load more item and refresh

![LoadMoreListView.builder](https://media.giphy.com/media/BsyHEpLrxFCCLaANKg/giphy.gif)

## Getting Started

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  loadmore_listview: ^1.0.2
```


Import it:

```dart
import 'package:loadmore_listview/loadmore_listview.dart';
```
## Usage Examples

### LoadMoreListView.builder
```dart
LoadMoreListView.builder(
    haveMoreItem: true,
    //Trigger the bottom loadmore callback
    onLoadMore: () async{
      //await your api
      await Future.delayed(const Duration(seconds: 1));
    },
    //pull down refresh callback
    onRefresh: () async{
      //await your api
      await Future.delayed(const Duration(seconds: 1));
    },
    //you can set your loadmore Animation
    loadMoreWidget: Container(
        margin: const EdgeInsets.all(20.0),
        alignment: Alignment.center,
        child: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
        ),
    ),
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
// Here, default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
LoadMoreListView.builder(
    //...
    separatorBuilder: (context, index) {
      return const Divider();
    },
);
```