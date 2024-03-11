import 'package:flutter/material.dart';

class Dining extends StatefulWidget {
  const Dining({super.key});

  @override
  State<Dining> createState() => _DiningState();
}

class _DiningState extends State<Dining> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://cdn.pixabay.com/photo/2016/03/30/21/59/coffee-beans-1291656_640.jpg"),
                    fit: BoxFit.cover)),
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Cafe Name",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
            ),
          ),
          floating: true,
          expandedHeight: 200,
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(childCount: dish.length,
                (context, index) {
          return Container(
              color: Color.fromARGB(118, 161, 113, 96),
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(dish[index]["image"]),
                            fit: BoxFit.cover)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 20, 100, 0),
                    child: Text(
                      dish[index]["title"],
                      style: const TextStyle(
                          fontFamily: "Inter",
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text("₹ ${dish[index]["price"]}")
                ],
              ));
        }))
      ],
    ));
  }
}

List<Map> dish = [
  {
    "image": "assets/images/cococoffee.jpg",
    "title": "Coco Coffee",
    "price": 120
  },
  {
    "image": "assets/images/FCoffee.jpeg",
    "title": "Filter coffee",
    "price": 100
  },
  {"image": "assets/images/amaricano.jpg", "title": "Americano", "price": 110},
  {"image": "assets/images/mocha.jpg", "title": "Mocha", "price": 260},
  {"image": "assets/images/Espresso.jpeg", "title": "Espresso", "price": 110},
  {"image": "assets/images/latte.jpeg", "title": "Latte", "price": 110},
  {
    "image": "assets/images/capaccino.jpg",
    "title": "Cappucciono",
    "price": 140
  },
  {
    "image": "assets/images/coldcoffee.png",
    "title": "Cold Coffee",
    "price": 150
  },
  {
    "image": "assets/images/hotchoco.jpg",
    "title": "Hot Chocolate",
    "price": 190
  }
];
