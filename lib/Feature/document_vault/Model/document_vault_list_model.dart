class DocumentVaultListModel {
  int? id;
  int? user;
  String? publicationDate;
  int? name;
  String? typeName;
  String? description;
  String? file;

  DocumentVaultListModel(
      {this.id,
      this.user,
      this.publicationDate,
      this.name,
      this.typeName,
      this.description,
      this.file});

  DocumentVaultListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    publicationDate = json['publication_date'];
    name = json['name'];
    typeName = json['type_name'];
    description = json['description'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user'] = user;
    data['publication_date'] = publicationDate;
    data['name'] = name;
    data['type_name'] = typeName;
    data['description'] = description;
    data['file'] = file;
    return data;
  }
}
