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
    if (json['health_insurance_data'] != null) {
      healthInsuranceData = <Null>[];
    }

    if (json['vault_document_data'] != null) {
      vaultDocumentData = <VaultDocumentData>[];
      json['vault_document_data'].forEach((v) {
        vaultDocumentData!.add(VaultDocumentData.fromJson(v));
      });
    }
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
}
