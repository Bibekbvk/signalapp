import 'package:signalapp/constant.dart';
import 'package:signalapp/module/news.dart';
import 'package:http/http.dart' as http;

class DatabaseService{

Future<List<news>> allitem() async {
    var data = await http.get(
      "$BASE_URL/api/getwallpaper",
      
    );

    var jsonData = json.decode((data.body));

    List<news> allitems = [];
    for (var each in jsonData) {
      news wallpaperList = news(
          P_id: each['P_id'],
          type: each['type'],
          name: each['name'],
          descr: each['descr'],
          price: each['price'],
          items: each['items'],
          others: each['others'],
          made: each['made'],
          images: each['images']
          );
      allitems.add(wallpaperList);
    }
    return allitems;
  }


}