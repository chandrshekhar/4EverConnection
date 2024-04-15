class PartnerContactListModel {
  int? recordsTotal;
  int? recordsFiltered;
  List<PartnerContactModel>? data;

  PartnerContactListModel({this.recordsTotal, this.recordsFiltered, this.data});

  PartnerContactListModel.fromJson(Map<String, dynamic> json) {
    recordsTotal = json['recordsTotal'];
    recordsFiltered = json['recordsFiltered'];
    if (json['data'] != null) {
      data = <PartnerContactModel>[];
      json['data'].forEach((v) {
        data!.add(new PartnerContactModel.fromJson(v));
      });
    }
  }
}

class PartnerContactModel {
  int? id;
  bool? hasAccess;   
  String? contactName;
  String? mobilePhone;
  String? email;

  PartnerContactModel(
      {this.id,
      this.hasAccess,
      this.contactName,
      this.mobilePhone,
      this.email});

  PartnerContactModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hasAccess = json['has_access'];
    contactName = json['contact_name'];
    mobilePhone = json['mobile_phone'];
    email = json['email'];
  }
}
