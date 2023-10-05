class ApiPath {
  static const baseUrl = "http://52.66.31.220";
  static const storageUrl = "http://52.66.31.220/storage/";

  //Authentication
  static const registerUrl = "$baseUrl/api/v1/register";
  static const loginUrl = "$baseUrl/api/v1/login";
  static const forgotPasswordSendEmail = "$baseUrl/api/v1/forget-password";
  static const verifyEmailOtp = "$baseUrl/api/v1/otp-verification";

  //Home Page symptopm api
  static const symptomApi = "$baseUrl/api/v1/symptoms";
  //homepage dotor list with city wise

  static const doctorListWithCityAndSoecility = "$baseUrl/api/v1/specializations";
  static const doctorListPath = "$baseUrl/api/v1/doctors";
  

  //notofication list api path
  static const notificationList = "$baseUrl/api/v1/patient/notifications";


  //Profile 
  static const getProfile = "$baseUrl/api/v1/patient/getProfile";
  static const updateProfile = "$baseUrl/api/v1/patient/updateProfile";


  //Privacy
  static const privacyPolicy = "$baseUrl/api/v1/doctor/privacy-policy";

  //About Us
  static const aboutUs = "$baseUrl/api/v1/doctor/about-us";

  //Appointments
  static const appointmentHistory = "$baseUrl/api/v1/patient/appointment-history";
  static const upcomingAppointments = "$baseUrl/api/v1/patient/upcoming-appointment";
  static const deleteUpcomingAppointment = "$baseUrl/api/v1/patient/cancel-appointment";


  //Doctor Details API
  static const doctorDetails = "$baseUrl/api/v1/doctor-details";
  static const clinicDates = "$baseUrl/api/v1/visitDate";
  static const clinicSlots = "$baseUrl/api/v1/clinicVisitSlot";
  static const bookAppointment = "$baseUrl/api/v1/appointment-store";

  //set location
  static const setLocation = "$baseUrl/api/v1/store-location";
}
