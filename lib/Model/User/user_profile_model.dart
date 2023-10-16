class AutoGenerate {
  AutoGenerate({
    required this.personalData,
    required this.professionalData,
    required this.relationshipData,
    required this.healthData,
    required this.financialData,
    required this.lifeInsuranceData,
    required this.healthInsuranceData,
    required this.disabilityInsuranceData,
    required this.longTermCareInsuranceData,
    required this.homeInsuranceData,
    required this.carInsuranceData,
    required this.vaultDocumentData,
  });
  late final PersonalData personalData;
  late final ProfessionalData professionalData;
  late final List<dynamic> relationshipData;
  late final HealthData healthData;
  late final FinancialData financialData;
  late final List<dynamic> lifeInsuranceData;
  late final List<dynamic> healthInsuranceData;
  late final List<dynamic> disabilityInsuranceData;
  late final List<dynamic> longTermCareInsuranceData;
  late final List<dynamic> homeInsuranceData;
  late final List<dynamic> carInsuranceData;
  late final List<dynamic> vaultDocumentData;
  
  AutoGenerate.fromJson(Map<String, dynamic> json){
    personalData = PersonalData.fromJson(json['personal_data']);
    professionalData = ProfessionalData.fromJson(json['professional_data']);
    relationshipData = List.castFrom<dynamic, dynamic>(json['relationship_data']);
    healthData = HealthData.fromJson(json['health_data']);
    financialData = FinancialData.fromJson(json['financial_data']);
    lifeInsuranceData = List.castFrom<dynamic, dynamic>(json['life_insurance_data']);
    healthInsuranceData = List.castFrom<dynamic, dynamic>(json['health_insurance_data']);
    disabilityInsuranceData = List.castFrom<dynamic, dynamic>(json['disability_insurance_data']);
    longTermCareInsuranceData = List.castFrom<dynamic, dynamic>(json['long_term_care_insurance_data']);
    homeInsuranceData = List.castFrom<dynamic, dynamic>(json['home_insurance_data']);
    carInsuranceData = List.castFrom<dynamic, dynamic>(json['car_insurance_data']);
    vaultDocumentData = List.castFrom<dynamic, dynamic>(json['vault_document_data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['personal_data'] = personalData.toJson();
    _data['professional_data'] = professionalData.toJson();
    _data['relationship_data'] = relationshipData;
    _data['health_data'] = healthData.toJson();
    _data['financial_data'] = financialData.toJson();
    _data['life_insurance_data'] = lifeInsuranceData;
    _data['health_insurance_data'] = healthInsuranceData;
    _data['disability_insurance_data'] = disabilityInsuranceData;
    _data['long_term_care_insurance_data'] = longTermCareInsuranceData;
    _data['home_insurance_data'] = homeInsuranceData;
    _data['car_insurance_data'] = carInsuranceData;
    _data['vault_document_data'] = vaultDocumentData;
    return _data;
  }
}

class PersonalData {
  PersonalData({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.mobilePhone,
    required this.mobileOnlyNumbers,
     this.homePhone,
    required this.homeAddress,
    required this.homeApt,
    required this.homeZip,
    required this.homeAddressCountry,
     this.dateOfBirth,
     this.dateOfAnniversary,
    required this.gender,
     this.socialSecurityNumber,
     this.countryOfBirth,
     this.countryOfCitizenship,
     this.photo,
    required this.preferredLanguage,
    required this.welcomeDialogueShown,
    required this.welcomeDialogueMpShown,
    required this.sentSms,
    required this.termsAccepted,
    required this.privacyAccepted,
    required this.electronicAuthorDiscAccepted,
     this.securityAnswer_1,
     this.securityAnswer_2,
     this.personalEmail,
     this.importInfo,
     this.profilePin,
    required this.mobileVerified,
     this.securityQuestion_1,
     this.securityQuestion_2,
     this.lastAnnouncementSeen,
  });
  late final int id;
  late final String firstName;
  late final String middleName;
  late final String lastName;
  late final String mobilePhone;
  late final int mobileOnlyNumbers;
  late final Null homePhone;
  late final String homeAddress;
  late final String homeApt;
  late final String homeZip;
  late final String homeAddressCountry;
  late final Null dateOfBirth;
  late final Null dateOfAnniversary;
  late final String gender;
  late final Null socialSecurityNumber;
  late final Null countryOfBirth;
  late final Null countryOfCitizenship;
  late final Null photo;
  late final String preferredLanguage;
  late final bool welcomeDialogueShown;
  late final bool welcomeDialogueMpShown;
  late final int sentSms;
  late final bool termsAccepted;
  late final bool privacyAccepted;
  late final bool electronicAuthorDiscAccepted;
  late final Null securityAnswer_1;
  late final Null securityAnswer_2;
  late final Null personalEmail;
  late final Null importInfo;
  late final Null profilePin;
  late final bool mobileVerified;
  late final Null securityQuestion_1;
  late final Null securityQuestion_2;
  late final Null lastAnnouncementSeen;
  
  PersonalData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    mobilePhone = json['mobile_phone'];
    mobileOnlyNumbers = json['mobile_only_numbers'];
    homePhone = null;
    homeAddress = json['home_address'];
    homeApt = json['home_apt'];
    homeZip = json['home_zip'];
    homeAddressCountry = json['home_address_country'];
    dateOfBirth = null;
    dateOfAnniversary = null;
    gender = json['gender'];
    socialSecurityNumber = null;
    countryOfBirth = null;
    countryOfCitizenship = null;
    photo = null;
    preferredLanguage = json['preferred_language'];
    welcomeDialogueShown = json['welcome_dialogue_shown'];
    welcomeDialogueMpShown = json['welcome_dialogue_mp_shown'];
    sentSms = json['sent_sms'];
    termsAccepted = json['terms_accepted'];
    privacyAccepted = json['privacy_accepted'];
    electronicAuthorDiscAccepted = json['electronic_author_disc_accepted'];
    securityAnswer_1 = null;
    securityAnswer_2 = null;
    personalEmail = null;
    importInfo = null;
    profilePin = null;
    mobileVerified = json['mobile_verified'];
    securityQuestion_1 = null;
    securityQuestion_2 = null;
    lastAnnouncementSeen = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['first_name'] = firstName;
    _data['middle_name'] = middleName;
    _data['last_name'] = lastName;
    _data['mobile_phone'] = mobilePhone;
    _data['mobile_only_numbers'] = mobileOnlyNumbers;
    _data['home_phone'] = homePhone;
    _data['home_address'] = homeAddress;
    _data['home_apt'] = homeApt;
    _data['home_zip'] = homeZip;
    _data['home_address_country'] = homeAddressCountry;
    _data['date_of_birth'] = dateOfBirth;
    _data['date_of_anniversary'] = dateOfAnniversary;
    _data['gender'] = gender;
    _data['social_security_number'] = socialSecurityNumber;
    _data['country_of_birth'] = countryOfBirth;
    _data['country_of_citizenship'] = countryOfCitizenship;
    _data['photo'] = photo;
    _data['preferred_language'] = preferredLanguage;
    _data['welcome_dialogue_shown'] = welcomeDialogueShown;
    _data['welcome_dialogue_mp_shown'] = welcomeDialogueMpShown;
    _data['sent_sms'] = sentSms;
    _data['terms_accepted'] = termsAccepted;
    _data['privacy_accepted'] = privacyAccepted;
    _data['electronic_author_disc_accepted'] = electronicAuthorDiscAccepted;
    _data['security_answer_1'] = securityAnswer_1;
    _data['security_answer_2'] = securityAnswer_2;
    _data['personal_email'] = personalEmail;
    _data['import_info'] = importInfo;
    _data['profile_pin'] = profilePin;
    _data['mobile_verified'] = mobileVerified;
    _data['security_question_1'] = securityQuestion_1;
    _data['security_question_2'] = securityQuestion_2;
    _data['last_announcement_seen'] = lastAnnouncementSeen;
    return _data;
  }
}

class ProfessionalData {
  ProfessionalData({
    required this.id,
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
     this.businessZip,
  });
  late final int id;
  late final Null businessName;
  late final Null businessPhone;
  late final Null businessFax;
  late final Null businessEmail;
  late final Null businessWebsite;
  late final Null position;
  late final Null currentOccupation;
  late final Null idealOccupation;
  late final Null educationLevel;
  late final Null degree;
  late final Null affiliations;
  late final Null businessAddress;
  late final Null businessApt;
  late final Null businessZip;
  
  ProfessionalData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    businessName = null;
    businessPhone = null;
    businessFax = null;
    businessEmail = null;
    businessWebsite = null;
    position = null;
    currentOccupation = null;
    idealOccupation = null;
    educationLevel = null;
    degree = null;
    affiliations = null;
    businessAddress = null;
    businessApt = null;
    businessZip = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['business_name'] = businessName;
    _data['business_phone'] = businessPhone;
    _data['business_fax'] = businessFax;
    _data['business_email'] = businessEmail;
    _data['business_website'] = businessWebsite;
    _data['position'] = position;
    _data['current_occupation'] = currentOccupation;
    _data['ideal_occupation'] = idealOccupation;
    _data['education_level'] = educationLevel;
    _data['degree'] = degree;
    _data['affiliations'] = affiliations;
    _data['business_address'] = businessAddress;
    _data['business_apt'] = businessApt;
    _data['business_zip'] = businessZip;
    return _data;
  }
}

