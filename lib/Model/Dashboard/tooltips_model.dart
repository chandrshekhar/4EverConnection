class TooltipsModel {
  int? id;
  String? dateCreated;
  String? identifier;
  String? content;

  TooltipsModel({this.id, this.dateCreated, this.identifier, this.content});

  TooltipsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['date_created'];
    identifier = json['identifier'];
    content = json['content'];
  }
}
