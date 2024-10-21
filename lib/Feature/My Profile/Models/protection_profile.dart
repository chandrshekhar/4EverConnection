class ProtectionDataModel {
  int? id;
  dynamic user;
  String? policyNumber;
  String? policyType;
  String? issueDate;
  String? companyName;
  String? companyPhone;
  dynamic currentDeathBenefit;
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
}