class HealthData {
  HealthData({
    required this.id,
     this.heightFt,
     this.heightInches,
     this.weight,
    required this.smoker,
     this.doctorName,
     this.doctorPhoneNumber,
     this.dateOfLastVisit,
     this.doctorStreet,
     this.doctorApt,
     this.doctorZip,
     this.reason,
     this.outcome,
     this.healthIssues,
     this.medications,
     this.ageOfSiblings,
     this.fatherAge,
     this.fatherDeathCause,
     this.motherAge,
     this.motherDeathCause,
     this.otherHealthNotes,
    required this.isBlind,
    required this.spouseIsBlind,
    required this.user,
  });
  late final int id;
  late final Null heightFt;
  late final Null heightInches;
  late final Null weight;
  late final String smoker;
  late final Null doctorName;
  late final Null doctorPhoneNumber;
  late final Null dateOfLastVisit;
  late final Null doctorStreet;
  late final Null doctorApt;
  late final Null doctorZip;
  late final Null reason;
  late final Null outcome;
  late final Null healthIssues;
  late final Null medications;
  late final Null ageOfSiblings;
  late final Null fatherAge;
  late final Null fatherDeathCause;
  late final Null motherAge;
  late final Null motherDeathCause;
  late final Null otherHealthNotes;
  late final bool isBlind;
  late final bool spouseIsBlind;
  late final int user;
  
