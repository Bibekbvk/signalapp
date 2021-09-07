import 'dart:ui';

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
      backgroundColor: Colors.blueGrey,
           appBar: AppBar(
             backgroundColor:Colors.orange,
        title: Center(
          child: Row(
            children: [
              Expanded(
             
                child: Container(
                  decoration: BoxDecoration(         
                      borderRadius: BorderRadius.circular(90)),
                      child:ListTile(
                        leading: Icon(Icons.photo_album),
                        title:Text("News Page", style: TextStyle(fontSize: 22,
                         color: Colors.black,
                         fontWeight: FontWeight.bold,
                         ),
                         ),
                        

                      )
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
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                      InkWell(
                  child: Container(
                    // height: MediaQuery.of(context).size.height / 2,
                    // width: MediaQuery.of(context).size.width / 2,
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Column(children: [

                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(
                          color: Colors.orangeAccent, width: 2)),
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.all(5),
                          child: ClipRRect(
                             borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                            '${wallpaperList[index].image1}',
                            // height: MediaQuery.of(context).size.height / 2,
                            // width: MediaQuery.of(context).size.width / 1.3,
                            fit: BoxFit.cover,
                          ))),
                      Text(
                        "Canvas",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                      height: 10,
                      ),

                      // Text(
                      //   "${wallpaperList[index].heading}",
                      // style: TextStyle(
                      //   fontSize: 20,
                      //    color: Colors.red,
                      //   fontWeight: FontWeight.bold,
                      // ),  
                      // ),
                      SizedBox(
                      height: 10,
                      ),
                      Text("${wallpaperList[index].news1}",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),  ),
                         Text("${wallpaperList[index].news2}",
                         style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                         
                            Text("${wallpaperList[index].news3}",
                               style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),),
                                Image.network("image:${wallpaperList[index].image2}",
                              
                                ),
                                  Text("auther:${wallpaperList[index].auther}",
                                  style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),),
                    
                              // Container(
                              //   child: ElevatedButton(
                              //     //hoverColor: Colors.blueAccent,
                                  
                              //     child: Text("Order this item"),
                              //     onPressed:(){
                              //          print("hello");
                                      
                              //     showDialog(
                              //       context: context,
                              //       builder: (context) => AlertDialog(
                              //         title: Text(
                              //             "Please enter you active number, technician will call you for more details"),
                              //         content: TextField(
                              //           controller: contact,
                              //           decoration: InputDecoration(
                              //             icon: Icon(Icons.contact_phone),
                              //             labelText: "Enter your active number"
                              //           ),
                              //         ),
                              //         actions: [
                              //           ElevatedButton(
                              //             child: Text("Submit"),
                              //             // color: Colors.cyanAccent,
                              //             onPressed: () async {
                                        
                                       
                              //               var res =
                              //                   await db.insertnews(
                              //                       wallpaperList[index].news_id,
                              //                       wallpaperList[index].heading,
                              //                       wallpaperList[index].auther,
                              //                       contact.text,
                              //                       DateTime.now());

                              //               if (res == 200) {
                              //                 showDialog(
                              //                   context: context,
                              //                   builder: (context) => AlertDialog(
                              //                       title: Text(
                              //                           "Successfully purchased, we will call you for more details"),
                              //                           actions: [
                              //                             ElevatedButton(
                              //                               child:Text("OK"),
                              //                               onPressed:(){
                              //                                Navigator.of(context, rootNavigator: true).pop();

                              //                               }
                              //                             )
                              //                           ],
                              //                           ),
                                                        
                              //                 );

                              //                 print("success");
                                            
                              //                    Navigator.push(
                              //                     context,
                              //                     MaterialPageRoute(
                              //                         builder: (context) =>
                              //                            MyHomePage(title: 'Beautiful People',)));
                                                
                                         
                              //               //   Navigator.pop(context);
                              //               //   Navigator.pop(context);
                              //               //   Navigator.push(
                              //               //       context,
                              //               //       MaterialPageRoute(
                              //               //           builder: (context) =>
                              //               //               myMedicines()));
                              //               // } else {
                              //                 print("failure");
                              //               }
                              //             },
                              //           ),
                              //          // RaisedButton(child: Text("Cancel"))
                              //         ],
                              //       ),
                              //     );


                              //     }
                                    
                              //   ),

                              // )
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
