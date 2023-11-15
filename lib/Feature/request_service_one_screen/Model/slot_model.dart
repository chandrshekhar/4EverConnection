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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['has_service'] = hasService;
    data['enabled'] = enabled;
    data['date'] = date;
    if (service != null) {
      data['service'] = service!.toJson();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contact_type'] = contactType;
    data['requested_by'] = requestedBy;
    data['id'] = id;
    data['type'] = type;
    data['service'] = service;
    return data;
  }
}
