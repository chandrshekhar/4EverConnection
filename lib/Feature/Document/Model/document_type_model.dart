class DocumentTypeModel {
  int? id;
  String? name;

  DocumentTypeModel({this.id, this.name});

  DocumentTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  
}
