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
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
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
                onProgress: (progress) => setState(() {
                  this.progress = progress / 100;
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Exit App'),
            content: Text('Do you want to exit an App?'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                //return false when click on "NO"
                child: Text('No'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                //return true when click on "Yes"
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }
}