  HealthData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    heightFt = null;
    heightInches = null;
    weight = null;
    smoker = json['smoker'];
    doctorName = null;
    doctorPhoneNumber = null;
    dateOfLastVisit = null;
    doctorStreet = null;
    doctorApt = null;
    doctorZip = null;
    reason = null;
    outcome = null;
    healthIssues = null;
    medications = null;
    ageOfSiblings = null;
    fatherAge = null;
    fatherDeathCause = null;
    motherAge = null;
    motherDeathCause = null;
    otherHealthNotes = null;
    isBlind = json['is_blind'];
    spouseIsBlind = json['spouse_is_blind'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['height_ft'] = heightFt;
    _data['height_inches'] = heightInches;
    _data['weight'] = weight;
    _data['smoker'] = smoker;
    _data['doctor_name'] = doctorName;
    _data['doctor_phone_number'] = doctorPhoneNumber;
    _data['date_of_last_visit'] = dateOfLastVisit;
    _data['doctor_street'] = doctorStreet;
    _data['doctor_apt'] = doctorApt;
    _data['doctor_zip'] = doctorZip;
    _data['reason'] = reason;
    _data['outcome'] = outcome;
    _data['health_issues'] = healthIssues;
    _data['medications'] = medications;
    _data['age_of_siblings'] = ageOfSiblings;
    _data['father_age'] = fatherAge;
    _data['father_death_cause'] = fatherDeathCause;
    _data['mother_age'] = motherAge;
    _data['mother_death_cause'] = motherDeathCause;
    _data['other_health_notes'] = otherHealthNotes;
    _data['is_blind'] = isBlind;
    _data['spouse_is_blind'] = spouseIsBlind;
    _data['user'] = user;
    return _data;
  }
}

class FinancialData {
  FinancialData({
    required this.id,
     this.taxProfessionalName,
     this.phone,
     this.address,
     this.assets,
     this.liabilities,
     this.netWorth,
     this.income,
     this.expenses,
     this.cashflow,
     this.financialHealthNotes,
    required this.user,
  });
  late final int id;
  late final Null taxProfessionalName;
  late final Null phone;
  late final Null address;
  late final Null assets;
  late final Null liabilities;
  late final Null netWorth;
  late final Null income;
  late final Null expenses;
  late final Null cashflow;
  late final Null financialHealthNotes;
  late final int user;
  
  FinancialData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    taxProfessionalName = null;
    phone = null;
    address = null;
    assets = null;
    liabilities = null;
    netWorth = null;
    income = null;
    expenses = null;
    cashflow = null;
    financialHealthNotes = null;
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['tax_professional_name'] = taxProfessionalName;
    _data['phone'] = phone;
    _data['address'] = address;
    _data['assets'] = assets;
    _data['liabilities'] = liabilities;
    _data['net_worth'] = netWorth;
    _data['income'] = income;
    _data['expenses'] = expenses;
    _data['cashflow'] = cashflow;
    _data['financial_health_notes'] = financialHealthNotes;
    _data['user'] = user;
    return _data;
  }
}