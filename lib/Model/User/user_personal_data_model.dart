class UserPersonalModel {
  int? id;
  int? userId;
  String? lifePartnerName;
  String? lifePartnerPhone;
  bool? lifePartnerIsNotMarried;
  String? userEmail;
  String? modified;
  String? firstName;
  dynamic middleName;
  String? lastName;
  String? mobilePhone;
  int? mobileOnlyNumbers;
  String? homePhone;
  String? homeAddress;
  String? homeApt;
  String? homeZip;
  String? homeAddressCountry;
  String? dateOfBirth;
  dynamic dateOfAnniversary;
  String? gender;
  String? socialSecurityNumber;
  String? countryOfBirth;
  String? countryOfCitizenship;
  String? photo;
  String? preferredLanguage;
  bool? welcomeDialogueShown;
  bool? welcomeDialogueMpShown;
  int? sentSms;
  bool? termsAccepted;
  bool? privacyAccepted;
  bool? electronicAuthorDiscAccepted;
  dynamic securityAnswer1;
  dynamic securityAnswer2;
  dynamic personalEmail;
  dynamic importInfo;
  dynamic profilePin;
  bool? mobileVerified;
  dynamic profileNote;
  dynamic securityQuestion1;
  dynamic securityQuestion2;
  int? lastAnnouncementSeen;

  UserPersonalModel(
      {this.id,
      this.userId,
      this.lifePartnerName,
      this.lifePartnerPhone,
      this.lifePartnerIsNotMarried,
      this.userEmail,
      this.modified,
      this.firstName,
      this.middleName,
      this.lastName,
      this.mobilePhone,
      this.mobileOnlyNumbers,
      this.homePhone,
      this.homeAddress,
      this.homeApt,
      this.homeZip,
      this.homeAddressCountry,
      this.dateOfBirth,
      this.dateOfAnniversary,
      this.gender,
      this.socialSecurityNumber,
      this.countryOfBirth,
      this.countryOfCitizenship,
      this.photo,
      this.preferredLanguage,
      this.welcomeDialogueShown,
      this.welcomeDialogueMpShown,
      this.sentSms,
      this.termsAccepted,
      this.privacyAccepted,
      this.electronicAuthorDiscAccepted,
      this.securityAnswer1,
      this.securityAnswer2,
      this.personalEmail,
      this.importInfo,
      this.profilePin,
      this.mobileVerified,
      this.profileNote,
      this.securityQuestion1,
      this.securityQuestion2,
      this.lastAnnouncementSeen});

  UserPersonalModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    lifePartnerName = json['life_partner_name'];
    lifePartnerPhone = json['life_partner_phone'];
    lifePartnerIsNotMarried = json['life_partner_is_not_married'];
    userEmail = json['user_email'];
    modified = json['modified'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    mobilePhone = json['mobile_phone'];
    mobileOnlyNumbers = json['mobile_only_numbers'];
    homePhone = json['home_phone'];
    homeAddress = json['home_address'];
    homeApt = json['home_apt'];
    homeZip = json['home_zip'];
    homeAddressCountry = json['home_address_country'];
    dateOfBirth = json['date_of_birth'];
    dateOfAnniversary = json['date_of_anniversary'];
    gender = json['gender'];
    socialSecurityNumber = json['social_security_number'];
    countryOfBirth = json['full_country_of_birth'];
    countryOfCitizenship = json['full_country_of_citizenship'];
    photo = json['photo'];
    preferredLanguage = json['preferred_language'];
    welcomeDialogueShown = json['welcome_dialogue_shown'];
    welcomeDialogueMpShown = json['welcome_dialogue_mp_shown'];
    sentSms = json['sent_sms'];
    termsAccepted = json['terms_accepted'];
    privacyAccepted = json['privacy_accepted'];
    electronicAuthorDiscAccepted = json['electronic_author_disc_accepted'];
    securityAnswer1 = json['security_answer_1'];
    securityAnswer2 = json['security_answer_2'];
    personalEmail = json['user_email'];
    importInfo = json['import_info'];
    profilePin = json['profile_pin'];
    mobileVerified = json['mobile_verified'];
    profileNote = json['profile_note'];
    securityQuestion1 = json['security_question_1'];
    securityQuestion2 = json['security_question_2'];
    lastAnnouncementSeen = json['last_announcement_seen'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['user_id'] = this.userId;
  //   data['life_partner_name'] = this.lifePartnerName;
  //   data['life_partner_phone'] = this.lifePartnerPhone;
  //   data['life_partner_is_not_married'] = this.lifePartnerIsNotMarried;
  //   data['user_email'] = this.userEmail;
  //   data['modified'] = this.modified;
  //   data['first_name'] = this.firstName;
  //   data['middle_name'] = this.middleName;
  //   data['last_name'] = this.lastName;
  //   data['mobile_phone'] = this.mobilePhone;
  //   data['mobile_only_numbers'] = this.mobileOnlyNumbers;
  //   data['home_phone'] = this.homePhone;
  //   data['home_address'] = this.homeAddress;
  //   data['home_apt'] = this.homeApt;
  //   data['home_zip'] = this.homeZip;
  //   data['home_address_country'] = this.homeAddressCountry;
  //   data['date_of_birth'] = this.dateOfBirth;
  //   data['date_of_anniversary'] = this.dateOfAnniversary;
  //   data['gender'] = this.gender;
  //   data['social_security_number'] = this.socialSecurityNumber;
  //   data['country_of_birth'] = this.countryOfBirth;
  //   data['country_of_citizenship'] = this.countryOfCitizenship;
  //   data['photo'] = this.photo;
  //   data['preferred_language'] = this.preferredLanguage;
  //   data['welcome_dialogue_shown'] = this.welcomeDialogueShown;
  //   data['welcome_dialogue_mp_shown'] = this.welcomeDialogueMpShown;
  //   data['sent_sms'] = this.sentSms;
  //   data['terms_accepted'] = this.termsAccepted;
  //   data['privacy_accepted'] = this.privacyAccepted;
  //   data['electronic_author_disc_accepted'] = this.electronicAuthorDiscAccepted;
  //   data['security_answer_1'] = this.securityAnswer1;
  //   data['security_answer_2'] = this.securityAnswer2;
  //   data['personal_email'] = this.personalEmail;
  //   data['import_info'] = this.importInfo;
  //   data['profile_pin'] = this.profilePin;
  //   data['mobile_verified'] = this.mobileVerified;
  //   data['profile_note'] = this.profileNote;
  //   data['security_question_1'] = this.securityQuestion1;
  //   data['security_question_2'] = this.securityQuestion2;
  //   data['last_announcement_seen'] = this.lastAnnouncementSeen;
  //   return data;
  // }
}
