import 'package:flutter/material.dart';
import 'package:neewsaap/controller/RestAPI.dart';
import 'package:neewsaap/controller/fun.dart';

import '../../constant.dart';

class CatagreScreen extends StatefulWidget {
  String textCatagre;

  CatagreScreen(this.textCatagre);

  @override
  _CatagreScreenState createState() => _CatagreScreenState();
}

class _CatagreScreenState extends State<CatagreScreen> {
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
              padding: const EdgeInsets.only(
                  left: hpaddingsmaller,
                  bottom: hpaddingsmaller,
                  right: hpaddingsmaller,
                  top: 30),
              child: Text(
                "${widget.textCatagre} News",
                style: TextStyle(fontSize: fontlarge, color: textColor),
              ),
            ),
            Expanded(
                child: FutureBuilder(
              future: RestAPI.fetchcategoryArticles(widget.textCatagre),
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
                                        Fun.copyLink(
                                                "${snapshot.data[index].url}")
                                            .then((val) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
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
