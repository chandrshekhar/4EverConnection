import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:forever_connection/core/utils/toast_widget.dart';
import 'package:photo_view/photo_view.dart';

class ShowImage extends StatelessWidget {
  final String imageUrl;
  const ShowImage({
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String extension = imageUrl.split('.').last;
    if (extension == 'pdf') {
      return customImageViewWidget(
          child: const PDF().cachedFromUrl(
        imageUrl,
        maxAgeCacheObject: const Duration(days: 30),
        placeholder: (progress) => Center(child: Text('$progress %')),
        errorWidget: (error) => const Center(child: Text('Loading...')),
      ));
    } else if (extension == 'jpg' ||
        extension == 'JPG' ||
        extension == 'jpeg' ||
        extension == 'png') {
      return customImageViewWidget(
          child: PhotoView(imageProvider: NetworkImage(imageUrl)));
    } else if (extension == 'doc' || extension == 'docx') {
          return customImageViewWidget(child: Text(""));
    } else {
      ToastWidget.errorToast(error: "Document is not valid");
      return const Center(child: Text("Invalid document"));
    }
  }

  Widget customImageViewWidget({required Widget child}) {
    return Scaffold(
      body: SafeArea(child: child),
    );
  }
}
