import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitterclone/home/tabbar_view.dart';

class HomeView extends StatefulWidget {
  const HomeView(this.controller, {Key? key}) : super(key: key);

  final ScrollController controller;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int defaultTabLength = 4;
  String _randomImage = "https://picsum.photos/200";
  String _dummyText =
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.";
  bool isHeaderClose = false;
  double lastOffset = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: _fabButton, body: _listView);
  }

  Widget get _fabButton => FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.adb),
      );

  Widget get _listView => ListView.builder(
      itemCount: 10,
      controller: widget.controller,
      itemBuilder: (context, index) {
        return _listViewCard;
      });

  Widget get _listViewCard => Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(_randomImage),
          ),
          title: Wrap(
            direction: Axis.horizontal,
            runSpacing: 5,
            children: [
              _listCardTitle("Hello"),
              Text(_dummyText),
              _placeHolderField,
              _footerButtonList,
            ],
          ),
        ),
      );

  Widget _listCardTitle(String text) => Text(
        text,
        style: titleTextStyle,
      );

  Widget get _placeHolderField => Container(
        height: 100,
        child: Placeholder(),
      );

  Widget get _footerButtonList => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _iconLabelButton,
          _iconLabelButton,
          _iconLabelButton,
          _iconLabelButton,
        ],
      );

  Widget _iconLabel(String text) => Wrap(
        children: [
          Icon(
            Icons.comment,
            color: CupertinoColors.inactiveGray,
          ),
          Text(text),
        ],
      );

  Widget get _iconLabelButton => InkWell(
        child: _iconLabel("1"),
        onTap: () {},
      );
}
