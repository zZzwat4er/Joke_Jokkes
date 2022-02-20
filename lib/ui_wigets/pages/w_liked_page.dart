import 'package:flutter/material.dart';
import 'package:joke_jokkis/ui_wigets/list_tile/joke_tile.dart';

import '../../utility/joke.dart';
import '../../utility/jokes_db.dart';

class LikedPage extends StatelessWidget {

  const LikedPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final db = JokesDB();
    db.init();
    final list = db.jokes();
    
    return FutureBuilder<List<Joke>>(
      future: list,
      builder: (context, snapshot) {
        final data = snapshot.data;
        if(data == null){
          return const Center( child: CircularProgressIndicator(),);
        }
        return ListView(
          children: data.map((joke) => JokeTile(joke: Future(() => joke), isLiked: true,)).toList(),
        );
      },
    );
  }
}
