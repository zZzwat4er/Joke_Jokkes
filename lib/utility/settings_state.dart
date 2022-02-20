import 'package:joke_jokkis/utility/setting.dart';

class SettingsState{
  static List<Setting> settings = [
    Setting(value: 'Dark Mode', state: false)
  ];
  static bool isDark() => settings[0].state ?? false;
}