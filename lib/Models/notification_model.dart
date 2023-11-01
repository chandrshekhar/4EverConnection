class GetNotificationModel {
  int? id;
  String? dateCreated;
  String? subject;
  String? text;
  bool? seen;

  GetNotificationModel(
      {this.id, this.dateCreated, this.subject, this.text, this.seen});

  GetNotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['date_created'];
    subject = json['subject'];
    text = json['text'];
    seen = json['seen'];
  }
}
