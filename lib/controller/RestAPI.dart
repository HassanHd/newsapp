import 'dart:convert';

import 'package:neewsaap/modeles/articles.dart';
import 'package:http/http.dart' as http;

class RestAPI {
 static String apiKey = "e2e73cedbcdd4f95a6394eea00ff1ec9";

 static Future<List<articles>> fetchArticles() async {
    List<articles> listarticles = [];
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=eg&apiKey=$apiKey");
    var respons = await http.get(url);
    var responsbody = jsonDecode(respons.body)["articles"];
    print(responsbody);
    for (var i in responsbody) {
      listarticles.add(articles(
        urlToImage: i["urlToImage"],
        url: i["url"],
        title: i["title"],
        description: i["description"],
      ));
    }
    return listarticles;
  }
 static Future<List<articles>> fetchcategoryArticles(String category) async {
   List<articles> listarticles = [];
   var url = Uri.parse(
       "https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=$apiKey");
   var respons = await http.get(url);
   var responsbody = jsonDecode(respons.body)["articles"];
   print(responsbody);
   for (var i in responsbody) {
     listarticles.add(articles(
       urlToImage: i["urlToImage"],
       url: i["url"],
       title: i["title"],
       description: i["description"],
     ));
   }
   return listarticles;
 }


}
