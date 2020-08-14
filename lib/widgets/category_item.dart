import 'package:Daily_meal/screens/category_meals.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoryItem(this.color, this.title, this.id);
  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryMeals.routName,
      arguments: {
        'id': id,
        'title': title,
      },
      // MaterialPageRoute(
      //   // builder: (_) {
      //   //   return CategoryMeals(id, title);
      //   // },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
