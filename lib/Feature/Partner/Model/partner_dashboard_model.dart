class PartnerDashboardModel {
  bool? success;
  int? totalCompleted;
  String? totalEarningsCurrent;
  String? totalEarningsYtd;
  int? totalDesk;
  int? totalLobby;
  int? totalExpired;
  int? totalRegister;
  int? totalVerifiedRegister;
  String? moneyRegister;
  int? totalReceivable;
  int? totalStandBy;
  String? moneyReceivable;

  PartnerDashboardModel(
      {this.success,
      this.totalCompleted,
      this.totalEarningsCurrent,
      this.totalEarningsYtd,
      this.totalDesk,
      this.totalLobby,
      this.totalExpired,
      this.totalRegister,
      this.totalVerifiedRegister,
      this.moneyRegister,
      this.totalReceivable,
      this.totalStandBy,
      this.moneyReceivable});

  PartnerDashboardModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    totalCompleted = json['total_completed'];
    totalEarningsCurrent = json['total_earnings_current'];
    totalEarningsYtd = json['total_earnings_ytd'];
    totalDesk = json['total_desk'];
    totalLobby = json['total_lobby'];
    totalExpired = json['total_expired'];
    totalRegister = json['total_register'];
    totalVerifiedRegister = json['total_verified_register'];
    moneyRegister = json['money_register'];
    totalReceivable = json['total_receivable'];
    totalStandBy = json['total_stand_by'];
    moneyReceivable = json['money_receivable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['total_completed'] = totalCompleted;
    data['total_earnings_current'] = totalEarningsCurrent;
    data['total_earnings_ytd'] = totalEarningsYtd;
    data['total_desk'] = totalDesk;
    data['total_lobby'] = totalLobby;
    data['total_expired'] = totalExpired;
    data['total_register'] = totalRegister;
    data['total_verified_register'] = totalVerifiedRegister;
    data['money_register'] = moneyRegister;
    data['total_receivable'] = totalReceivable;
    data['total_stand_by'] = totalStandBy;
    data['money_receivable'] = moneyReceivable;
    return data;
  }
}
