class GetNotificationModel {
  int? id;
  String? announcedFromName;
  String? announcedFromPhoto;
  String? dateCreated;
  String? subject;
  String? text;
  bool? seen;

  GetNotificationModel(
      {this.id,
      this.announcedFromName,
      this.announcedFromPhoto,
      this.dateCreated,
      this.subject,
      this.text,
      this.seen});

  GetNotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    announcedFromName = json['announced_from_name'];
    announcedFromPhoto = json['announced_from_photo'];
    dateCreated = json['date_created'];
    subject = json['subject'];
    text = json['text'];
    seen = json['seen'];
  }
}
