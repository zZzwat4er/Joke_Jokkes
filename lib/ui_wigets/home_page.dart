import 'package:flutter/material.dart';
import 'package:joke_jokkis/ui_wigets/pages/w_category_select.dart';
import 'package:joke_jokkis/ui_wigets/pages/w_feed_page.dart';
import 'bot_nav/w_bootom_nav.dart';
import 'pages/w_liked_page.dart';
import 'pages/w_settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _page = 0;
  String? _category;
  final GlobalKey<FeedPageState> feedKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _page = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(
        currentIndex: _page,
        onTap: onBotNav,
      ),
      body: SafeArea(
        child: _loadPage(_page),
      ),
      floatingActionButton: Visibility(
        visible: _page == 0,
        child: Builder(
          builder: (context) {
            return FloatingActionButton(
              onPressed: () => showCategory(context),
              child: const Icon(Icons.menu),
            );
          },
        ),
      ),
    );
  }

  void onBotNav(int index) => setState(() => _page = index);

  Widget _loadPage(int page) {
    switch (page) {
      case 1:
        return const LikedPage();
      case 2:
        return SettingsPage();
      default:
        return FeedPage(
          key: feedKey,
        );
    }
  }

  void categorySelect(String? category) {
    Navigator.pop(context);
    setState(() => _category = category);
    feedKey.currentState!.changeCategory(_category);
  }

  void showCategory(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (contex) => CategoryWidget(
        callback: categorySelect,
      ),
    );
  }
}
