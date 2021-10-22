import 'package:flutter/material.dart';
import 'package:twitterclone/home/home_view.dart';

class TwitterTabbarView extends StatefulWidget {
  const TwitterTabbarView({Key? key}) : super(key: key);

  @override
  _TwitterTabbarViewState createState() => _TwitterTabbarViewState();
}

class _TwitterTabbarViewState extends State<TwitterTabbarView> {
  bool isHeaderClose = false;
  String _imageUrl =
      "https://images.pexels.com/photos/3785079/pexels-photo-3785079.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  late ScrollController scrollController;
  double lastOffset = 0;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();

    scrollController.addListener(() {
      print(scrollController.offset);
      if (scrollController.offset <= 0) {
        isHeaderClose = false;
      } else if (scrollController.offset <=
          scrollController.position.maxScrollExtent) {
        isHeaderClose = true;
      } else {
        isHeaderClose = scrollController.offset > lastOffset ? true : false;
      }

      setState(() {
        lastOffset = scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: _bottomAppBar,
        body: Column(
          children: [
            _containerAppBar,
            Expanded(
              child: TabBarView(children: [
                HomeView(scrollController),
                Text("asd"),
                Text("asd"),
                Text("asd"),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _bottomAppBar => BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: _tabBarItems,
      );

  Widget get _fabButton => FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.adb),
      );

  Widget get _containerAppBar => AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: isHeaderClose ? 0 : 50,
        child: _appBar,
      );

  Widget get _appBar => AppBar(
        elevation: 0,
        centerTitle: false,
        title: _appBarItems,
      );

  Widget get _appBarItems => Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10,
        children: [
          CircleAvatar(backgroundImage: NetworkImage(_imageUrl)),
          Text("Home", style: titleTextStyle),
        ],
      );
  Widget get _tabBarItems => TabBar(
        tabs: [
          Tab(icon: Icon(Icons.dashboard)),
          Tab(icon: Icon(Icons.dashboard)),
          Tab(icon: Icon(Icons.dashboard)),
          Tab(icon: Icon(Icons.dashboard)),
        ],
      );
}

final titleTextStyle = TextStyle(
  letterSpacing: 1,
  fontSize: 20,
  fontWeight: FontWeight.w800,
  color: Colors.black,
);
