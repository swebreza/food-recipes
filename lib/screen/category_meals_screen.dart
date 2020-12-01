import 'dart:ffi';

import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

//===================================================================
class CategoryMealsScreen extends StatefulWidget {
  static const nameRoute = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meals> displayedMeals;
  var _changeInitData = false;
  @override
  // void initState() {
  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
    if (!_changeInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = DUMMY_MEALS.where((meals) {
        return meals.categories.contains(categoryId);
      }).toList();
      _changeInitData = true;
    }

    super.didChangeDependencies();
  }

  void _itemremove(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          // ignore: missing_required_param
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            duration: displayedMeals[index].duration.toString(),
            imageurl: displayedMeals[index].imageUrl,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            itemRemove: _itemremove,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
//===================================================================
