class PartnerDashboardLobbyRequestServiceModel {
  List<Services>? services;

  PartnerDashboardLobbyRequestServiceModel({this.services});

  PartnerDashboardLobbyRequestServiceModel.fromJson(Map<String, dynamic> json) {
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (services != null) {
      data['services'] = services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
  int? id;
  String? identifier;
  String? dateCreated;
  int? createdBy;
  int? preferredPartner;
  int? partnerAssigned;
  String? preferredPartnerName;
  String? partnerAssignedName;
  String? partnerAssignedEmail;
  String? partnerAssignedPhone;
  int? service;
  String? serviceName;
  int? requestedBy;
  String? source;
  Null? contactEffort;
  String? actionScheduledOn;
  int? serviceFee;
  int? discount;
  Null? discountDescription;
  int? status;
  Null? additionalData;
  String? contactType;
  int? type;
  bool? smsNotificationSend;
  int? balance;
  String? extraInfo;
  String? statusDescription;
  Null? magicLink;
  Null? completedOn;
  ExtraData? extraData;

  Services(
      {this.id,
      this.identifier,
      this.dateCreated,
      this.createdBy,
      this.preferredPartner,
      this.partnerAssigned,
      this.preferredPartnerName,
      this.partnerAssignedName,
      this.partnerAssignedEmail,
      this.partnerAssignedPhone,
      this.service,
      this.serviceName,
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
      this.magicLink,
      this.completedOn,
      this.extraData});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    identifier = json['identifier'];
    dateCreated = json['date_created'];
    createdBy = json['created_by'];
    preferredPartner = json['preferred_partner'];
    partnerAssigned = json['partner_assigned'];
    preferredPartnerName = json['preferred_partner_name'];
    partnerAssignedName = json['partner_assigned_name'];
    partnerAssignedEmail = json['partner_assigned_email'];
    partnerAssignedPhone = json['partner_assigned_phone'];
    service = json['service'];
    serviceName = json['service_name'];
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
    magicLink = json['magic_link'];
    completedOn = json['completed_on'];
    extraData = json['extra_data'] != null
        ? ExtraData.fromJson(json['extra_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['identifier'] = identifier;
    data['date_created'] = dateCreated;
    data['created_by'] = createdBy;
    data['preferred_partner'] = preferredPartner;
    data['partner_assigned'] = partnerAssigned;
    data['preferred_partner_name'] = preferredPartnerName;
    data['partner_assigned_name'] = partnerAssignedName;
    data['partner_assigned_email'] = partnerAssignedEmail;
    data['partner_assigned_phone'] = partnerAssignedPhone;
    data['service'] = service;
    data['service_name'] = serviceName;
    data['requested_by'] = requestedBy;
    data['source'] = source;
    data['contact_effort'] = contactEffort;
    data['action_scheduled_on'] = actionScheduledOn;
    data['service_fee'] = serviceFee;
    data['discount'] = discount;
    data['discount_description'] = discountDescription;
    data['status'] = status;
    data['additional_data'] = additionalData;
    data['contact_type'] = contactType;
    data['type'] = type;
    data['sms_notification_send'] = smsNotificationSend;
    data['balance'] = balance;
    data['extra_info'] = extraInfo;
    data['status_description'] = statusDescription;
    data['magic_link'] = magicLink;
    data['completed_on'] = completedOn;
    if (extraData != null) {
      data['extra_data'] = extraData!.toJson();
    }
    return data;
  }
}

class ExtraData {
  int? taxPreparerId;
  String? taxPreparerName;
  String? taxPreparerPhone;
  List<DocTypes>? docTypes;
  String? lastUpdatedBy;
  String? createdBy;
  String? filingStatus;
  int? taxYear;
  String? taxForm;
  String? statusDate;
  String? refundStatus;
  String? returnStatus;
  String? refundValue;
  String? adjustedGrossIncome;
  String? serviceIdentifier;
  String? notes;

  ExtraData(
      {this.taxPreparerId,
      this.taxPreparerName,
      this.taxPreparerPhone,
      this.docTypes,
      this.lastUpdatedBy,
      this.createdBy,
      this.filingStatus,
      this.taxYear,
      this.taxForm,
      this.statusDate,
      this.refundStatus,
      this.returnStatus,
      this.refundValue,
      this.adjustedGrossIncome,
      this.serviceIdentifier,
      this.notes});

  ExtraData.fromJson(Map<String, dynamic> json) {
    taxPreparerId = json['tax_preparer_id'];
    taxPreparerName = json['tax_preparer_name'];
    taxPreparerPhone = json['tax_preparer_phone'];
    if (json['doc_types'] != null) {
      docTypes = <DocTypes>[];
      json['doc_types'].forEach((v) {
        docTypes!.add(DocTypes.fromJson(v));
      });
    }
    lastUpdatedBy = json['last_updated_by'];
    createdBy = json['created_by'];
    filingStatus = json['filing_status'];
    taxYear = json['tax_year'];
    taxForm = json['tax_form'];
    statusDate = json['status_date'];
    refundStatus = json['refund_status'];
    returnStatus = json['return_status'];
    refundValue = json['refund_value'];
    adjustedGrossIncome = json['adjusted_gross_income'];
    serviceIdentifier = json['service_identifier'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tax_preparer_id'] = taxPreparerId;
    data['tax_preparer_name'] = taxPreparerName;
    data['tax_preparer_phone'] = taxPreparerPhone;
    if (docTypes != null) {
      data['doc_types'] = docTypes!.map((v) => v.toJson()).toList();
    }
    data['last_updated_by'] = lastUpdatedBy;
    data['created_by'] = createdBy;
    data['filing_status'] = filingStatus;
    data['tax_year'] = taxYear;
    data['tax_form'] = taxForm;
    data['status_date'] = statusDate;
    data['refund_status'] = refundStatus;
    data['return_status'] = returnStatus;
    data['refund_value'] = refundValue;
    data['adjusted_gross_income'] = adjustedGrossIncome;
    data['service_identifier'] = serviceIdentifier;
    data['notes'] = notes;
    return data;
  }
}

class DocTypes {
  String? name;
  bool? userAllowed;
  String? description;
  String? url;
  int? id;

  DocTypes({this.name, this.userAllowed, this.description, this.url, this.id});

  DocTypes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    userAllowed = json['user_allowed'];
    description = json['description'];
    url = json['url'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['user_allowed'] = userAllowed;
    data['description'] = description;
    data['url'] = url;
    data['id'] = id;
    return data;
  }
}
