import 'package:flutter/material.dart';
import 'package:joke_jokkis/ui_wigets/list_tile/settings_tile.dart';
import 'package:joke_jokkis/utility/settings_state.dart';

class SettingsPage extends StatelessWidget {
  final list = SettingsState.settings;

  SettingsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: list.map((setting) => SettingsTile(setting: setting)).toList(),
    );
  }
}
