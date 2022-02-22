import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neewsaap/controller/RestAPI.dart';
import 'package:neewsaap/controller/fun.dart';
import 'package:neewsaap/view/widgets/CategoriesButton.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      body: Padding(
        padding: const EdgeInsets.all(hpaddingsmaller),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: hpaddingsmaller, vertical: hpaddingbigger),
              child: Text(
                "Choose News Categories",
                style: TextStyle(fontSize: fontxlarg, color: textColor),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 14,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoriesButton(
                    buttonText: 'General',
                    buttoncolor: green,
                  ),
                  CategoriesButton(
                    buttonText: 'Business',
                    buttoncolor: blue,
                  ),
                  CategoriesButton(
                    buttonText: 'Sports',
                    buttoncolor: orangeDark,
                  ),
                  CategoriesButton(
                    buttonText: 'Health',
                    buttoncolor: red,
                  ),
                  CategoriesButton(
                    buttonText: 'Entertainment',
                    buttoncolor: yellow,
                  ),
                  CategoriesButton(
                    buttonText: 'Science',
                    buttoncolor: orangeLight,
                  ),
                  CategoriesButton(
                    buttonText: 'Technology',
                    buttoncolor: blue,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(hpaddingsmaller),
              child: Text(
                "Best News",
                style: TextStyle(fontSize: fonttitel, color: textColor),
              ),
            ),
            Expanded(
                child: FutureBuilder(
              future: RestAPI.fetchArticles(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () async {
                          Fun.openLink("${snapshot.data[index].url}");
                        },
                        child: Card(
                          color: white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          elevation: 5,
                          shadowColor: textColor,
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(25),
                                    ),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            "${snapshot.data[index].urlToImage}"))),
                              ),
                              // Image.network(
                              //     ""),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  "${snapshot.data[index].title}",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Fun.ShareLink(
                                            "${snapshot.data[index].url}");
                                      },
                                      icon: Icon(Icons.share)),
                                  IconButton(
                                      onPressed: () {

                                        Fun.copyLink("${snapshot.data[index].url}").then((val){

                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                            content: const Text('Copy.... '),
                                          ));

                                        });
                                      },
                                      icon: Icon(Icons.copy_rounded)),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                      child: CircularProgressIndicator(
                    backgroundColor: orangeLight,
                  ));
                }
              },
            )),
          ],
        ),
      ),
    );
  }
}
