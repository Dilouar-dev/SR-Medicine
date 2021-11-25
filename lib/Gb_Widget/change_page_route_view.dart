import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChangePageRouteView extends StatefulWidget {
  String name;
  String url;

  ChangePageRouteView({required this.name, required this.url});

  @override
  _ChangePageRouteViewState createState() => _ChangePageRouteViewState();
}

class _ChangePageRouteViewState extends State<ChangePageRouteView> {
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
        title: Text(widget.name),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: progress,
            color: Colors.red,
            backgroundColor: Colors.black12,
          ),
          Expanded(
            child: WebView(
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              onProgress: (progress) => setState(() {
                this.progress = progress / 100;
              }),
            ),
          ),
        ],
      ),
    );
  }
}
