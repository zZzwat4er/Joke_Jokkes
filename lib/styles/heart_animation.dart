import 'package:flutter/material.dart';

class HeartWedget extends StatefulWidget {
  final bool state;
  final void Function<bool>()? notifi;

  const HeartWedget({
    Key? key,
    this.notifi,
    this.state = false,
  }) : super(key: key);

  @override
  HeartWedgetState createState() => HeartWedgetState();
}

class HeartWedgetState extends State<HeartWedget> {
  bool _visibility = false;

  @override
  void initState() {
    super.initState();
    _visibility = widget.state;
  }

  void updateVisability(bool visibility) {
    setState(() => _visibility = visibility);
    }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visibility ? 1.0 : 0.0,
      child: const Icon(
        Icons.favorite,
        color: Colors.red,
      ),
      duration: const Duration(
        milliseconds: 100,
      ),
      onEnd: () => {},
    );
  }
}
