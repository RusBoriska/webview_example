import 'package:flutter/material.dart';

import '/webview_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      title: "WebView Example",
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  void _handleURLButtonPress(BuildContext context, String url) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WebViewPage(url: url)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView Example'),
      ),
      body: SizedBox(
          width: double.infinity,
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  ElevatedButton(
                      child: const Text(
                        "Google",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber, // Background color
                      ),
                      onPressed: () => _handleURLButtonPress(context, "https://www.google.com")
                      ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                      child: const Text(
                        "WebView for Flutter Page",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber, // Background color
                      ),
                      onPressed: () => _handleURLButtonPress(context, "https://pub.dev/packages/webview_flutter")
                      ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                      child: const Text(
                        "Flutter's page on Wikipedia",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber, // Background color
                      ),
                      onPressed: () => _handleURLButtonPress(context, "https://ru.wikipedia.org/wiki/Flutter")
                      ),
                ],
              )
            ],
          )

      ),
    );
  }

}