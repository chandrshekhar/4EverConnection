class UserProfileModel {
  PersonalData? personalData;
  ProfessionalData? professionalData;
  List<RelationshipData>? relationshipData;
  HealthData? healthData;
  FinancialData? financialData;
  List<HealthInsuranceData>? healthInsuranceData;
  List<VaultDocumentData>? vaultDocumentData;
  UserProfileModel(
      {personalData,
      professionalData,
      relationshipData,
      healthData,
      financialData,
      healthInsuranceData,
      vaultDocumentData});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    personalData = json['personal_data'] != null
        ? PersonalData.fromJson(json['personal_data'])
        : null;
    professionalData = json['professional_data'] != null
        ? ProfessionalData.fromJson(json['professional_data'])
        : null;
    if (json['relationship_data'] != null) {
      relationshipData = <RelationshipData>[];
      json['relationship_data'].forEach((v) {
        relationshipData!.add(RelationshipData.fromJson(v));
      });
    }
    healthData = json['health_data'] != null
        ? HealthData.fromJson(json['health_data'])
        : null;
    financialData = json['financial_data'] != null
        ? FinancialData.fromJson(json['financial_data'])
        : null;

    if (json['health_insurance_data'] != null) {
      healthInsuranceData = <HealthInsuranceData>[];
      json['health_insurance_data'].forEach((v) {
        healthInsuranceData!.add(HealthInsuranceData.fromJson(v));
      });
    }
    if (json['vault_document_data'] != null) {
      vaultDocumentData = <VaultDocumentData>[];
      json['vault_document_data'].forEach((v) {
        vaultDocumentData!.add(VaultDocumentData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (personalData != null) {
      data['personal_data'] = personalData!.toJson();
    }
    if (professionalData != null) {
      data['professional_data'] = professionalData!.toJson();
    }
    if (relationshipData != null) {
      data['relationship_data'] =
          relationshipData!.map((v) => v.toJson()).toList();
    }
    if (healthData != null) {
      data['health_data'] = healthData!.toJson();
    }
    if (financialData != null) {
      data['financial_data'] = financialData!.toJson();
    }

    if (healthInsuranceData != null) {
      data['health_insurance_data'] =
          healthInsuranceData!.map((v) => v.toJson()).toList();
    }

    // if (vaultDocumentData != null) {
    //   data['vault_document_data'] =
    //       vaultDocumentData!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class PersonalData {
  int? id;
  int? userId;
  dynamic firstName;
  dynamic middleName;
  dynamic lastName;
  dynamic mobilePhone;
  dynamic mobileOnlyNumbers;
  dynamic homePhone;
  dynamic homeAddress;
  dynamic homeApt;
  dynamic homeZip;
  dynamic homeAddressCountry;
  dynamic dateOfBirth;
  dynamic dateOfAnniversary;
  dynamic gender;
  dynamic socialSecurityNumber;
  dynamic countryOfBirth;
  dynamic countryOfCitizenship;
  dynamic photo;
  dynamic preferredLanguage;
  bool? welcomeDialogueShown;
  bool? welcomeDialogueMpShown;
  dynamic sentSms;
  bool? termsAccepted;
  bool? privacyAccepted;
  bool? electronicAuthorDiscAccepted;
  dynamic securityAnswer1;
  dynamic securityAnswer2;
  dynamic personalEmail;
  dynamic importInfo;
  dynamic profilePin;
  bool? mobileVerified;
  dynamic securityQuestion1;
  dynamic securityQuestion2;
  dynamic lastAnnouncementSeen;

  PersonalData(
      {id,
      userId,
      firstName,
      middleName,
      lastName,
      mobilePhone,
      mobileOnlyNumbers,
      homePhone,
      homeAddress,
      homeApt,
      homeZip,
      homeAddressCountry,
      dateOfBirth,
      dateOfAnniversary,
      gender,
      socialSecurityNumber,
      countryOfBirth,
      countryOfCitizenship,
      photo,
      preferredLanguage,
      welcomeDialogueShown,
      welcomeDialogueMpShown,
      sentSms,
      termsAccepted,
      privacyAccepted,
      electronicAuthorDiscAccepted,
      securityAnswer1,
      securityAnswer2,
      personalEmail,
      importInfo,
      profilePin,
      mobileVerified,
      securityQuestion1,
      securityQuestion2,
      lastAnnouncementSeen});

  PersonalData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    id = json['id'];
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
    countryOfBirth = json['country_of_birth'];
    countryOfCitizenship = json['country_of_citizenship'];
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
    profilePin = json['profile_pin'];
    mobileVerified = json['mobile_verified'];
    securityQuestion1 = json['security_question_1'];
    securityQuestion2 = json['security_question_2'];
    lastAnnouncementSeen = json['last_announcement_seen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['id'] = id;
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
    data['profile_pin'] = profilePin;
    data['mobile_verified'] = mobileVerified;
    data['security_question_1'] = securityQuestion1;
    data['security_question_2'] = securityQuestion2;
    data['last_announcement_seen'] = lastAnnouncementSeen;
    return data;
  }
}

class ProfessionalData {
  int? id;
  dynamic businessName;
  dynamic businessPhone;
  dynamic businessFax;
  dynamic businessEmail;
  dynamic businessWebsite;
  dynamic position;
  dynamic currentOccupation;
  dynamic idealOccupation;
  dynamic educationLevel;
  dynamic degree;
  dynamic affiliations;
  dynamic businessAddress;
  dynamic businessApt;
  dynamic businessZip;

  ProfessionalData(
      {id,
      businessName,
      businessPhone,
      businessFax,
      businessEmail,
      businessWebsite,
      position,
      currentOccupation,
      idealOccupation,
      educationLevel,
      degree,
      affiliations,
      businessAddress,
      businessApt,
      businessZip});

  ProfessionalData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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

class RelationshipData {
  int? id;
  dynamic relationshipType;
  bool? taxDependent;
  dynamic user;
  dynamic personalData;
  dynamic professionalData;

  RelationshipData(
      {id,
      relationshipType,
      taxDependent,
      user,
      personalData,
      professionalData});

  RelationshipData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    relationshipType = json['relationship_type'];
    taxDependent = json['tax_dependent'];
    user = json['user'];
    personalData = json['personal_data'];
    professionalData = json['professional_data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['relationship_type'] = relationshipType;
    data['tax_dependent'] = taxDependent;
    data['user'] = user;
    data['personal_data'] = personalData;
    data['professional_data'] = professionalData;
    return data;
  }
}

class HealthData {
  int? id;
  dynamic heightFt;
  dynamic heightInches;
  dynamic weight;
  dynamic smoker;
  dynamic doctorName;
  dynamic doctorPhoneNumber;
  dynamic dateOfLastVisit;
  dynamic doctorStreet;
  dynamic doctorApt;
  dynamic doctorZip;
  dynamic reason;
  dynamic outcome;
  dynamic healues;
  dynamic medications;
  dynamic ageOfSiblings;
  dynamic fatherAge;
  dynamic fatherDeathCause;
  dynamic motherAge;
  dynamic motherDeathCause;
  dynamic otherHealthNotes;
  bool? isBlind;
  bool? spouseIsBlind;
  dynamic user;

  HealthData(
      {id,
      heightFt,
      heightInches,
      weight,
      smoker,
      doctorName,
      doctorPhoneNumber,
      dateOfLastVisit,
      doctorStreet,
      doctorApt,
      doctorZip,
      reason,
      outcome,
      healues,
      medications,
      ageOfSiblings,
      fatherAge,
      fatherDeathCause,
      motherAge,
      motherDeathCause,
      otherHealthNotes,
      isBlind,
      spouseIsBlind,
      user});

  HealthData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    heightFt = json['height_ft'];
    heightInches = json['height_inches'];
    weight = json['weight'];
    smoker = json['smoker'];
    doctorName = json['doctor_name'];
    doctorPhoneNumber = json['doctor_phone_number'];
    dateOfLastVisit = json['date_of_last_visit'];
    doctorStreet = json['doctor_street'];
    doctorApt = json['doctor_apt'];
    doctorZip = json['doctor_zip'];
    reason = json['reason'];
    outcome = json['outcome'];
    healues = json['health_issues'];
    medications = json['medications'];
    ageOfSiblings = json['age_of_siblings'];
    fatherAge = json['father_age'];
    fatherDeathCause = json['father_death_cause'];
    motherAge = json['mother_age'];
    motherDeathCause = json['mother_death_cause'];
    otherHealthNotes = json['other_health_notes'];
    isBlind = json['is_blind'];
    spouseIsBlind = json['spouse_is_blind'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['height_ft'] = heightFt;
    data['height_inches'] = heightInches;
    data['weight'] = weight;
    data['smoker'] = smoker;
    data['doctor_name'] = doctorName;
    data['doctor_phone_number'] = doctorPhoneNumber;
    data['date_of_last_visit'] = dateOfLastVisit;
    data['doctor_street'] = doctorStreet;
    data['doctor_apt'] = doctorApt;
    data['doctor_zip'] = doctorZip;
    data['reason'] = reason;
    data['outcome'] = outcome;
    data['health_issues'] = healues;
    data['medications'] = medications;
    data['age_of_siblings'] = ageOfSiblings;
    data['father_age'] = fatherAge;
    data['father_death_cause'] = fatherDeathCause;
    data['mother_age'] = motherAge;
    data['mother_death_cause'] = motherDeathCause;
    data['other_health_notes'] = otherHealthNotes;
    data['is_blind'] = isBlind;
    data['spouse_is_blind'] = spouseIsBlind;
    data['user'] = user;
    return data;
  }
}

class FinancialData {
  dynamic id;
  dynamic taxProfessionalName;
  dynamic phone;
  dynamic address;
  dynamic assets;
  dynamic liabilities;
  dynamic netWorth;
  dynamic income;
  dynamic expenses;
  dynamic cashflow;
  dynamic financialHealthNotes;
  dynamic user;

  FinancialData(
      {id,
      taxProfessionalName,
      phone,
      address,
      assets,
      liabilities,
      netWorth,
      income,
      expenses,
      cashflow,
      financialHealthNotes,
      user});

  FinancialData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    taxProfessionalName = json['tax_professional_name'];
    phone = json['phone'];
    address = json['address'];
    assets = json['assets'];
    liabilities = json['liabilities'];
    netWorth = json['net_worth'];
    income = json['income'];
    expenses = json['expenses'];
    cashflow = json['cashflow'];
    financialHealthNotes = json['financial_health_notes'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tax_professional_name'] = taxProfessionalName;
    data['phone'] = phone;
    data['address'] = address;
    data['assets'] = assets;
    data['liabilities'] = liabilities;
    data['net_worth'] = netWorth;
    data['income'] = income;
    data['expenses'] = expenses;
    data['cashflow'] = cashflow;
    data['financial_health_notes'] = financialHealthNotes;
    data['user'] = user;
    return data;
  }
}

class HealthInsuranceData {
  dynamic id;
  dynamic policyNumber;
  dynamic monthlyPremium;
  dynamic issueDate;
  dynamic companyName;
  dynamic companyPhone;
  dynamic coPayment;
  dynamic coInsurance;
  dynamic deductible;
  dynamic maximumOutOfPocketLimit;
  dynamic primaryCarePhysician;
  dynamic doctorPhoneNumber;
  dynamic lastDoctorVisit;
  dynamic user;

  HealthInsuranceData(
      {id,
      policyNumber,
      monthlyPremium,
      issueDate,
      companyName,
      companyPhone,
      coPayment,
      coInsurance,
      deductible,
      maximumOutOfPocketLimit,
      primaryCarePhysician,
      doctorPhoneNumber,
      lastDoctorVisit,
      user});

  HealthInsuranceData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    policyNumber = json['policy_number'];
    monthlyPremium = json['monthly_premium'];
    issueDate = json['issue_date'];
    companyName = json['company_name'];
    companyPhone = json['company_phone'];
    coPayment = json['co_payment'];
    coInsurance = json['co_insurance'];
    deductible = json['deductible'];
    maximumOutOfPocketLimit = json['maximum_out_of_pocket_limit'];
    primaryCarePhysician = json['primary_care_physician'];
    doctorPhoneNumber = json['doctor_phone_number'];
    lastDoctorVisit = json['last_doctor_visit'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['policy_number'] = policyNumber;
    data['monthly_premium'] = monthlyPremium;
    data['issue_date'] = issueDate;
    data['company_name'] = companyName;
    data['company_phone'] = companyPhone;
    data['co_payment'] = coPayment;
    data['co_insurance'] = coInsurance;
    data['deductible'] = deductible;
    data['maximum_out_of_pocket_limit'] = maximumOutOfPocketLimit;
    data['primary_care_physician'] = primaryCarePhysician;
    data['doctor_phone_number'] = doctorPhoneNumber;
    data['last_doctor_visit'] = lastDoctorVisit;
    data['user'] = user;
    return data;
  }
}

class VaultDocumentData {
  dynamic id;
  dynamic publicationDate;
  dynamic description;
  dynamic file;
  dynamic user;
  dynamic name;
  dynamic typeName;

  VaultDocumentData(
      {id, publicationDate, description, file, user, name, typeName});

  VaultDocumentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    publicationDate = json['publication_date'];
    typeName = json['type_name'];
    description = json['description'];
    file = json['file'];
    user = json['user'];
    name = json['name'];
  }
}
