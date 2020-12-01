import 'package:flutter/material.dart';
import './screen/tabs_screens.dart';
import './screen/item_detail.dart';
import './screen/category_meals_screen.dart';
import './screen/filters_screen.dart';

//==============================================================================
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DailyMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 255, 255, 2),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 52, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
//===================================================================
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.nameRoute: (ctx) => CategoryMealsScreen(),
        ItemDetail.routeName: (ctx) => ItemDetail(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(),
      },
    );
  }
}
//===================================================================
