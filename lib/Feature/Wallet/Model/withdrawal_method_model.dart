import 'package:get/get.dart';

class WithdrawalMethod {
  int? id;
  String? dateCreated;
  String? method;
  String? type;
  String? identification;
  RxBool defaults = false.obs;
  bool? deleted;
  int? marketingPartner;

  WithdrawalMethod(
      {this.id,
      this.dateCreated,
      this.method,
      this.type,
      this.identification,
      required this.defaults,
      this.deleted,
      this.marketingPartner});

  WithdrawalMethod.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['date_created'];
    method = json['method'];
    type = json['type'];
    identification = json['identification'];
    defaults.value = json['default'];
    deleted = json['deleted'];
    marketingPartner = json['marketing_partner'];
  }
}
