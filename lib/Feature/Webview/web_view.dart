import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  WebViewScreen({
    super.key,
    required this.webViewUrl,
  });

  final String webViewUrl;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

// ignore: always_specify_types
class _WebViewScreenState extends State<WebViewScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WebViewController webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..clearCache()
      // ..setNavigationDelegate(
      //   NavigationDelegate(
      //     onPageFinished: (String url) {
      //       get<WebViewScreenManager>()
      //           .setContentLoadingStateCmd
      //           .execute(false);
      //     },
      //   ),
      // )
      ..loadRequest(
        Uri.parse(
          widget.webViewUrl,
        ),
      );

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
            toolbarHeight: 40.h,
            backgroundColor: Colors.white,
            elevation: 0.0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.floatingActionButtonColor,
              ),
            )),
        body: SafeArea(
          child: WebViewWidget(controller: webViewController),
        ),
        // ),
      ),
    );
  }
}
