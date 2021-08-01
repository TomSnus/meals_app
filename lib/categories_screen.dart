import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/categorie_item.dart';
import 'package:flutter_complete_guide/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DeliMeal'),
        ),
        body: GridView(
          padding: const EdgeInsets.all(25),
          children: DUMMY_CATEGORIES
              .map((catData) => CategoryItem(
                  id: catData.id, title: catData.title, color: catData.color))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 3 / 2),
        ));
  }
}
