import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:uni/core/global/constants.dart';
import 'package:uni/views/widgets/home_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UPZ ~ University of Prizren"),
        centerTitle: true,
        backgroundColor: mainColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.bell,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          CarouselSlider(
            items: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.transparent),
                child: Center(
                  child: Text(
                    'UPZ ~ University of Prizren ',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ],
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 2.0,
              initialPage: 2,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: mainColor.withOpacity(0.5),
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 5,
            ),
            margin: const EdgeInsets.all(10.0),
            child: Text(
              "Araçlar ",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: menu.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                return HomeCard(
                  text: menu[index]['title'],
                  sizex: 0.30,
                  color1: menu[index]['color1'],
                  color2: menu[index]['color2'],
                  onPressed: menu[index]['onPressed'],
                  image: menu[index]['image'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
