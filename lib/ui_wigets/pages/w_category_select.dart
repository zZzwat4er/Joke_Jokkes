import 'package:flutter/material.dart';
import 'package:joke_jokkis/utility/chack_api.dart';

import '../list_tile/category_tile.dart';

class CategoryWidget extends StatelessWidget {
  static final list = ChackAPI.getCategoryes();
  final void Function(String?)? callback;
  const CategoryWidget({
    Key? key,
    this.callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: list,
      builder: (context, snapshot) {
        final data = snapshot.data;
        if(data == null) return const Center(child: CircularProgressIndicator(),);
        return ListView(
          children: data.map((e) => CategoryTile(category: e, callback: callback,)).toList(),
        );
      },
    );
  }
}
