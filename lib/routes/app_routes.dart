import 'package:flutter/material.dart';
import 'package:forever_connection/Feature/Auth/Presentation/change_password_screen.dart';
import 'package:forever_connection/Feature/Auth/Presentation/forgot_password_screen.dart';
import 'package:forever_connection/Feature/Auth/Presentation/login_screen.dart';
import 'package:forever_connection/Feature/Auth/Presentation/password_security_screen/password_security_screen.dart';
import 'package:forever_connection/Feature/Auth/Presentation/reset_password_screen.dart';
import 'package:forever_connection/Feature/Auth/Presentation/sign_up_screen.dart';
import 'package:forever_connection/Feature/Contact/Presentation/contact_list_screen.dart';
import 'package:forever_connection/Feature/Dashboard/Presentation/dashboard_screen.dart';
import 'package:forever_connection/Feature/My%20Notes/Presentation/add_note_screen.dart';
import 'package:forever_connection/Feature/My%20Notes/Presentation/my_notes_list.dart';
import 'package:forever_connection/Feature/My%20Profile/Presentation/financial_profile_screen.dart';
import 'package:forever_connection/Feature/My%20Profile/Presentation/health_profile_screen.dart';
import 'package:forever_connection/Feature/My%20Profile/Presentation/my_profile_screen.dart';
import 'package:forever_connection/Feature/My%20Profile/Presentation/personal_details_screen.dart';
import 'package:forever_connection/Feature/My%20Profile/Presentation/professional_profile_screen.dart';
import 'package:forever_connection/Feature/My%20Profile/Presentation/protection_profile_screen.dart';
import 'package:forever_connection/Feature/My%20Profile/Presentation/relationships_screen.dart';
import 'package:forever_connection/Feature/My%20Profile/Presentation/snapshot_screen.dart';
import 'package:forever_connection/Feature/My%20Service/Presentation/my_services_screen.dart';
import 'package:forever_connection/Feature/Request%20Service/request_service_one_screen.dart';
import 'package:forever_connection/Feature/Welcome/auth_screen.dart';
import 'package:forever_connection/Feature/Welcome/splash_screen.dart';
import 'package:forever_connection/Feature/Document/Presentation/document_vault.dart';

import '../Feature/Notification/notification-screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String loginScreen = '/login_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String resetPasswordScreen = '/reset_password_screen';

  static const String dashboardScreen = '/dashboard_screen';

  static const String requestServiceOneScreen = '/request_service_one_screen';

  // static const String requestServiceScreen = '/request_service_screen';

  static const String myProfileScreen = '/my_profile_screen';

  static const String snapshotScreen = '/snapshot_screen';

  static const String personalDetailsScreen = '/personal_details_screen';

  static const String professionalProfileScreen =
      '/professional_profile_screen';

  static const String relationshipsScreen = '/relationships_screen';

  static const String healthProfileScreen = '/health_profile_screen';

  static const String financialProfileScreen = '/financial_profile_screen';

  static const String protectionprofile = '/protection_profile_screen';

  static const String myServicesOnePage = '/my_services_one_page';

  static const String myServicesOneTabContainerScreen =
      '/my_services_one_tab_container_screen';

  static const String myServicesTwoScreen = '/my_services_two_screen';

  static const String myServicesScreen = '/my_services_screen';

  static const String passwordSecurityScreen = '/password_security_screen';

  static const String changePasswordScreen = '/change_password_screen';

  static const String notificationsScreen = '/notifications_screen';

  static const String documentVaultScreen = '/document_vault_screen';

  static const String myNotesListScreen = '/my_note_screen';

  static const String addNotesScreen = "add_note_screen";

  static const String contactList = "/myContactList";

  static const String addContactScreen = "/addContactScreen";

  static const String authOptionScreen = "/authoptionScreen";

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    loginScreen: (context) => LoginScreen(),
    signUpScreen: (context) => const SignUpScreen(),
    forgotPasswordScreen: (context) => ForgotPasswordScreen(),
    resetPasswordScreen: (context) => ResetPasswordScreen(),
    dashboardScreen: (context) => DashboardScreen(),
    requestServiceOneScreen: (context) => const RequestServiceOneScreen(),
    myProfileScreen: (context) => MyProfileScreen(),
    snapshotScreen: (context) => SnapshotScreen(),
    personalDetailsScreen: (context) => const PersonalDetailsScreen(),
    professionalProfileScreen: (context) => ProfessionalProfileScreen(),
    protectionprofile: (context) => const ProtectionProfileScreen(),
    relationshipsScreen: (context) => const RelationshipsScreen(),
    healthProfileScreen: (context) => HealthProfileScreen(),
    financialProfileScreen: (context) => FinancialProfileScreen(),
    myServicesScreen: (context) => const MyServicesScreen(),
    passwordSecurityScreen: (context) => PasswordSecurityScreen(),
    changePasswordScreen: (context) => ChangePasswordScreen(),
    notificationsScreen: (context) => NotificationsScreen(),
    documentVaultScreen: (context) => const DocumentVaultScreen(),
    myNotesListScreen: (context) => MyNotesListScreen(),
    addNotesScreen: (context) => AddNoteScreen(),
    contactList: (context) => const ContactListScreen(),
    authOptionScreen: (context) => const AuthOptionScreen()
  };
}
