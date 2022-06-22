import 'dart:io';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:share/share.dart';
import 'All_live.dart';
import 'Helper/Constant.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'Helper/Livetv_Model.dart';

class LivePage extends StatefulWidget {
  final User user;

  LivePage(this.user);

  @override
  _LivePageState createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.name),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[primary, secondary],
            )
        ),
        child: ListView(
          children: <Widget>[
            Container(
              height: 240,
              child: _buildWebView(),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey, width: 0.5,
                  ),
                ),
              ),
              child: Expanded(
                child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage("${widget.user.picture}"),
                          ),
                          title: Text(
                            "${widget.user.name}", style: TextStyle(color: apptextcolor),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {

                          if (Platform.isAndroid) {
                            Share.share('I am listening to-\n'
                                '$appname\n'
                                'https://play.google.com/store/apps/details?id=$androidPackage&hl=en');
                          } else {
                            Share.share('Watch this video on Salem Radio -\n'
                                '$appname\n'
                                '$iosPackage');
                          }
                        },
                        child: _buildButtonColumn(Icons.share, "Share"),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                            tabController.animateTo(2);

                          },

                          child: _buildButtonColumn(Icons.playlist_add, "Radio")),
                      SizedBox(
                        width: 10,
                      ),
                    ]
                ),
              ),
            ),
            SizedBox(
              height: 0,
            ),
            Container(
              height: 260,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(

                children: [
                  Expanded(
                      child: Text("${widget.user.about}",style: TextStyle(color: apptextcolor))
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
  Widget _buildWebView() {
    return WebView(
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl: 'https://www.youtube.com/embed/live_stream?channel=${widget.user.email}',
    );
  }
  Widget _buildButtonColumn(IconData icon, String text) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Icon(
            icon,
            color: apptextcolor,
          ),
        ),
        Text(
          text,
          style: TextStyle(color: apptextcolor),
        ),
      ],
    );
  }
}


