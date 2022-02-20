import 'package:flutter/material.dart';
import '../../utility/setting.dart';

class SettingsTile extends StatefulWidget {
  final Setting setting;

  const SettingsTile({
    Key? key,
    required this.setting,
  }) : super(key: key);

  @override
  SettingsTileState createState() => SettingsTileState();
}

class SettingsTileState extends State<SettingsTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            widget.setting.value,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Switch(
            value: widget.setting.state ?? false,
            onChanged: (newState) {
              setState(() {
                widget.setting.state = newState;
              });
            },
          ),
        ),
      ],
    );
  }
}
