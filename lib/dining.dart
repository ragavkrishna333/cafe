import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Dining extends StatefulWidget {
  const Dining({super.key});

  @override
  State<Dining> createState() => _DiningState();
}

class _DiningState extends State<Dining> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      CustomScrollView(
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
            pinned: true,
            expandedHeight: 200,
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(childCount: dish.length,
                  (context, index) {
            return Container(
                color: Color.fromARGB(118, 161, 113, 96),
                height: 100,
                child: ListTile(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        dish[index]["add"] = !dish[index]["add"];
                      }
                    });
                  },
                  onLongPress: () {
                    setState(() {
                      dish[index]["add"] = true;
                      isSelected = true;
                    });
                  },
                  selected: dish[index]["add"] ?? false,
                  visualDensity: VisualDensity(vertical: 0.5),
                  titleAlignment: ListTileTitleAlignment.center,
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      dish[index]["image"],
                    ),
                  ),

                  // Container(
                  //   margin: EdgeInsets.only(top: 20),
                  //   height: 100,
                  //   width: 100,
                  //   decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       image: DecorationImage(
                  //           image: AssetImage(dish[index]["image"]),
                  //           fit: BoxFit.cover)),
                  // ),
                  title: Padding(
                    padding: EdgeInsets.only(right: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 133, 94, 78),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            dish[index]["title"],
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: "Inter",
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "₹ ${dish[index]["price"]}",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ))
                      ],
                    ),
                  ),
                  trailing: Visibility(
                      visible: isSelected,
                      child: Checkbox(
                        value: dish[index]["add"] ?? false,
                        onChanged: (value) {
                          setState(() {
                            currentIndex = index;
                            dish[index]["add"] = value!;
                            // isSelected = value!;
                          });
                        },
                      )),
                ));
          })),
        ],
      ),
      Positioned(
          left: 10,
          right: 10,
          bottom: 10,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 5,
                      color: const Color.fromARGB(255, 63, 44, 38),
                      offset: Offset(0, 0))
                ],
                borderRadius: BorderRadius.circular(20),
                color: Color.fromRGBO(63, 44, 38, 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Color.fromRGBO(100, 70, 61, 1),
                    onPressed: () {},
                    child: Text(
                      "Add",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isSelected,
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        isSelected = false;
                        cancel();
                        // dish[currentIndex!]["add"];
                      });
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ))
    ]));
  }
}

cancel() {
  for (var element in dish) {
    element["add"] = false;
  }
}

List<Map> dish = [
  {
    "image": "assets/images/cococoffee.jpg",
    "title": "Coco Coffee",
    "price": 120,
    "add": false
  },
  {
    "image": "assets/images/FCoffee.jpeg",
    "title": "Filter coffee",
    "price": 100,
    "add": false
  },
  {
    "image": "assets/images/amaricano.jpg",
    "title": "Americano",
    "price": 110,
    "add": false
  },
  {
    "image": "assets/images/mocha.jpg",
    "title": "Mocha",
    "price": 260,
    "add": false
  },
  {
    "image": "assets/images/Espresso.jpeg",
    "title": "Espresso",
    "price": 90,
    "add": false
  },
  {
    "image": "assets/images/latte.jpeg",
    "title": "Latte",
    "price": 160,
    "add": false
  },
  {
    "image": "assets/images/capaccino.jpg",
    "title": "Cappucciono",
    "price": 140
  },
  {
    "image": "assets/images/coldcoffee.png",
    "title": "Cold Coffee",
    "price": 150,
    "add": false
  },
  {
    "image": "assets/images/hotchoco.jpg",
    "title": "Hot Chocolate",
    "price": 190,
    "add": false
  }
];
bool isSelected = false;
int? currentIndex;
