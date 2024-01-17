class SlotModelList {
  int? time;
  bool? hasService;
  bool? enabled;
  String? date;
  Service? service;

  SlotModelList(
      {this.time, this.hasService, this.enabled, this.date, this.service});

  SlotModelList.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    hasService = json['has_service'];
    enabled = json['enabled'];
    date = json['date'];
    service =
        json['service'] != null ? Service.fromJson(json['service']) : null;
  }
}

class Service {
  String? contactType;
  String? requestedBy;
  int? id;
  String? type;
  String? service;

  Service(
      {this.contactType, this.requestedBy, this.id, this.type, this.service});

  Service.fromJson(Map<String, dynamic> json) {
    contactType = json['contact_type'];
    requestedBy = json['requested_by'];
    id = json['id'];
    type = json['type'];
    service = json['service'];
  }
}
