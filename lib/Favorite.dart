import 'dart:io';

//import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'BottomPanel.dart';
import 'Helper/Constant.dart';
import 'Helper/Model.dart';
import 'Home.dart';
import 'Now_Playing.dart';
import 'main.dart';

///for bottom panel
PanelController panelController;

///list of search
List<Model> searchresult = [];

///currently searching
bool isSearching;

///radio station list
List<Model> radioStationList = [];

///sub category loading
bool subloading = true;


///favorite class
class Favorite extends StatefulWidget {
  VoidCallback _play, _pause, _next, _previous;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Members Only',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Home(),
    );
  }


  ///constructor
  Favorite(
      {VoidCallback play,
      VoidCallback pause,
      VoidCallback next,
      VoidCallback previous})
      : _play = play,
        _pause = pause,
        _previous = previous,
        _next = next;

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> with AutomaticKeepAliveClientMixin<Favorite>  {final myController = TextEditingController();
String url = 'https://github.com/pravodev';
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();



@override
void dispose() {
  // Clean up the controller when the Widget is disposed
  myController.dispose();
  super.dispose();
}

Widget buildWebView(BuildContext context, _title, _showBackButton) {
  return WebviewScaffold(
    url: this.url,
    appBar: new AppBar(
      title: Text(_title),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                secondary,
                primary.withOpacity(0.5),
                primary.withOpacity(0.8)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.15, 0.5, 0.7]),
        ),
      ),
      centerTitle: true,

    ),
    withZoom: true,
    withLocalStorage: true,
    hidden: true,
    initialChild: Container(
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    ),
  );
}
@override
Widget build(BuildContext context){
  return Scaffold(
    key: _scaffoldKey,
    appBar: AppBar(
      title: Text('Members Only'),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                secondary,
                primary.withOpacity(0.5),
                primary.withOpacity(0.8)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.15, 0.5, 0.7]),
        ),
      ),
      centerTitle: true,
    ),
    drawer: _createDrawer(),
    body: WebView(
      initialUrl: 'http://apply.brandgenesis.agency/',
      javascriptMode: JavascriptMode.unrestricted,

    ),
  );
}


void _goToWebView(){
  String text = myController.text;
  if(text == "" || text == null){
    return _showAlert("Url Cannot Empty");
  }

  setState(() {
    url = text;
  });

  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => buildWebView(context, "Webview Example", false)
  ));
}

void _showAlert(text){
  SnackBar snackBar = SnackBar(
    content: Text(text),
    backgroundColor: Colors.red,
  );

  _scaffoldKey.currentState.showSnackBar(snackBar);
}



Drawer _createDrawer()
{
  return Drawer(child: Container(
      decoration: BoxDecoration(
      gradient: LinearGradient(
      colors: [
      secondary,
      primary.withOpacity(0.8),
      primary.withOpacity(0.9)
      ],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      // Add one stop for each color. Stops should increase from 0 to 1
      stops: [0.2, 0.4, 0.9],
      tileMode: TileMode.clamp),
      ),
    child: ListView(
      children: <Widget>[
        DrawerHeader(
          child: Image.asset(
            'assets/image/logo2.png',width: 150,
            height: 150,),
          padding: EdgeInsets.all(0.0),
          decoration: BoxDecoration(
            color: Colors.deepPurple,
          ),
        ),
        ListTile(
          title: Text('Home', style: TextStyle(color: Colors.white)),

          subtitle: Text('Back to App Home', style: TextStyle(color: Colors.white)),
          dense: true,
          leading: Icon(Icons.home, color: Colors.white),
          onTap: () {
            Navigator.pop(context);
            Navigator.pop(context);

          },
        ),
        ListTile(
          title: Text('Members Home', style: TextStyle(color: Colors.white) ),
          subtitle: Text('Members Home Page', style: TextStyle(color: Colors.white) ),
          dense: true,
          leading: Icon(Icons.account_balance, color: Colors.white),
          onTap: () {
            setState(() {
              url = 'http://apply.brandgenesis.agency/';
            });
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => buildWebView(context, "My Account", true)
            ));
          },
        ),
        ListTile(
          title: Text('My Account', style: TextStyle(color: Colors.white) ),
          subtitle: Text('Subscription Status', style: TextStyle(color: Colors.white)),
          dense: true,
          leading: Icon(Icons.account_circle, color: Colors.white),
          onTap: () {
            setState(() {
              url = 'http://apply.brandgenesis.agency/iump-account-page/';
            });
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => buildWebView(context, "My Account", true)
            ));
          },
        )
      ],
    )),
  );
}
@override
bool get wantKeepAlive => true;
}

