class ProtectionDataModel {
  int? id;
  int? user;
  String? policyNumber;
  String? policyType;
  String? issueDate;
  String? companyName;
  String? companyPhone;
  String? currentDeathBenefit;
  String? currentPremiums;
  String? type;

  ProtectionDataModel(
      {this.id,
      this.user,
      this.policyNumber,
      this.policyType,
      this.issueDate,
      this.companyName,
      this.companyPhone,
      this.currentDeathBenefit,
      this.currentPremiums,
      this.type});

  ProtectionDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    policyNumber = json['policy_number'];
    policyType = json['policy_type'];
    issueDate = json['issue_date'];
    companyName = json['company_name'];
    companyPhone = json['company_phone'];
    currentDeathBenefit = json['current_death_benefit'];
    currentPremiums = json['current_premiums'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['policy_number'] = this.policyNumber;
    data['policy_type'] = this.policyType;
    data['issue_date'] = this.issueDate;
    data['company_name'] = this.companyName;
    data['company_phone'] = this.companyPhone;
    data['current_death_benefit'] = this.currentDeathBenefit;
    data['current_premiums'] = this.currentPremiums;
    data['type'] = this.type;
    return data;
  }
}
