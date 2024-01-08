class WithdrawReqListModel {
  int? id;
  String? dateCreated;
  int? amount;
  String? status;
  String? reference;
  String? method;

  WithdrawReqListModel(
      {this.id,
      this.dateCreated,
      this.amount,
      this.status,
      this.reference,
      this.method});

  WithdrawReqListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['date_created'];
    amount = json['amount'];
    status = json['status'];
    reference = json['reference'];
    method = json['method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date_created'] = dateCreated;
    data['amount'] = amount;
    data['status'] = status;
    data['reference'] = reference;
    data['method'] = method;
    return data;
  }
}
