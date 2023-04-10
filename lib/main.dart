import 'dart:convert';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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

  List<Icon> catIcons=[
    Icon(Icons.category, color: Colors.white, size: 30),
    Icon(Icons.video_library, color: Colors.white, size: 30),
    Icon(Icons.assignment, color: Colors.white, size: 30),
    Icon(Icons.play_circle_filled, color: Colors.white, size: 30),
    Icon(Icons.emoji_events, color: Colors.white, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
  return Container(
    color: Colors.deepOrange,
    child: SafeArea(
      child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.menu,size: 24,color: Colors.black,),
                      Row(
                        children: [
                          Icon(Icons.search),
                          SizedBox(width: 10,),
                          Icon(Icons.notifications),
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
                    child: Text("Educatworks", style: TextStyle(fontSize: 30),),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Container(
                height: 180,
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        left: -20,
                        right: -20,
                        child:   Container(
                          height: 180,
                          child: PageView.builder(
                              controller: PageController(viewportFraction: 0.8),
                              itemCount: 4,
                              itemBuilder: (_, i)
                              {
                                return Container(
                                  height: 180,
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: AssetImage("img/ed3.jpg"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                );
                              }),
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
            ],
          ),
      ),
    ),
  );
  }
}
