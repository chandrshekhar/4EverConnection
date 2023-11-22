class ContactListModel {
  int? id;
  String? dateCreated;
  String? photo;
  String? firstName;
  String? middleName;
  String? lastName;
  String? businessName;
  dynamic position;
  String? currentOccupation;
  String? idealOccupation;
  String? mobilePhone;
  dynamic liferPartnerName;
  String? lifePartnerPhone;
  String? homePhone;
  String? personalEmail;
  String? businessPhone;
  String? businessEmail;
  String? businessFax;
  String? businessWebsite;
  String? homeAddress;
  String? homeApartment;
  String? homeZipCode;
  String? businessAddress;
  String? businessApartment;
  String? businessZipCode;
  dynamic additional;
  String? dateOfBirth;
  String? gender;
  dynamic additionalJson;
  int? createdBy;
  dynamic connectionCreated;

  ContactListModel(
      {this.id,
      this.dateCreated,
      this.photo,
      this.firstName,
      this.middleName,
      this.lastName,
      this.businessName,
      this.position,
      this.currentOccupation,
      this.idealOccupation,
      this.mobilePhone,
      this.liferPartnerName,
      this.lifePartnerPhone,
      this.homePhone,
      this.personalEmail,
      this.businessPhone,
      this.businessEmail,
      this.businessFax,
      this.businessWebsite,
      this.homeAddress,
      this.homeApartment,
      this.homeZipCode,
      this.businessAddress,
      this.businessApartment,
      this.businessZipCode,
      this.additional,
      this.dateOfBirth,
      this.gender,
      this.additionalJson,
      this.createdBy,
      this.connectionCreated});

  ContactListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['date_created'];
    photo = json['photo'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    businessName = json['business_name'];
    position = json['position'];
    currentOccupation = json['current_occupation'];
    idealOccupation = json['ideal_occupation'];
    mobilePhone = json['mobile_phone'];
    liferPartnerName = json['lifer_partner_name'];
    lifePartnerPhone = json['life_partner_phone'];
    homePhone = json['home_phone'];
    personalEmail = json['personal_email'];
    businessPhone = json['business_phone'];
    businessEmail = json['business_email'];
    businessFax = json['business_fax'];
    businessWebsite = json['business_website'];
    homeAddress = json['home_address'];
    homeApartment = json['home_apartment'];
    homeZipCode = json['home_zip_code'];
    businessAddress = json['business_address'];
    businessApartment = json['business_apartment'];
    businessZipCode = json['business_zip_code'];
    additional = json['additional'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    additionalJson = json['additional_json'];
    createdBy = json['created_by'];
    connectionCreated = json['connection_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date_created'] = this.dateCreated;
    data['photo'] = this.photo;
    data['first_name'] = this.firstName;
    data['middle_name'] = this.middleName;
    data['last_name'] = this.lastName;
    data['business_name'] = this.businessName;
    data['position'] = this.position;
    data['current_occupation'] = this.currentOccupation;
    data['ideal_occupation'] = this.idealOccupation;
    data['mobile_phone'] = this.mobilePhone;
    data['lifer_partner_name'] = this.liferPartnerName;
    data['life_partner_phone'] = this.lifePartnerPhone;
    data['home_phone'] = this.homePhone;
    data['personal_email'] = this.personalEmail;
    data['business_phone'] = this.businessPhone;
    data['business_email'] = this.businessEmail;
    data['business_fax'] = this.businessFax;
    data['business_website'] = this.businessWebsite;
    data['home_address'] = this.homeAddress;
    data['home_apartment'] = this.homeApartment;
    data['home_zip_code'] = this.homeZipCode;
    data['business_address'] = this.businessAddress;
    data['business_apartment'] = this.businessApartment;
    data['business_zip_code'] = this.businessZipCode;
    data['additional'] = this.additional;
    data['date_of_birth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['additional_json'] = this.additionalJson;
    data['created_by'] = this.createdBy;
    data['connection_created'] = this.connectionCreated;
    return data;
  }
}
