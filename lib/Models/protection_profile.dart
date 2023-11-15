class ProtectionProfileModel {
  List<LifeInsurance>? lifeInsurance;
  List<HealthInsurance>? healthInsurance;
  List<DisabilityInsurance>? disabilityInsurance;
  List<LongTermCareInsurance>? longTermCareInsurance;
  List<HomeInsurance>? homeInsurance;
  List<CarInsurance>? carInsurance;

  ProtectionProfileModel(
      {this.lifeInsurance,
      this.healthInsurance,
      this.disabilityInsurance,
      this.longTermCareInsurance,
      this.homeInsurance,
      this.carInsurance});

  ProtectionProfileModel.fromJson(Map<String, dynamic> json) {
    if (json['life_insurance'] != null) {
      lifeInsurance = <LifeInsurance>[];
      json['life_insurance'].forEach((v) {
        lifeInsurance!.add(LifeInsurance.fromJson(v));
      });
    }
    if (json['health_insurance'] != null) {
      healthInsurance = <HealthInsurance>[];
      json['health_insurance'].forEach((v) {
        healthInsurance!.add(HealthInsurance.fromJson(v));
      });
    }
    if (json['disability_insurance'] != null) {
      disabilityInsurance = <DisabilityInsurance>[];
      json['disability_insurance'].forEach((v) {
        disabilityInsurance!.add(DisabilityInsurance.fromJson(v));
      });
    }
    if (json['long_term_care_insurance'] != null) {
      longTermCareInsurance = <LongTermCareInsurance>[];
      json['long_term_care_insurance'].forEach((v) {
        longTermCareInsurance!.add(LongTermCareInsurance.fromJson(v));
      });
    }
    if (json['home_insurance'] != null) {
      homeInsurance = <HomeInsurance>[];
      json['home_insurance'].forEach((v) {
        homeInsurance!.add(HomeInsurance.fromJson(v));
      });
    }
    if (json['car_insurance'] != null) {
      carInsurance = <CarInsurance>[];
      json['car_insurance'].forEach((v) {
        carInsurance!.add(CarInsurance.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (lifeInsurance != null) {
      data['life_insurance'] = lifeInsurance!.map((v) => v.toJson()).toList();
    }
    if (healthInsurance != null) {
      data['health_insurance'] =
          healthInsurance!.map((v) => v.toJson()).toList();
    }
    if (disabilityInsurance != null) {
      data['disability_insurance'] =
          disabilityInsurance!.map((v) => v.toJson()).toList();
    }
    if (longTermCareInsurance != null) {
      data['long_term_care_insurance'] =
          longTermCareInsurance!.map((v) => v.toJson()).toList();
    }
    if (homeInsurance != null) {
      data['home_insurance'] = homeInsurance!.map((v) => v.toJson()).toList();
    }
    if (carInsurance != null) {
      data['car_insurance'] = carInsurance!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LifeInsurance {
  int? id;
  String? policyNumber;
  String? policyType;
  String? issueDate;
  String? companyName;
  String? companyPhone;
  String? currentDeathBenefit;
  String? currentPremiums;
  int? user;

  LifeInsurance(
      {this.id,
      this.policyNumber,
      this.policyType,
      this.issueDate,
      this.companyName,
      this.companyPhone,
      this.currentDeathBenefit,
      this.currentPremiums,
      this.user});

  LifeInsurance.fromJson(Map<String, dynamic> json) {
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

class HealthInsurance {
  int? id;
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
  int? user;

  HealthInsurance(
      {this.id,
      this.policyNumber,
      this.monthlyPremium,
      this.issueDate,
      this.companyName,
      this.companyPhone,
      this.coPayment,
      this.coInsurance,
      this.deductible,
      this.maximumOutOfPocketLimit,
      this.primaryCarePhysician,
      this.doctorPhoneNumber,
      this.lastDoctorVisit,
      this.user});

  HealthInsurance.fromJson(Map<String, dynamic> json) {
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

class DisabilityInsurance {
  int? id;
  String? policyNumber;
  String? policyType;
  dynamic issueDate;
  String? companyName;
  String? companyPhone;
  String? currentMonthlyBenefit;
  String? currentPremiums;
  int? user;

  DisabilityInsurance(
      {this.id,
      this.policyNumber,
      this.policyType,
      this.issueDate,
      this.companyName,
      this.companyPhone,
      this.currentMonthlyBenefit,
      this.currentPremiums,
      this.user});

  DisabilityInsurance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    policyNumber = json['policy_number'];
    policyType = json['policy_type'];
    issueDate = json['issue_date'];
    companyName = json['company_name'];
    companyPhone = json['company_phone'];
    currentMonthlyBenefit = json['current_monthly_benefit'];
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
    data['current_monthly_benefit'] = currentMonthlyBenefit;
    data['current_premiums'] = currentPremiums;
    data['user'] = user;
    return data;
  }
}

class LongTermCareInsurance {
  int? id;
  dynamic policyNumber;
  dynamic policyType;
  dynamic issueDate;
  dynamic companyName;
  dynamic companyPhone;
  dynamic currentMonthlyBenefit;
  dynamic currentPremiums;
  int? user;

  LongTermCareInsurance(
      {this.id,
      this.policyNumber,
      this.policyType,
      this.issueDate,
      this.companyName,
      this.companyPhone,
      this.currentMonthlyBenefit,
      this.currentPremiums,
      this.user});

  LongTermCareInsurance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    policyNumber = json['policy_number'];
    policyType = json['policy_type'];
    issueDate = json['issue_date'];
    companyName = json['company_name'];
    companyPhone = json['company_phone'];
    currentMonthlyBenefit = json['current_monthly_benefit'];
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
    data['current_monthly_benefit'] = currentMonthlyBenefit;
    data['current_premiums'] = currentPremiums;
    data['user'] = user;
    return data;
  }
}

class HomeInsurance {
  int? id;
  dynamic yearBuilt;
  dynamic homeUse;
  dynamic policyNumber;
  dynamic issueDate;
  dynamic companyName;
  dynamic companyPhone;
  dynamic annualPremium;
  dynamic deductible;
  dynamic dwelling;
  dynamic otherStructures;
  dynamic personalProperty;
  dynamic lossOfUse;
  dynamic personalLiability;
  dynamic medicalExpenses;
  int? user;

  HomeInsurance(
      {this.id,
      this.yearBuilt,
      this.homeUse,
      this.policyNumber,
      this.issueDate,
      this.companyName,
      this.companyPhone,
      this.annualPremium,
      this.deductible,
      this.dwelling,
      this.otherStructures,
      this.personalProperty,
      this.lossOfUse,
      this.personalLiability,
      this.medicalExpenses,
      this.user});

  HomeInsurance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    yearBuilt = json['year_built'];
    homeUse = json['home_use'];
    policyNumber = json['policy_number'];
    issueDate = json['issue_date'];
    companyName = json['company_name'];
    companyPhone = json['company_phone'];
    annualPremium = json['annual_premium'];
    deductible = json['deductible'];
    dwelling = json['dwelling'];
    otherStructures = json['other_structures'];
    personalProperty = json['personal_property'];
    lossOfUse = json['loss_of_use'];
    personalLiability = json['personal_liability'];
    medicalExpenses = json['medical_expenses'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['year_built'] = yearBuilt;
    data['home_use'] = homeUse;
    data['policy_number'] = policyNumber;
    data['issue_date'] = issueDate;
    data['company_name'] = companyName;
    data['company_phone'] = companyPhone;
    data['annual_premium'] = annualPremium;
    data['deductible'] = deductible;
    data['dwelling'] = dwelling;
    data['other_structures'] = otherStructures;
    data['personal_property'] = personalProperty;
    data['loss_of_use'] = lossOfUse;
    data['personal_liability'] = personalLiability;
    data['medical_expenses'] = medicalExpenses;
    data['user'] = user;
    return data;
  }
}

class CarInsurance {
  int? id;
  dynamic vinNumber;
  dynamic yearMakeAndModel;
  dynamic policyNumber;
  dynamic issueDate;
  dynamic companyName;
  dynamic companyPhone;
  dynamic monthlyPremium;
  dynamic bodilyInjuryLiability;
  dynamic propertyDamageLiability;
  dynamic personalInjuryProtection;
  dynamic uninsuredMotorist;
  dynamic comprehensibleCoverageDeductible;
  dynamic collisionCoverageDeductible;
  int? user;

  CarInsurance(
      {this.id,
      this.vinNumber,
      this.yearMakeAndModel,
      this.policyNumber,
      this.issueDate,
      this.companyName,
      this.companyPhone,
      this.monthlyPremium,
      this.bodilyInjuryLiability,
      this.propertyDamageLiability,
      this.personalInjuryProtection,
      this.uninsuredMotorist,
      this.comprehensibleCoverageDeductible,
      this.collisionCoverageDeductible,
      this.user});

  CarInsurance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vinNumber = json['vin_number'];
    yearMakeAndModel = json['year_make_and_model'];
    policyNumber = json['policy_number'];
    issueDate = json['issue_date'];
    companyName = json['company_name'];
    companyPhone = json['company_phone'];
    monthlyPremium = json['monthly_premium'];
    bodilyInjuryLiability = json['bodily_injury_liability'];
    propertyDamageLiability = json['property_damage_liability'];
    personalInjuryProtection = json['personal_injury_protection'];
    uninsuredMotorist = json['uninsured_motorist'];
    comprehensibleCoverageDeductible =
        json['comprehensible_coverage_deductible'];
    collisionCoverageDeductible = json['collision_coverage_deductible'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['vin_number'] = vinNumber;
    data['year_make_and_model'] = yearMakeAndModel;
    data['policy_number'] = policyNumber;
    data['issue_date'] = issueDate;
    data['company_name'] = companyName;
    data['company_phone'] = companyPhone;
    data['monthly_premium'] = monthlyPremium;
    data['bodily_injury_liability'] = bodilyInjuryLiability;
    data['property_damage_liability'] = propertyDamageLiability;
    data['personal_injury_protection'] = personalInjuryProtection;
    data['uninsured_motorist'] = uninsuredMotorist;
    data['comprehensible_coverage_deductible'] =
        comprehensibleCoverageDeductible;
    data['collision_coverage_deductible'] = collisionCoverageDeductible;
    data['user'] = user;
    return data;
  }
}
