class LifeInsuranceModel {
  int? id;
  String? policyNumber;
  String? policyType;
  String? issueDate;
  String? companyName;
  String? companyPhone;
  String? currentDeathBenefit;
  String? currentPremiums;
  int? user;

  LifeInsuranceModel(
      {this.id,
      this.policyNumber,
      this.policyType,
      this.issueDate,
      this.companyName,
      this.companyPhone,
      this.currentDeathBenefit,
      this.currentPremiums,
      this.user});

  LifeInsuranceModel.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['policy_number'] = this.policyNumber;
    data['policy_type'] = this.policyType;
    data['issue_date'] = this.issueDate;
    data['company_name'] = this.companyName;
    data['company_phone'] = this.companyPhone;
    data['current_death_benefit'] = this.currentDeathBenefit;
    data['current_premiums'] = this.currentPremiums;
    data['user'] = this.user;
    return data;
  }
}
