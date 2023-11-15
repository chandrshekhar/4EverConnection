class AutoGenerate {
  PersonalData? personalData;
  ProfessionalData? professionalData;
  List<RelationshipData>? relationshipData;
  HealthData? healthData;
  FinancialData? financialData;
  List<LifeInsuranceData>? lifeInsuranceData;
  List<dynamic>? healthInsuranceData;
  List<dynamic>? disabilityInsuranceData;
  List<dynamic>? longTermCareInsuranceData;
  List<dynamic>? homeInsuranceData;
  List<dynamic>? carInsuranceData;
  List<VaultDocumentData>? vaultDocumentData;

  AutoGenerate(
      {this.personalData,
      this.professionalData,
      this.relationshipData,
      this.healthData,
      this.financialData,
      this.lifeInsuranceData,
      this.healthInsuranceData,
      this.disabilityInsuranceData,
      this.longTermCareInsuranceData,
      this.homeInsuranceData,
      this.carInsuranceData,
      this.vaultDocumentData});

  AutoGenerate.fromJson(Map<String, dynamic> json) {
    personalData = json['personal_data'] != null
        ?  PersonalData.fromJson(json['personal_data'])
        : null;
    professionalData = json['professional_data'] != null
        ?  ProfessionalData.fromJson(json['professional_data'])
        : null;
    if (json['relationship_data'] != null) {
      relationshipData = <RelationshipData>[];
      json['relationship_data'].forEach((v) {
        relationshipData!.add( RelationshipData.fromJson(v));
      });
    }
    healthData = json['health_data'] != null
        ? new HealthData.fromJson(json['health_data'])
        : null;
    financialData = json['financial_data'] != null
        ? new FinancialData.fromJson(json['financial_data'])
        : null;
    if (json['life_insurance_data'] != null) {
      lifeInsuranceData = <LifeInsuranceData>[];
      json['life_insurance_data'].forEach((v) {
        lifeInsuranceData!.add(new LifeInsuranceData.fromJson(v));
      });
    }
    if (json['health_insurance_data'] != null) {
      healthInsuranceData = <Null>[];
      // json['health_insurance_data'].forEach((v) {
      //   healthInsuranceData!.add(new Null.fromJson(v));
      // });
    }
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
    if (lifeInsuranceData != null) {
      data['life_insurance_data'] =
          lifeInsuranceData!.map((v) => v.toJson()).toList();
    }
    if (healthInsuranceData != null) {
      data['health_insurance_data'] =
          healthInsuranceData!.map((v) => v.toJson()).toList();
    }
    if (disabilityInsuranceData != null) {
      data['disability_insurance_data'] =
          disabilityInsuranceData!.map((v) => v.toJson()).toList();
    }
    if (longTermCareInsuranceData != null) {
      data['long_term_care_insurance_data'] =
          longTermCareInsuranceData!.map((v) => v.toJson()).toList();
    }
    if (homeInsuranceData != null) {
      data['home_insurance_data'] =
          homeInsuranceData!.map((v) => v.toJson()).toList();
    }
    if (carInsuranceData != null) {
      data['car_insurance_data'] =
          carInsuranceData!.map((v) => v.toJson()).toList();
    }
    if (vaultDocumentData != null) {
      data['vault_document_data'] =
          vaultDocumentData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PersonalData {
  int? id;
  int? userId;
  String? lifePartnerName;
  String? lifePartnerPhone;
  bool? lifePartnerIsNotMarried;
  String? userEmail;
  String? firstName;
  Null? middleName;
  String? lastName;
  String? mobilePhone;
  int? mobileOnlyNumbers;
  String? homePhone;
  String? homeAddress;
  String? homeApt;
  String? homeZip;
  String? homeAddressCountry;
  String? dateOfBirth;
  Null? dateOfAnniversary;
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
  Null? securityAnswer1;
  Null? securityAnswer2;
  Null? personalEmail;
  Null? importInfo;
  Null? profilePin;
  bool? mobileVerified;
  Null? profileNote;
  Null? securityQuestion1;
  Null? securityQuestion2;
  int? lastAnnouncementSeen;

  PersonalData(
      {this.id,
      this.userId,
      this.lifePartnerName,
      this.lifePartnerPhone,
      this.lifePartnerIsNotMarried,
      this.userEmail,
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

  PersonalData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    lifePartnerName = json['life_partner_name'];
    lifePartnerPhone = json['life_partner_phone'];
    lifePartnerIsNotMarried = json['life_partner_is_not_married'];
    userEmail = json['user_email'];
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
    data['profile_note'] = profileNote;
    data['security_question_1'] = securityQuestion1;
    data['security_question_2'] = securityQuestion2;
    data['last_announcement_seen'] = lastAnnouncementSeen;
    return data;
  }
}

class ProfessionalData {
  int? id;
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
  String? relationshipType;
  bool? taxDependent;
  int? user;
  int? personalData;
  int? professionalData;

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
  int? id;
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
  int? user;

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
  int? id;
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
  int? user;

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
  int? id;
  String? policyNumber;
  String? policyType;
  String? issueDate;
  String? companyName;
  String? companyPhone;
  String? currentDeathBenefit;
  String? currentPremiums;
  int? user;

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

class VaultDocumentData {
  int? id;
  int? user;
  String? publicationDate;
  int? name;
  String? typeName;
  String? description;
  String? file;

  VaultDocumentData(
      {this.id,
      this.user,
      this.publicationDate,
      this.name,
      this.typeName,
      this.description,
      this.file});

  VaultDocumentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    publicationDate = json['publication_date'];
    name = json['name'];
    typeName = json['type_name'];
    description = json['description'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user'] = user;
    data['publication_date'] = publicationDate;
    data['name'] = name;
    data['type_name'] = typeName;
    data['description'] = description;
    data['file'] = file;
    return data;
  }
}
