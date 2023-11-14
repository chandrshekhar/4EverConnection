class ApiPath {
  static const locationApiKey = "AIzaSyDzrs8ZFG7ov2TRmmnNdsNnTzSaAtmIrN8";
  static const locationApi =
      'https://maps.googleapis.com/maps/api/place/autocomplete/json';
  static const baseUrl = "https://4everconnection.com";

  static const profile = "/api/user/profile";

  //Authentication
  static const registerUrl = "$baseUrl/api/user/";
  static const checkClient = "$baseUrl/api/user/check";
  static const loginUrl = "$baseUrl/api-token-auth/";
  static const forgotPasswordSendEmail = "$baseUrl/api/user/reset-password";
  static const getUserService = "$baseUrl/api/user-services/";
  static const getUserProfile = "$baseUrl/api/user/profile";

  // profile
  static const personaUserData = "$baseUrl$profile/personal";
  static const carInsurance = "$baseUrl$profile/car-insurance";
  static const disabilityInsurance = "$baseUrl$profile/disability-insurance";
  static const healthInsurance = "$baseUrl$profile/health-insurance";
  static const longtermCarInsurance =
      "$baseUrl$profile/long-term-care-insurance";
  static const lifeInsurance = "$baseUrl$profile/life-insurance";
  static const homeInsurance = "$baseUrl$profile/home-insurance";
  static const profesional = "$baseUrl$profile/professional";
  static const relationship = "$baseUrl$profile/relationship";

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

  static const resendRequest = "$baseUrl/api/connections/resend";

  //vault
  static const addDocumentUrl = "$baseUrl/api/vault-document/";
  static const documentTypeApi = "$baseUrl/api/vault-document-types/";
  static const documentVaultList = "$baseUrl/api/vault-document/";
  static const updateDocuemntDesc = "$baseUrl/api/vault-document/update/";
  static const deleteDocument = "$baseUrl/api/vault-document/delete/";

  //notification
  static const getNotification = "$baseUrl/api/user-announcements/";
  static const updateLastSeen = "$baseUrl/api/user-announcements/last-seen/";
}
