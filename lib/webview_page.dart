import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '/navigation_controls.dart';


class WebViewPage extends StatelessWidget {
  const WebViewPage({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
Widget build(BuildContext context) {
    // Create a WebView controller
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // print the loading progress to the console
            // you can use this value to show a progress bar if you want
            debugPrint("Loading: $progress%");
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));

    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('WebView Example'),
            actions: [
              NavigationControls(controller: controller),
            ],
          ),
          body: SizedBox(
              width: double.infinity,
              // the most important part of this example
              child: WebViewWidget(
                controller: controller,
              )),
        ),
        onWillPop: () async {
          if(await controller.canGoBack()){
            controller.goBack();
            return false;
          }
          return true;
        }
  );

  }

}