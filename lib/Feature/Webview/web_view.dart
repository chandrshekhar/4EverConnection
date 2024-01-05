import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';
import 'package:forever_connection/core/constants/colors.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({
    super.key,
    required this.webViewUrl,
  });

  final String webViewUrl;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

// ignore: always_specify_types
class _WebViewScreenState extends State<WebViewScreen> {
  final loaderController = Get.put(LoaderController());
  @override
  void initState() {
    loaderController.isLaoding(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WebViewController webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageFinished: (String url) {
          loaderController.setLaoderValue();
        },
      ))
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
        body: Obx(() => SafeArea(
              child: loaderController.isLaoding.value
                  ? const Center(child: CircularProgressIndicator.adaptive())
                  : WebViewWidget(controller: webViewController),
            )),
        // ),
      ),
    );
  }
}

class LoaderController extends GetxController {
  RxBool isLaoding = true.obs;

  setLaoderValue() {
    isLaoding.value = false;
  }
}
