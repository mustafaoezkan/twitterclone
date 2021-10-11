import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _fabButton,
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [_appBar],
        ),
      ),
    );
  }

  Widget get _fabButton => FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.adb),
      );

  Widget get _appBar => AppBar(
        centerTitle: false,
        title: _appBarItems,
      );
  Widget get _appBarItems => Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10,
        children: [CircleAvatar(), Text("Home")],
      );
}
