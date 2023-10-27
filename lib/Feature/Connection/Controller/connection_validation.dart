import 'package:get/get.dart';

class ConnectionValidationController extends GetxController {
  RxBool isFirstNameValidate = false.obs;
  RxBool isLastNameValidate = false.obs;
  RxBool isPhoneNumberValidate = false.obs;
  RxBool isEmailValidate = false.obs;
  RxBool homeAddressValidate = false.obs;
  RxBool isZipValidate = false.obs;

  RxBool isButtonStateChange = false.obs;

  checkButtonValidation() {
    if (isFirstNameValidate.value == false ||
        isLastNameValidate.value == false ||
        isPhoneNumberValidate.value == false ||
        isEmailValidate.value == false ||
        homeAddressValidate.value == false ||
        isZipValidate.value == false) {
      isButtonStateChange(false);
    } else {
      isButtonStateChange(true);
    }
  }

  setFirstNameValidation(String value) {
    if (value.length < 4) {
      isFirstNameValidate(false);
    } else {
      isFirstNameValidate(true);
    }
  }

  setLastNameValidation(String value) {
    if (value.length < 2) {
      isLastNameValidate(false);
    } else {
      isLastNameValidate(true);
    }
  }

  setPhoneNameValidation(String value) {
    if (value.length < 7) {
      isPhoneNumberValidate(false);
    } else {
      isPhoneNumberValidate(true);
    }
  }

  setEmailValidation(String value) {
    if (!GetUtils.isEmail(value)) {
      isEmailValidate(false);
    } else {
      isEmailValidate(true);
    }
  }

  setHomeAddressValidation(String value) {
    if (value.length < 8) {
      homeAddressValidate(false);
    } else {
      homeAddressValidate(true);
    }
  }

  setZipValidation(String value) {
    if (value.length < 3) {
      isZipValidate(false);
    } else {
      isZipValidate(true);
    }
  }
}
