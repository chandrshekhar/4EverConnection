class ApiPath {
  static const baseUrl = "https://4everconnection.com";

  //Authentication
  static const registerUrl = "$baseUrl/api/v1/register";
  static const loginUrl = "$baseUrl/api-token-auth/";
  static const forgotPasswordSendEmail = "$baseUrl/api/user/reset-password";
  static const getUserService = "$baseUrl/api/user-services/";
  static const getUserProfile = "$baseUrl/api/user/profile";
}
