import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../screen/item_detail.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageurl;
  final String duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function itemRemove;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageurl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.itemRemove,
  });
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      ItemDetail.routeName,
      arguments: id,
    )
        .then((result) {
      if (result != null) {
        itemRemove(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageurl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(children: <Widget>[
                    Icon(Icons.schedule),
                    SizedBox(
                      width: 5,
                    ),
                    Text('$duration min'),
                  ]),
                  Row(children: <Widget>[
                    Icon(Icons.work),
                    SizedBox(
                      width: 5,
                    ),
                    Text(complexityText),
                  ]),
                  Row(children: <Widget>[
                    Icon(Icons.attach_money),
                    SizedBox(
                      width: 5,
                    ),
                    Text(affordabilityText),
                  ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
