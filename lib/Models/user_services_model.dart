class UserServicesModel {
  String? identifier;
  String? dateCreated;
  int? createdBy;
  int? preferredPartner;
  int? partnerAssigned;
  int? service;
  int? requestedBy;
  String? source;
  dynamic contactEffort;
  dynamic actionScheduledOn;
  int? serviceFee;
  int? discount;
  dynamic discountDescription;
  int? status;
  dynamic additionalData;
  String? contactType;
  dynamic type;
  bool? smsNotificationSend;
  int? balance;
  dynamic extraInfo;
  String? statusDescription;
  String? error;
  String? serviceName;
  String? preferredPartnerName;
  String? preferredAssignedName;
  String? completedOn;

  UserServicesModel(
      {this.identifier,
      this.dateCreated,
      this.createdBy,
      this.preferredPartner,
      this.partnerAssigned,
      this.service,
      this.requestedBy,
      this.source,
      this.contactEffort,
      this.actionScheduledOn,
      this.serviceFee,
      this.discount,
      this.discountDescription,
      this.status,
      this.additionalData,
      this.contactType,
      this.type,
      this.smsNotificationSend,
      this.balance,
      this.extraInfo,
      this.statusDescription,
      this.error,
      this.serviceName,
      this.preferredAssignedName,
      this.preferredPartnerName, this.completedOn});

  UserServicesModel.withError(String errorMsg) {
    error = errorMsg;
  }

  UserServicesModel.fromJson(Map<String, dynamic> json) {
    identifier = json['identifier'];
    dateCreated = json['date_created'];
    createdBy = json['created_by'];
    preferredPartner = json['preferred_partner'];
    partnerAssigned = json['partner_assigned'];
    service = json['service'];
    requestedBy = json['requested_by'];
    source = json['source'];
    contactEffort = json['contact_effort'];
    actionScheduledOn = json['action_scheduled_on'];
    serviceFee = json['service_fee'];
    discount = json['discount'];
    discountDescription = json['discount_description'];
    status = json['status'];
    additionalData = json['additional_data'];
    contactType = json['contact_type'];
    type = json['type'];
    smsNotificationSend = json['sms_notification_send'];
    balance = json['balance'];
    extraInfo = json['extra_info'];
    statusDescription = json['status_description'];
    serviceName = json['service_name'];
    preferredAssignedName = json['partner_assigned_name'];
    preferredPartnerName = json['preferred_partner_name'];
    completedOn=json['completed_on'];
  }
}
