import 'package:flutter/material.dart';
import 'package:forever_connection/Feature/My%20Notes/Presentation/add_note_screen.dart';
import 'package:forever_connection/Feature/My%20Notes/Presentation/my_notes_list.dart';
import 'package:forever_connection/Feature/document_vault/document_vault.dart';
import 'package:forever_connection/Feature/splash_screen/splash_screen.dart';
import 'package:forever_connection/Feature/login_screen/login_screen.dart';
import 'package:forever_connection/Feature/sign_up_screen/sign_up_screen.dart';
import 'package:forever_connection/Feature/forgot_password_screen/forgot_password_screen.dart';
import 'package:forever_connection/Feature/reset_password_screen/reset_password_screen.dart';
import 'package:forever_connection/Feature/dashboard_screen/dashboard_screen.dart';
import 'package:forever_connection/Feature/request_service_one_screen/request_service_one_screen.dart';
import 'package:forever_connection/Feature/my_profile_screen/my_profile_screen.dart';
import 'package:forever_connection/Feature/snapshot_screen/snapshot_screen.dart';
import 'package:forever_connection/Feature/personal_details_screen/personal_details_screen.dart';
import 'package:forever_connection/Feature/professional_profile_screen/professional_profile_screen.dart';
import 'package:forever_connection/Feature/relationships_screen/relationships_screen.dart';
import 'package:forever_connection/Feature/health_profile_screen/health_profile_screen.dart';
import 'package:forever_connection/Feature/financial_profile_screen/financial_profile_screen.dart';
import 'package:forever_connection/Feature/my_services_screen/my_services_screen.dart';
import 'package:forever_connection/Feature/password_security_screen/password_security_screen.dart';
import 'package:forever_connection/Feature/change_password_screen/change_password_screen.dart';
import '../Feature/notification/notification-screen.dart';

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

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    loginScreen: (context) => LoginScreen(),
    signUpScreen: (context) => SignUpScreen(),
    forgotPasswordScreen: (context) => ForgotPasswordScreen(),
    resetPasswordScreen: (context) => ResetPasswordScreen(),
    dashboardScreen: (context) => DashboardScreen(),
    requestServiceOneScreen: (context) => const RequestServiceOneScreen(),
    myProfileScreen: (context) => MyProfileScreen(),
    snapshotScreen: (context) => SnapshotScreen(),
    personalDetailsScreen: (context) => const PersonalDetailsScreen(),
    professionalProfileScreen: (context) => ProfessionalProfileScreen(),
    relationshipsScreen: (context) => RelationshipsScreen(),
    healthProfileScreen: (context) => HealthProfileScreen(),
    financialProfileScreen: (context) => FinancialProfileScreen(),
    myServicesScreen: (context) => const MyServicesScreen(),
    passwordSecurityScreen: (context) => PasswordSecurityScreen(),
    changePasswordScreen: (context) => ChangePasswordScreen(),
    notificationsScreen: (context) => const NotificationsScreen(),
    documentVaultScreen: (context) => DocumentVaultScreen(),
    myNotesListScreen: (context) =>  MyNotesListScreen(),
    addNotesScreen: (context) => AddNoteScreen(),
  };
}
