class PartnerModelList {
  int? id;
  String? fullName;

  PartnerModelList({this.id, this.fullName});

  PartnerModelList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    return data;
  }
}
