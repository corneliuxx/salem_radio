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


