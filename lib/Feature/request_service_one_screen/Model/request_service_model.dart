class ServiceListModel {
  int? id;
  String? name;
  String? description;
  int? order;

  ServiceListModel({this.id, this.name, this.description, this.order});

  ServiceListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['order'] = order;
    return data;
  }
}
