import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:forever_connection/core/app_export.dart';

class PhoneNumberTextFieldWidget extends StatefulWidget {
  final String lable;
  TextEditingController? phoneController;
   PhoneNumberTextFieldWidget({super.key, required this.lable, this.phoneController});

  @override
  State<PhoneNumberTextFieldWidget> createState() =>
      _PhoneNumberTextFieldWidgetState();
}

class _PhoneNumberTextFieldWidgetState
    extends State<PhoneNumberTextFieldWidget> {
  PhoneCountryData? _initialCountryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        child: Row(
          children: [
            Expanded(
              child: CustomImageView(
                svgPath: ImageConstant.imgCall,
              ),
            ),
            SizedBox(
              width: 20.adaptSize,
            ),
            Expanded(
              flex: 5,
              child: CountryDropdown(
                // decoration: InputDecoration(
                //     border:
                //         OutlineInputBorder()),
                printCountryName: true,
                triggerOnCountrySelectedInitially: true,

                onCountrySelected: (PhoneCountryData? countryData) {
                  setState(() {
                    _initialCountryData = countryData;
                  });
                },
              ),
            ),
            SizedBox(width: 10.0.adaptSize),
            Expanded(
              flex: 7,
              child: TextFormField(
                key: ValueKey(_initialCountryData),
                controller: widget.phoneController,
                decoration: InputDecoration(
                    labelText: widget.lable, contentPadding: EdgeInsets.zero),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  PhoneInputFormatter(
                    //   shouldCorrectNumber: true,
                    allowEndlessPhone: false,
                    defaultCountryCode: _initialCountryData?.countryCode,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
