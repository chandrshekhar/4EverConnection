class EarningHistoryModel {
  int? id;
  String? date;
  String? earned;
  String? client;
  String? service;

  EarningHistoryModel(
      {this.id, this.date, this.earned, this.client, this.service});

  EarningHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    earned = json['earned'];
    client = json['client'];
    service = json['service'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['earned'] = earned;
    data['client'] = client;
    data['service'] = service;
    return data;
  }
}
