import 'dart:html';

import 'package:flutter/material.dart';
import 'package:signalapp/database.dart';
import 'package:signalapp/module/news.dart';

import '../constant.dart';
import '../main.dart';

class wallpaperPage extends StatefulWidget {
  @override
  final String category;

  wallpaperPage(this.category);

  _wallpaperPageState createState() => _wallpaperPageState();
}

class _wallpaperPageState extends State<wallpaperPage> {
  DatabaseService db = DatabaseService();
  List<news> wallpaperList = [];
  ScrollController _scrollController = new ScrollController();

  TextEditingController search = new TextEditingController();
  TextEditingController contact = new TextEditingController();

  int offset = 0;

  int currentDataLength = 0;

  @override
  void initState() {
    super.initState();
    fetch(offset);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (currentDataLength >= 10) {
          print("List bigger than 10");

          offset = wallpaperList.length;
          fetch(offset);
        }

        print("called again");
        print(" OFFSET $offset  CURRENT VALUE $currentDataLength");
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: Center(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(90)),
                  child: ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text(
                      "Information Page",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: wallpaperList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Container(
                    // height: MediaQuery.of(context).size.height / 2,
                    // width: MediaQuery.of(context).size.width / 2,
                    padding: EdgeInsets.all(2),
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(color: Colors.orange, width: 1)),
                    
                    child: Column(children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(5),

                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            '${wallpaperList[index].image1}',
                            height: MediaQuery.of(context).size.height / 2,
                            width: MediaQuery.of(context).size.width / 1.3,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        "${wallpaperList[index].heading}",
                        style: TextStyle(
                          letterSpacing: 1,
                          color: Colors.indigo,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        "${wallpaperList[index].news1}",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.green,
                          fontSize: 17,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      Text(
                        "${wallpaperList[index].news2}",
                        style: TextStyle(
                           decoration: TextDecoration.underline,
                          color: Colors.green,
                          fontSize: 17,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "${wallpaperList[index].news3}",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.green,
                          fontSize: 17,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Image.network(
                        "${wallpaperList[index].image2}",
                        height: 170.0,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "${wallpaperList[index].auther}",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(),
                    ]),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => wallpaperPage('Wallpaper')));
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  fetch(int offset) async {
    print("in fetch");

    var data = await db.allitem();
    currentDataLength = data.length;
    print("below data");

    print("out of loop");

    setState(() {
      for (news p in data) {
        wallpaperList.add(p);
      }
    });
  }
}
