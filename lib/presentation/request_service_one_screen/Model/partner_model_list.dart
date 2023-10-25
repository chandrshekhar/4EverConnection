class PartnerModelList {
  int? id;
  String? fullName;

  PartnerModelList({this.id, this.fullName});

  PartnerModelList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    return data;
  }
}
