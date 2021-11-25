import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sr_medicine/Navigation/NavDrawer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double progress = 0;

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SR-Medicine'),
      ),
      drawer: Nav_Drawer(),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: progress,
            color: Colors.redAccent,
            backgroundColor: Colors.black12,
          ),
          Expanded(
            child: WebView(
                initialUrl: 'https://shahanarahmanmedicine.com/shop/',
                javascriptMode: JavascriptMode.unrestricted,
              

                onProgress: (progress) => setState(() {this.progress = progress/100;}),
            ),
          ),
        ],
      ),
    );
  }

}
