import 'package:flutter/material.dart';

import '../../styles/category_style.dart';

class CategoryTile extends StatelessWidget {
  final String category;
  final void Function(String?)? callback;

  const CategoryTile({
    Key? key,
    required this.category,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          callback != null ? callback!(category == 'none'? null : category) : () => {},
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            category,
            style: const CategoryStyle(),
          ),
        ),
      ),
    );
  }
}
