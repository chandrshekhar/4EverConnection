class PartnerModelList {
  int? id;
  String? fullName;

  PartnerModelList({this.id, this.fullName});

  PartnerModelList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
  }


}
