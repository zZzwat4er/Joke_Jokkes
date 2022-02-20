import 'package:flutter/material.dart';
import 'package:joke_jokkis/styles/heart_animation.dart';
import 'package:joke_jokkis/styles/joke_style.dart';
import 'package:joke_jokkis/utility/jokes_db.dart';
import '../../utility/joke.dart';

class JokeTile extends StatefulWidget {
  final Future<Joke> joke;
  final bool isLiked;

  const JokeTile({
    Key? key,
    required this.joke,
    this.isLiked = false,
  }) : super(key: key);

  @override
  JokeTileState createState() => JokeTileState();
}

class JokeTileState extends State<JokeTile> {
  late final Future<Joke> joke;
  late bool isLiked;
  final GlobalKey<HeartWedgetState> animationKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    joke = widget.joke;
    isLiked = widget.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Joke>(
        future: joke,
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.0,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: GestureDetector(
              onDoubleTap: () {
                final db = JokesDB();

                if (isLiked) {
                  db.deleteJoke(data.id);
                  isLiked = false;
                  animationKey.currentState!.updateVisability(false);
                } else {
                  db.insertJoke(data);
                  isLiked = true;
                  animationKey.currentState!.updateVisability(true);
                }
              },
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      data.value,
                      style: const JokeStyle(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: HeartWedget(
                      key: animationKey,
                      state: isLiked,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
