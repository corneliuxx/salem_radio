import 'dart:convert';

//import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:salem_radio/Helper/City_Model.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'Category.dart';
import 'Helper/Constant.dart';
import 'Helper/Model.dart';
import 'Home.dart';
import 'SubCategory.dart';
import 'main.dart';


///for managing cat, sub-cat visibility in single layout
bool cityVisible = true, radioVisible = false;
List<City_Model> cityList = [];

///category sub-cat claass
class City extends StatefulWidget {
  final VoidCallback _play, _refresh ,_next, _previous, _pause;

  ///constructor
  City( {VoidCallback play,
    VoidCallback refresh,
    VoidCallback next,
    VoidCallback previous,
    VoidCallback pause})
      : _play = play,
        _refresh = refresh,
        _next = next,
        _previous = previous,
        _pause = pause;

  _Player_State createState() => _Player_State();
}

class _Player_State extends State<City>
    with AutomaticKeepAliveClientMixin<City> {
  @override
  Widget build(BuildContext context) {
    return _buildWebView();
  }

  Widget _buildWebView() {
    return WebView(
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl: 'https://www.youtube.com/embed/live_stream?channel=UCOAjX8pc2fY1S5AqsXvZywg',
    );
  }
  @override
  bool get wantKeepAlive => true;
}
