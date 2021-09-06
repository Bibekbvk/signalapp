import 'package:flutter/material.dart';
import 'package:newsapp/components/bodybutton.dart';
import 'package:newsapp/components/text_types.dart';
import 'package:newsapp/module/news.dart';
import '../database.dart';

class NewsPage extends StatefulWidget {
  NewsPage(this.category);

  final String category;

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  DatabaseService db = DatabaseService();
  List<news> newsList = [];
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

          offset = newsList.length;
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
      body: SafeArea(child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("head:${newsList[index].heading}"),
              Text("news1:${newsList[index].news1}"),
              Text("news2:${newsList[index].news2}"),
              Text("news3:${newsList[index].news3}"),
              Text("image:${newsList[index].image2}"),
              Text("auther:${newsList[index].auther}"),
            ],
          );
        },
      )
          // Column(
          //   children: <Widget>[
          //     Expanded(
          //       child: Container(
          //         child: Stack(
          //           children: <Widget>[
          //             Positioned.fill(
          //               child: Align(
          //                 alignment: Alignment.bottomRight,
          //                 child: Image.asset(
          //                   "assets/images/aloevera.png",
          //                 ),
          //               ),
          //               bottom: 10,
          //               left:
          //                   100, // if you want to move image from bottom/top/left/right, just add value here
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.only(
          //                 left: 30.0,
          //               ),
          //               child: Column(
          //                 children: <Widget>[
          //                   Align(
          //                       alignment: Alignment.topLeft,
          //                       child: Column(
          //                         children: <Widget>[
          //                           SmallText(
          //                             label: "OUTDOOR",
          //                           ),
          //                           LargeText(label: "Aloe Vera"),
          //                           SizedBox(height: 20.0),
          //                           SmallText(label: "FROM"),
          //                           LargeText(label: "\$ 25"),
          //                           SizedBox(height: 20.0),
          //                           SmallText(label: "SIZE"),
          //                           LargeText(label: "Small"),
          //                           Align(
          //                             alignment: Alignment.topLeft,
          //                             child: BodyButton(),
          //                           ),
          //                         ],
          //                       ))
          //                 ],
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //     Expanded(
          //       child: Container(
          //           child: Padding(
          //             padding:
          //                 const EdgeInsets.only(top: 20, left: 20, right: 20),
          //             child: Column(
          //               children: <Widget>[
          //                 LargeTextBlack(label: "All to know . . . "),
          //                 Text(
          //                   "Aloe vera is a succulent plant species of the genus Aloe. Having some 500 species, Aloe is widely distributed, and is considered an invasive species in many world regions. ",
          //                   textAlign: TextAlign.justify,
          //                 ),
          //                 SizedBox(height: 30),
          //                 LargeTextBlack(label: "Details"),
          //                 Align(
          //                   alignment: Alignment.topLeft,
          //                   child: Text(
          //                     "Plant Height: 35-45cm \nNursery pot width: 12cm",
          //                   ),
          //                 )
          //               ],
          //             ),
          //           ),
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             borderRadius: BorderRadius.vertical(
          //               top: Radius.circular(20.0),
          //             ),
          //           )),
          //     ),
          //   ],
          // ),
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
        newsList.add(p);
      }
    });
  }
}
