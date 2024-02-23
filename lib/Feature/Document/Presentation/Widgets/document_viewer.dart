import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:forever_connection/core/constants/image_constant.dart';
import 'package:forever_connection/core/utils/size_utils.dart';
import 'package:forever_connection/core/utils/toast_widget.dart';
import 'package:forever_connection/widgets/app_bar/appbar_image.dart';
import 'package:forever_connection/widgets/app_bar/appbar_title.dart';
import 'package:photo_view/photo_view.dart';

import '../../../../widgets/app_bar/custom_app_bar.dart';

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
        context: context,
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
          child: PhotoView(imageProvider: NetworkImage(imageUrl)),context: context);
    } else if (extension == 'doc' || extension == 'docx') {
          return customImageViewWidget(child: const Text(""),context: context);
    } else {
      ToastWidget.errorToast(error: "Document is not valid");
      return const Center(child: Text("Invalid document"));
    }
  }

  Widget customImageViewWidget({required Widget child,required BuildContext context}) {
    return Scaffold(
    appBar:  CustomAppBar(
            height: 60.v,
            leadingWidth: 44.h,
            leading: AppbarImage(
                svgPath: ImageConstant.imgArrowleftOnerrorcontainer,
                margin: EdgeInsets.only(left: 24.h, top: 6.v, bottom: 12.v),
                onTap: () {
                  Navigator.pop(context);
                }),
            centerTitle: true,
            title: AppbarTitle(text: "Document Image"),
           ),
      body: SafeArea(child: child),
    );
  }
}
