class UserProfileModel {
  PersonalData? personalData;
  ProfessionalData? professionalData;
  List<RelationshipData>? relationshipData;
  HealthData? healthData;
  FinancialData? financialData;
  List<LifeInsuranceData>? lifeInsuranceData;
  // List<Null>? healthInsuranceData;
  // List<Null>? disabilityInsuranceData;
  // List<Null>? longTermCareInsuranceData;
  // List<Null>? homeInsuranceData;
  // List<Null>? carInsuranceData;
  // List<VaultDocumentData>? vaultDocumentData;

  UserProfileModel({
    this.personalData,
    this.professionalData,
    this.relationshipData,
    this.healthData,
    this.financialData,
    this.lifeInsuranceData,
    // this.healthInsuranceData,
    // this.disabilityInsuranceData,
    // this.longTermCareInsuranceData,
    // this.homeInsuranceData,
    // this.carInsuranceData,
    // this.vaultDocumentData
  });

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
    if (json['life_insurance_data'] != null) {
      lifeInsuranceData = <LifeInsuranceData>[];
      json['life_insurance_data'].forEach((v) {
        lifeInsuranceData!.add(LifeInsuranceData.fromJson(v));
      });
    }
    // if (json['health_insurance_data'] != null) {
    //   healthInsuranceData = <Null>[];
    //   json['health_insurance_data'].forEach((v) {
    //     healthInsuranceData!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['disability_insurance_data'] != null) {
    //   disabilityInsuranceData = <Null>[];
    //   json['disability_insurance_data'].forEach((v) {
    //     disabilityInsuranceData!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['long_term_care_insurance_data'] != null) {
    //   longTermCareInsuranceData = <Null>[];
    //   json['long_term_care_insurance_data'].forEach((v) {
    //     longTermCareInsuranceData!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['home_insurance_data'] != null) {
    //   homeInsuranceData = <Null>[];
    //   json['home_insurance_data'].forEach((v) {
    //     homeInsuranceData!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['car_insurance_data'] != null) {
    //   carInsuranceData = <Null>[];
    //   json['car_insurance_data'].forEach((v) {
    //     carInsuranceData!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['vault_document_data'] != null) {
    //   vaultDocumentData = <VaultDocumentData>[];
    //   json['vault_document_data'].forEach((v) {
    //     vaultDocumentData!.add(new VaultDocumentData.fromJson(v));
    //   });
    // }

    // Map<String, dynamic> toJson() {
    //   final Map<String, dynamic> data = new Map<String, dynamic>();
    //   if (this.personalData != null) {
    //     data['personal_data'] = this.personalData!.toJson();
    //   }
    //   if (this.professionalData != null) {
    //     data['professional_data'] = this.professionalData!.toJson();
    //   }
    //   if (this.relationshipData != null) {
    //     data['relationship_data'] =
    //         this.relationshipData!.map((v) => v.toJson()).toList();
    //   }
    //   if (this.healthData != null) {
    //     data['health_data'] = this.healthData!.toJson();
    //   }
    //   if (this.financialData != null) {
    //     data['financial_data'] = this.financialData!.toJson();
    //   }
    //   if (this.lifeInsuranceData != null) {
    //     data['life_insurance_data'] =
    //         this.lifeInsuranceData!.map((v) => v.toJson()).toList();
    //   }
    //   if (this.healthInsuranceData != null) {
    //     data['health_insurance_data'] =
    //         this.healthInsuranceData!.map((v) => v.toJson()).toList();
    //   }
    //   if (this.disabilityInsuranceData != null) {
    //     data['disability_insurance_data'] =
    //         this.disabilityInsuranceData!.map((v) => v.toJson()).toList();
    //   }
    //   if (this.longTermCareInsuranceData != null) {
    //     data['long_term_care_insurance_data'] =
    //         this.longTermCareInsuranceData!.map((v) => v.toJson()).toList();
    //   }
    //   if (this.homeInsuranceData != null) {
    //     data['home_insurance_data'] =
    //         this.homeInsuranceData!.map((v) => v.toJson()).toList();
    //   }
    //   if (this.carInsuranceData != null) {
    //     data['car_insurance_data'] =
    //         this.carInsuranceData!.map((v) => v.toJson()).toList();
    //   }
    //   if (this.vaultDocumentData != null) {
    //     data['vault_document_data'] =
    //         this.vaultDocumentData!.map((v) => v.toJson()).toList();
    //   }
    // return data;
  }
}

