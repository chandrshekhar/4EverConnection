import 'package:url_launcher/url_launcher.dart';

launchPhone({required String phone}) async {
  final Uri phoneLaunchUri = Uri(scheme: 'tel', path: phone);

  if (await canLaunch(phoneLaunchUri.toString())) {
    await launch(phoneLaunchUri.toString());
  } else {
    print('Could not launch $phoneLaunchUri');
  }
}

launchEmail({required String email}) async {
  String emailAddress =
      'mailto:$email'; // Replace with the desired email address

  if (await canLaunch(emailAddress.toString())) {
    await launch(emailAddress.toString());
  } else {
    print('Could not launch $emailAddress');
  }
}