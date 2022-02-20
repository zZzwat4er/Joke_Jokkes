import 'package:flutter/material.dart';
import 'package:joke_jokkis/ui_wigets/list_tile/joke_tile.dart';
import 'package:joke_jokkis/utility/chack_api.dart';

class FeedPage extends StatefulWidget {
  final list = List.generate(
    50,
    (_) => ChackAPI.getRandomJoke(null),
    growable: true,
  ).toList(growable: true);
  final void Function(String)? onChanged;

  FeedPage({
    Key? key,
    this.onChanged
  }) : super(key: key);

  @override
  FeedPageState createState() => FeedPageState();
}

class FeedPageState extends State<FeedPage> {
  late List _list;
  String? _category;

  void changeCategory(String? category) => setState(() {
        _category = category;
        _list = List.generate(
          50,
          (_) => ChackAPI.getRandomJoke(_category),
          growable: true,
        ).toList(growable: true);
      });

  @override
  void initState() {
    super.initState();
    _list = widget.list;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index + 50 >= _list.length) _list.add(ChackAPI.getRandomJoke(_category));
        return JokeTile(joke: _list[index]);
      },
    );
  }
}
