import 'package:flutter/material.dart';
import 'package:signalapp/module/article.dart';
import '../database.dart';

class Article extends StatefulWidget {
  final String choose;

  Article(this.choose);

  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  DatabaseService db = DatabaseService();
  List<article> articlelist = [];
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

          offset = articlelist.length;
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
          title: Center(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90)),
                      child: ListTile(
                        leading: Icon(
                          Icons.article,
                          color: Colors.black,
                        ),
                        title: Text(
                          "Article Page",
                          style: TextStyle(fontSize: 22, color: Colors.black),
                        ),
                      )),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.blue.shade50,
          elevation: 0,
        ),
        body: Stack(alignment: Alignment.center, children: <Widget>[
          Container(),
          ListView.builder(
            controller: _scrollController,
            itemCount: articlelist.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.all(5),
                color: Colors.white,
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
                            gradient: LinearGradient(
                                colors: [
                              Colors.white10,
                              Colors.deepOrange.shade200,
                              Colors.deepOrange.shade100,
                              Colors.grey,
                            ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),

                        child: Column(children: [
                          Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(5),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    '${articlelist[index].image1}',
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                    width:
                                        MediaQuery.of(context).size.width / 1.3,
                                    fit: BoxFit.cover,
                                  ))),
                          // Text(
                          //   "Canvas",
                          //   textAlign: TextAlign.center,
                          //   style: TextStyle(
                          //       fontSize: 22, fontWeight: FontWeight.w900),
                          // ),

                          Text(
                            "${articlelist[index].heading}",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${articlelist[index].article1}",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            "${articlelist[index].article2}",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                          Text(
                            "${articlelist[index].article3}",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),

                          Image.network(
                            "${articlelist[index].image2}",
                            height: 200.0,
                          ),

                          Text(
                            "${articlelist[index].auther}",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'RobotoMono',
                            ),
                          ),
                        ]),
                      ),
                      // onTap: () {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => wallpaperPage('Wallpaper')));
                      // },
                    ),
                  ],
                ),
              );
            },
          ),
        ]));
  }

  fetch(int offset) async {
    print("in fetch");

    var data = await db.item();
    currentDataLength = data.length;
    print("below data");

    print("out of loop");

    setState(() {
      for (article p in data) {
        articlelist.add(p);
      }
    });
  }
}