class PersonalData {
  dynamic id;
  dynamic userId;
  String? lifePartnerName;
  String? lifePartnerPhone;
  bool? lifePartnerIsNotMarried;
  String? userEmail;
  String? modified;
  String? firstName;
  dynamic middleName;
  String? lastName;
  String? mobilePhone;
  dynamic mobileOnlyNumbers;
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
  dynamic sentSms;
  bool? termsAccepted;
  bool? privacyAccepted;
  bool? electronicAuthorDiscAccepted;
  dynamic securityAnswer1;
  dynamic securityAnswer2;
  dynamic personalEmail;
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
    personalEmail = json['user_email'];
    importInfo = json['import_info'];
    mobileVerified = json['mobile_verified'];
    profileNote = json['profile_note'];
    securityQuestion1 = json['security_question_1'];
    securityQuestion2 = json['security_question_2'];
    lastAnnouncementSeen = json['last_announcement_seen'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
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
  //   data['mobile_verified'] = this.mobileVerified;
  //   data['profile_note'] = this.profileNote;
  //   data['security_question_1'] = this.securityQuestion1;
  //   data['security_question_2'] = this.securityQuestion2;
  //   data['last_announcement_seen'] = this.lastAnnouncementSeen;
  //   return data;
  // }
}

class ProfessionalData {
  dynamic id;
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

class RelationshipData {
  dynamic id;
  String? relationshipType;
  bool? taxDependent;
  dynamic user;
  dynamic personalData;
  dynamic professionalData;

  RelationshipData(
      {this.id,
      this.relationshipType,
      this.taxDependent,
      this.user,
      this.personalData,
      this.professionalData});

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
  dynamic id;
  String? heightFt;
  String? heightInches;
  String? weight;
  String? smoker;
  String? doctorName;
  String? doctorPhoneNumber;
  String? dateOfLastVisit;
  String? doctorStreet;
  String? doctorApt;
  String? doctorZip;
  String? reason;
  String? outcome;
  String? healthIssues;
  String? medications;
  String? ageOfSiblings;
  String? fatherAge;
  String? fatherDeathCause;
  String? motherAge;
  String? motherDeathCause;
  String? otherHealthNotes;
  bool? isBlind;
  bool? spouseIsBlind;
  dynamic user;

  HealthData(
      {this.id,
      this.heightFt,
      this.heightInches,
      this.weight,
      this.smoker,
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
      this.isBlind,
      this.spouseIsBlind,
      this.user});

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
    healthIssues = json['health_issues'];
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
    data['health_issues'] = healthIssues;
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
  String? taxProfessionalName;
  String? phone;
  String? address;
  String? assets;
  String? liabilities;
  String? netWorth;
  String? income;
  String? expenses;
  String? cashflow;
  String? financialHealthNotes;
  dynamic user;

  FinancialData(
      {this.id,
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
      this.user});

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

class LifeInsuranceData {
  dynamic id;
  String? policyNumber;
  String? policyType;
  String? issueDate;
  String? companyName;
  String? companyPhone;
  String? currentDeathBenefit;
  String? currentPremiums;
  dynamic user;

  LifeInsuranceData(
      {this.id,
      this.policyNumber,
      this.policyType,
      this.issueDate,
      this.companyName,
      this.companyPhone,
      this.currentDeathBenefit,
      this.currentPremiums,
      this.user});

  LifeInsuranceData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    policyNumber = json['policy_number'];
    policyType = json['policy_type'];
    issueDate = json['issue_date'];
    companyName = json['company_name'];
    companyPhone = json['company_phone'];
    currentDeathBenefit = json['current_death_benefit'];
    currentPremiums = json['current_premiums'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['policy_number'] = policyNumber;
    data['policy_type'] = policyType;
    data['issue_date'] = issueDate;
    data['company_name'] = companyName;
    data['company_phone'] = companyPhone;
    data['current_death_benefit'] = currentDeathBenefit;
    data['current_premiums'] = currentPremiums;
    data['user'] = user;
    return data;
  }
}
