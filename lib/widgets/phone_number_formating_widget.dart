import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:forever_connection/core/app_export.dart';

class PhoneNumberTextFieldWidget extends StatefulWidget {
  final String lable;
  int? c;
  TextEditingController? phoneController;
  bool? readOnly;
  PhoneNumberTextFieldWidget(
      {super.key, required this.lable, this.phoneController, this.c, this.readOnly});

  @override
  State<PhoneNumberTextFieldWidget> createState() =>
      _PhoneNumberTextFieldWidgetState();
}

class _PhoneNumberTextFieldWidgetState
    extends State<PhoneNumberTextFieldWidget> {
  PhoneCountryData _initialCountryData = PhoneCountryData.fromMap(
    {
      'country': 'United States',
      'countryRU': 'США',
      'internalPhoneCode': '1',
      'countryCode': 'US',
      'phoneMask': '+0 (000) 000 0000',
    },
  );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        child: Row(
          children: [
            widget.c == null
                ? Expanded(
                    child: CustomImageView(
                      svgPath: ImageConstant.imgCall,
                    ),
                  )
                : Container(),
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
                triggerOnCountrySelectedInitially: false,
                initialCountryData: _initialCountryData,
                onCountrySelected: (PhoneCountryData? countryData) {
                  setState(() {
                    _initialCountryData = countryData!;
                  });
                },
              ),
            ),
            SizedBox(width: 10.0.adaptSize),
            Expanded(
              flex: 7,
              child: TextFormField(
                readOnly: widget.readOnly??false,
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
