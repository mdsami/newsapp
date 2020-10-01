import 'dart:convert';

import 'package:classic_flutter_news/helper/api.dart';
import 'package:classic_flutter_news/ui/player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';
import '../podo/category.dart';
import '../providers/favorites_provider.dart';
import '../widgets/fav_news.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  void initState() {
    api.GetVideo().then((value) {
      setState(() {
        myData = jsonDecode(value);
      });
    });
    super.initState();
  }

  var myData;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Videos",
          ),
        ),
        body: myData == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
            shrinkWrap: true,

            itemCount: 3,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      Route route =
                      MaterialPageRoute(builder: (context) => Player(myData['feed']['entry'][index]['url'].toString().split("=")[1]));
                      Navigator.push(context, route);
                    },

                    child: FadeInImage.assetNetwork(
                      placeholder: "assets/images/logo.png",

                      image:
                      "https://img.youtube.com/vi/${myData['feed']['entry'][index]['url'].toString().split("=")[1]}/0.jpg",

                      width: 600,
                      height: 300,
                    ),
                  )
                ],
              );
            }));
  }

  Api api = Api();
}
