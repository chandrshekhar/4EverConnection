class ProfessionalDataModel {
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

  ProfessionalDataModel(
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

  ProfessionalDataModel.fromJson(Map<String, dynamic> json) {
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

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['business_name'] = this.businessName;
  //   data['business_phone'] = this.businessPhone;
  //   data['business_fax'] = this.businessFax;
  //   data['business_email'] = this.businessEmail;
  //   data['business_website'] = this.businessWebsite;
  //   data['position'] = this.position;
  //   data['current_occupation'] = this.currentOccupation;
  //   data['ideal_occupation'] = this.idealOccupation;
  //   data['education_level'] = this.educationLevel;
  //   data['degree'] = this.degree;
  //   data['affiliations'] = this.affiliations;
  //   data['business_address'] = this.businessAddress;
  //   data['business_apt'] = this.businessApt;
  //   data['business_zip'] = this.businessZip;
  //   return data;
  // }
}
