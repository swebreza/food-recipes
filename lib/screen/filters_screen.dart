import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

//===========================================================
class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
      ),
      drawer: MainDrawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Foodbg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjudt Your Filters",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  SwitchListTile(
                    value: _glutenFree,
                    onChanged: (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    },
                    title: Text("Gluten Free"),
                    subtitle: Text("Gluten"),
                  ),
                  SwitchListTile(
                    value: _vegetarian,
                    onChanged: (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    },
                    title: Text("Vegetarian"),
                    subtitle: Text("Vegetarian"),
                  ),
                  SwitchListTile(
                    value: _vegan,
                    onChanged: (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    },
                    title: Text("Vegan"),
                    subtitle: Text("vegan"),
                  ),
                  SwitchListTile(
                    value: _lactoseFree,
                    onChanged: (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    },
                    title: Text("LactoseFree"),
                    subtitle: Text("LactoseFree"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//===========================================================
