class ConnectionModel {
  int? id;
  String? preferredPartnerName;
  String? serviceName;
  int? createdBy;
  bool? accepted;
  dynamic userCreated;
  String? dateCreated;
  int? service;
  int? preferredPartner;
  String? companyName;
  String? firstName;
  String? middleName;
  String? lastName;
  String? mobilePhone;
  String? email;
  String? homeAddress;
  String? homeApt;
  String? homeZip;
  String? additional;
  String? uuid;
  String? status;
  bool? disableMarketingDollars;

  ConnectionModel(
      {this.id,
      this.preferredPartnerName,
      this.serviceName,
      this.createdBy,
      this.accepted,
      this.userCreated,
      this.dateCreated,
      this.service,
      this.preferredPartner,
      this.companyName,
      this.firstName,
      this.middleName,
      this.lastName,
      this.mobilePhone,
      this.email,
      this.homeAddress,
      this.homeApt,
      this.homeZip,
      this.additional,
      this.uuid,
      this.status,
      this.disableMarketingDollars});

  ConnectionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    preferredPartnerName = json['preferred_partner_name'];
    serviceName = json['service_name'];
    createdBy = json['created_by'];
    accepted = json['accepted'];
    userCreated = json['user_created'];
    dateCreated = json['date_created'];
    service = json['service'];
    preferredPartner = json['preferred_partner'];
    companyName = json['company_name'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    mobilePhone = json['mobile_phone'];
    email = json['email'];
    homeAddress = json['home_address'];
    homeApt = json['home_apt'];
    homeZip = json['home_zip'];
    additional = json['additional'];
    uuid = json['uuid'];
    status = json['status'];
    disableMarketingDollars = json['disable_marketing_dollars'];
  }

 
}
