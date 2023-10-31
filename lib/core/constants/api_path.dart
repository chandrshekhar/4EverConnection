class ApiPath {
  static const baseUrl = "https://4everconnection.com";

  //Authentication
  static const registerUrl = "$baseUrl/api/user/";
  static const loginUrl = "$baseUrl/api-token-auth/";
  static const forgotPasswordSendEmail = "$baseUrl/api/user/reset-password";
  static const getUserService = "$baseUrl/api/user-services/";
  static const getUserProfile = "$baseUrl/api/user/profile";

  // get tooltips
  static const getTooltips = "$baseUrl/api/tooltips/";

  //request service one
  static const professionalServiceList = "$baseUrl/api/services/";
  //reques partner name with service id
  static const pertnerDropDownList = "$baseUrl/api/partners";
  //Add service api call
  static const addService = "$baseUrl/api/user/service";

  //add notes end point
  static const addNotesUrl = "$baseUrl/api/notes/";
  static const myNotesList = "$baseUrl/api/notes/";
  static const editNotes = "$baseUrl/api/notes";
  static const deleteNotes = "$baseUrl/api/notes";

  //connection
  static const addConnection = "$baseUrl/api/connections/";
  static const listConnection = "$baseUrl/api/connections/";
  static const documentTypeApi = "$baseUrl/api/vault-document-types/";
  static const resendRequest = "$baseUrl/api/connections/resend";

  //vault
  static const addDocumentUrl = "$baseUrl/api/vault-document/";
}
