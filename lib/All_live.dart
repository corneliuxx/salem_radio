import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'Helper/Constant.dart';
import 'package:share/share.dart';
import 'LivePages.dart';
import 'main.dart';
import 'Helper/Livetv_Model.dart';

class AllTv extends StatefulWidget {
  AllTv({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AllTvState createState() => new _AllTvState();
}

class _AllTvState extends State<AllTv> {

  Future<List<User>> _getUsers() async {

    var data = await http.get("http://app.mbeziluislutheran.or.tz/livetv/index.json");

    var jsonData = json.decode(data.body);

    List<User> users = [];

    for(var u in jsonData){

      User user = User(u["index"], u["about"], u["name"], u["email"], u["picture"]);

      users.add(user);

    }

    print(users.length);

    return users;

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: Container(
        child: FutureBuilder(
          future: _getUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            print(snapshot.data);
            if(snapshot.data == null){
              return Container(
                  child: Center(
                      child: Text("Loading...")
                  )
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            snapshot.data[index].picture
                        ),
                      ),
                      title: Text(snapshot.data[index].name),

                      onTap: (){

                        Navigator.push(context,
                            new MaterialPageRoute(builder: (context) => LivePage(snapshot.data[index]))
                        );

                      },
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}




