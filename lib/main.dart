import 'dart:convert';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sample/course_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List Names=[
    "Category",
    "Classes",
    "Free Course",
    "Live Course",
    "LeaderBoard",
  ];

  List<Color> catColors=[
    Color(0xFFF06292),
    Color(0xFFF07043),
    Color(0xFFFFCC80),
    Color(0xFF00ACC1),
    Color(0xFFFFCDD2),
  ];

  List bgimg=[
    Image(image: AssetImage("img/ed2.jpg")),
    Image(image: AssetImage("img/ed3.jpg")),
    Image(image: AssetImage("img/ed4.jpg")),
    Image(image: AssetImage("img/ed5.jpg")),
  ];

  List<Icon> catIcons=[
    Icon(Icons.category, color: Colors.white, size: 30),
    Icon(Icons.video_library, color: Colors.white, size: 30),
    Icon(Icons.assignment, color: Colors.white, size: 30),
    Icon(Icons.play_circle_filled, color: Colors.white, size: 30),
    Icon(Icons.emoji_events, color: Colors.white, size: 30),
  ];

  List imgList=[
    'flutter',
    'java',
    'react-js',
    'python',
  ];

  List imageList=[
    {"id": 1, "image_path": 'img/ed3.jpg'},
    {"id": 2, "image_path": 'img/slider1.jpg'},
    {"id": 3, "image_path": 'img/ed5.jpg'},
    {"id": 4, "image_path": 'img/slider2.jpg'},
  ];

  final CarouselController carouselController = CarouselController();
  int currentindex = 0;

  GlobalKey<ScaffoldState> _scanfoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
  return Container(
    color: Colors.deepOrange,
    child: SafeArea(
      child: Scaffold(
        key: _scanfoldkey,
          drawer: Drawer(
            child: ListView(
              children: [
               UserAccountsDrawerHeader(
                   accountName: Text(
                     "ABC",
                     style: TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.w600,
                     ),
                   ),
                   accountEmail: Text(
                       "abc@gmail.com",
                   ),
                   currentAccountPicture: CircleAvatar(
                     child: ClipOval(
                       child: Image.asset(
                           "img/profile.jpg",
                            width: 90,
                            height: 90,
                           fit: BoxFit.cover,
                       ),
                     ),
                   ),
                 decoration: BoxDecoration(
                   image: DecorationImage(
                     image: AssetImage("img/bg2.jpg"),
                     fit: BoxFit.cover,
                     opacity: 0.8,
                   ),
                 ),
               ),
               ListTile(
                 leading: Icon(Icons.save_as_rounded),
                 title: Text("Saved Playlist"),
                 onTap: () => null,
               ),
                ListTile(
                  leading: Icon(Icons.watch_later),
                  title: Text("Watch Later"),
                  onTap: () => null,
                ),
                ListTile(
                  leading: Icon(Icons.share),
                  title: Text("Share"),
                  onTap: () => null,
                ),
                ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text("Notifications"),
                  onTap: () => null,
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                  onTap: () => null,
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("Logout"),
                  onTap: () => null,
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            icon: Icon(Icons.menu,size: 24,color: Colors.black,),
                             onPressed: () => _scanfoldkey.currentState?.openDrawer(),
                        ),
                        Row(
                          children: [
                            Icon(Icons.search)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Educatworks",
                        style: TextStyle(
                            fontSize: 30,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  height: 180,
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          print(currentindex);
                        },
                        child: CarouselSlider(
                          items: imageList
                              .map(
                                (item) => Image.asset(
                              item['image_path'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          )
                              .toList(),
                          carouselController: carouselController,
                          options: CarouselOptions(
                            scrollPhysics: const BouncingScrollPhysics(),
                            autoPlay: true,
                            aspectRatio: 2,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentindex = index;
                              });
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: imageList.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () => carouselController.animateToPage(entry.key),
                              child: Container(
                                width: currentindex == entry.key ? 17 : 7,
                                height: 7.0,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 3.0,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: currentindex == entry.key
                                        ? Colors.red
                                        : Colors.teal),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(
                    top: 35,
                      left: 15,
                    right: 15,
                    bottom: 10
                  ),
                    child: Column(
                      children: [
                        GridView.builder(
                            itemCount: Names.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1.1
                            ),
                            itemBuilder: (context,index){
                              return Column(
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      color: catColors[index],
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: catIcons[index],
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                    Names[index],
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black.withOpacity(0.7),
                                    ),
                                  ),
                                ],
                              );
                            },
                        ),
                      ],
                    ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Courses",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ],
                ),
                ),
                SizedBox(height: 20),

                GridView.builder(
                  padding: const EdgeInsets.only(left: 10),
                    itemCount: imgList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      childAspectRatio: (
                      MediaQuery.of(context).size.height) / (4 * 240),
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index){
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => CourseScreen(imgList[index]),
                          ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFFF5F3FF),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.all(10),
                                 child: Image.asset(
                                   "img/${imgList[index]}.png",
                                   width: 100,
                                   height: 100,
                                 ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                imgList[index],
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black..withOpacity(0.6),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                ),
              ],
            ),
          ),
      ),
    ),
  );
  }
}

