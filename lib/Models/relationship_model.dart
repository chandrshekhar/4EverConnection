class RelationshipModel {
  int? id;
  PersonalData? personalData;
  ProfessionalData? professionalData;
  String? relationshipType;
  bool? taxDependent;
  int? user;

  RelationshipModel(
      {this.id,
      this.personalData,
      this.professionalData,
      this.relationshipType,
      this.taxDependent,
      this.user});

  RelationshipModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    personalData = json['personal_data'] != null
        ? PersonalData.fromJson(json['personal_data'])
        : null;
    professionalData = json['professional_data'] != null
        ? ProfessionalData.fromJson(json['professional_data'])
        : null;
    relationshipType = json['relationship_type'];
    taxDependent = json['tax_dependent'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (personalData != null) {
      data['personal_data'] = personalData!.toJson();
    }
    if (professionalData != null) {
      data['professional_data'] = professionalData!.toJson();
    }
    data['relationship_type'] = relationshipType;
    data['tax_dependent'] = taxDependent;
    data['user'] = user;
    return data;
  }
}

class PersonalData {
  int? id;
  dynamic userId;
  dynamic lifePartnerName;
  dynamic lifePartnerPhone;
  dynamic lifePartnerIsNotMarried;
  dynamic userEmail;
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
  dynamic dateOfBirth;
  dynamic dateOfAnniversary;
  String? gender;
  String? socialSecurityNumber;
  String? countryOfBirth;
  String? countryOfCitizenship;
  dynamic photo;
  dynamic preferredLanguage;
  bool? welcomeDialogueShown;
  bool? welcomeDialogueMpShown;
  int? sentSms;
  bool? termsAccepted;
  bool? privacyAccepted;
  bool? electronicAuthorDiscAccepted;
  dynamic securityAnswer1;
  dynamic securityAnswer2;
  String? personalEmail;
  dynamic importInfo;
  bool? mobileVerified;
  dynamic profileNote;
  dynamic securityQuestion1;
  dynamic securityQuestion2;
  dynamic lastAnnouncementSeen;

  PersonalData(
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
      this.mobileVerified,
      this.profileNote,
      this.securityQuestion1,
      this.securityQuestion2,
      this.lastAnnouncementSeen});

  PersonalData.fromJson(Map<String, dynamic> json) {
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
    personalEmail = json['personal_email'];
    importInfo = json['import_info'];
    mobileVerified = json['mobile_verified'];
    profileNote = json['profile_note'];
    securityQuestion1 = json['security_question_1'];
    securityQuestion2 = json['security_question_2'];
    lastAnnouncementSeen = json['last_announcement_seen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['life_partner_name'] = lifePartnerName;
    data['life_partner_phone'] = lifePartnerPhone;
    data['life_partner_is_not_married'] = lifePartnerIsNotMarried;
    data['user_email'] = userEmail;
    data['modified'] = modified;
    data['first_name'] = firstName;
    data['middle_name'] = middleName;
    data['last_name'] = lastName;
    data['mobile_phone'] = mobilePhone;
    data['mobile_only_numbers'] = mobileOnlyNumbers;
    data['home_phone'] = homePhone;
    data['home_address'] = homeAddress;
    data['home_apt'] = homeApt;
    data['home_zip'] = homeZip;
    data['home_address_country'] = homeAddressCountry;
    data['date_of_birth'] = dateOfBirth;
    data['date_of_anniversary'] = dateOfAnniversary;
    data['gender'] = gender;
    data['social_security_number'] = socialSecurityNumber;
    data['country_of_birth'] = countryOfBirth;
    data['country_of_citizenship'] = countryOfCitizenship;
    data['photo'] = photo;
    data['preferred_language'] = preferredLanguage;
    data['welcome_dialogue_shown'] = welcomeDialogueShown;
    data['welcome_dialogue_mp_shown'] = welcomeDialogueMpShown;
    data['sent_sms'] = sentSms;
    data['terms_accepted'] = termsAccepted;
    data['privacy_accepted'] = privacyAccepted;
    data['electronic_author_disc_accepted'] = electronicAuthorDiscAccepted;
    data['security_answer_1'] = securityAnswer1;
    data['security_answer_2'] = securityAnswer2;
    data['personal_email'] = personalEmail;
    data['import_info'] = importInfo;
    data['mobile_verified'] = mobileVerified;
    data['profile_note'] = profileNote;
    data['security_question_1'] = securityQuestion1;
    data['security_question_2'] = securityQuestion2;
    data['last_announcement_seen'] = lastAnnouncementSeen;
    return data;
  }
}

class ProfessionalData {
  int? id;
  String? modified;
  String? businessName;
  String? businessPhone;
  String? businessFax;
  String? businessEmail;
  String? businessWebsite;
  String? position;
  String? currentOccupation;
  String? idealOccupation;
  String? educationLevel;
  String? degree;
  String? affiliations;
  String? businessAddress;
  String? businessApt;
  String? businessZip;

  ProfessionalData(
      {this.id,
      this.modified,
      this.businessName,
      this.businessPhone,
      this.businessFax,
      this.businessEmail,
      this.businessWebsite,
      this.position,
      this.currentOccupation,
      this.idealOccupation,
      this.educationLevel,
      this.degree,
      this.affiliations,
      this.businessAddress,
      this.businessApt,
      this.businessZip});

  ProfessionalData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    modified = json['modified'];
    businessName = json['business_name'];
    businessPhone = json['business_phone'];
    businessFax = json['business_fax'];
    businessEmail = json['business_email'];
    businessWebsite = json['business_website'];
    position = json['position'];
    currentOccupation = json['current_occupation'];
    idealOccupation = json['ideal_occupation'];
    educationLevel = json['education_level'];
    degree = json['degree'];
    affiliations = json['affiliations'];
    businessAddress = json['business_address'];
    businessApt = json['business_apt'];
    businessZip = json['business_zip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['modified'] = modified;
    data['business_name'] = businessName;
    data['business_phone'] = businessPhone;
    data['business_fax'] = businessFax;
    data['business_email'] = businessEmail;
    data['business_website'] = businessWebsite;
    data['position'] = position;
    data['current_occupation'] = currentOccupation;
    data['ideal_occupation'] = idealOccupation;
    data['education_level'] = educationLevel;
    data['degree'] = degree;
    data['affiliations'] = affiliations;
    data['business_address'] = businessAddress;
    data['business_apt'] = businessApt;
    data['business_zip'] = businessZip;
    return data;
  }
}
