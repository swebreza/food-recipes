import 'package:flutter/material.dart';
// import 'package:flutter_complete_guide/screen/category_meals_screen.dart';
// import 'package:flutter_complete_guide/screen/item_detail.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function link) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: link,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            alignment: Alignment.centerLeft,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.all(20),
            child: Text(
              "Meals App !",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 24,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          buildListTile(
            "Meals",
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            "Filters",
            Icons.settings,
            () {
              Navigator.of(context).pushReplacementNamed('/filters');
            },
          )
        ],
      ),
    );
  }
}
