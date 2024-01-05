class WalletModel {
  int? totalEarnings;
  int? yearToDateEarnings;
  int? totalWithdrawn;
  int? yearToDateTotalWithdrawn;
  int? accountBalance;
  int? defaultMethodId;
  String? defaultMethodName;

  WalletModel(
      {this.totalEarnings,
      this.yearToDateEarnings,
      this.totalWithdrawn,
      this.yearToDateTotalWithdrawn,
      this.accountBalance,
      this.defaultMethodId,
      this.defaultMethodName});

  WalletModel.fromJson(Map<String, dynamic> json) {
    totalEarnings = json['total_earnings'];
    yearToDateEarnings = json['year_to_date_earnings'];
    totalWithdrawn = json['total_withdrawn'];
    yearToDateTotalWithdrawn = json['year_to_date_total_withdrawn'];
    accountBalance = json['account_balance'];
    defaultMethodId = json['default_method_id'];
    defaultMethodName = json['default_method_name'];
  }
}
