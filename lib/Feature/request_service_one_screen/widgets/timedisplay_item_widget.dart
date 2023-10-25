import 'package:flutter/material.dart';
import 'package:forever_connection/core/app_export.dart';

// ignore: must_be_immutable
class TimedisplayItemWidget extends StatelessWidget {
  final String time;
  final Color? buttonColor;
  final Color? textColor;
  const TimedisplayItemWidget({Key? key, required this.time, this.buttonColor, this.textColor})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 18.h,
        vertical: 6.v,
      ),
      decoration: AppDecoration.fillPrimary.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder4,
          border: Border.all(color: Colors.black.withOpacity(0.5)),
          color: buttonColor ?? Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 1.v),
          Center(
            child: Text(
              time,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium!.copyWith(
                height: 1.28,
                color: textColor
              ),
            ),
          ),
        ],
      ),
    );
  }
}
