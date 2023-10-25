class MyNotesModel {
  int? id;
  String? dateCreated;
  String? dateUpdated;
  String? subject;
  String? text;
  int? createdBy;
  int? createdFor;

  MyNotesModel(
      {this.id,
      this.dateCreated,
      this.dateUpdated,
      this.subject,
      this.text,
      this.createdBy,
      this.createdFor});

  MyNotesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['date_created'];
    dateUpdated = json['date_updated'];
    subject = json['subject'];
    text = json['text'];
    createdBy = json['created_by'];
    createdFor = json['created_for'];
  }
}
