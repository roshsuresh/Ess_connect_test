import 'dart:convert';

class OnlineFeePayModel {
  bool? allowPartialPayment;
  String? concessionCaption;
  List<FeeFeesInstallments>? feeFeesInstallments;
  List<FeeBusInstallments>? feeBusInstallments;

  OnlineFeePayModel(
      {this.allowPartialPayment,
      this.concessionCaption,
      this.feeFeesInstallments,
      this.feeBusInstallments});

  OnlineFeePayModel.fromJson(Map<String, dynamic> json) {
    allowPartialPayment = json['allowPartialPayment'];
    concessionCaption = json['concessionCaption'];
    if (json['feeFeesInstallments'] != null) {
      feeFeesInstallments = [];
      json['feeFeesInstallments'].forEach((v) {
        feeFeesInstallments!.add(new FeeFeesInstallments.fromJson(v));
      });
    }
    if (json['feeBusInstallments'] != null) {
      feeBusInstallments = [];
      json['feeBusInstallments'].forEach((v) {
        feeBusInstallments!.add(new FeeBusInstallments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['allowPartialPayment'] = this.allowPartialPayment;
    data['concessionCaption'] = this.concessionCaption;
    if (this.feeFeesInstallments != null) {
      data['feeFeesInstallments'] =
          this.feeFeesInstallments!.map((v) => v.toJson()).toList();
    }
    if (this.feeBusInstallments != null) {
      data['feeBusInstallments'] =
          this.feeBusInstallments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FeeFeesInstallments {
  String? feesDetailsId;
  String? installmentName;
  double? installmentNetDue;
  double? concessionAmount;
  double? netDue;
  double? fineAmount;
  double? balanceAmount;
  bool? checkedInstallment;
  bool? enableInstallment;
  bool? checkedFees;
  double? totalPaidAmount;
  int? installmentOrder;

  FeeFeesInstallments(
      {this.feesDetailsId,
      this.installmentName,
      this.installmentNetDue,
      this.concessionAmount,
      this.netDue,
      this.fineAmount,
      this.balanceAmount,
      this.checkedInstallment,
      this.enableInstallment,
      this.checkedFees,
      this.totalPaidAmount,
      this.installmentOrder});

  FeeFeesInstallments.fromJson(Map<String, dynamic> json) {
    feesDetailsId = json['feesDetailsId'];
    installmentName = json['installmentName'];
    installmentNetDue = json['installmentNetDue'];
    concessionAmount = json['concessionAmount'];
    netDue = json['netDue'];
    fineAmount = json['fineAmount'];
    balanceAmount = json['balanceAmount'];
    checkedInstallment = json['checkedInstallment'];
    enableInstallment = json['enableInstallment'];
    checkedFees = json['checkedFees'];
    totalPaidAmount = json['totalPaidAmount'];
    installmentOrder = json['installmentOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['feesDetailsId'] = this.feesDetailsId;
    data['installmentName'] = this.installmentName;
    data['installmentNetDue'] = this.installmentNetDue;
    data['concessionAmount'] = this.concessionAmount;
    data['netDue'] = this.netDue;
    data['fineAmount'] = this.fineAmount;
    data['balanceAmount'] = this.balanceAmount;
    data['checkedInstallment'] = this.checkedInstallment;
    data['enableInstallment'] = this.enableInstallment;
    data['checkedFees'] = this.checkedFees;
    data['totalPaidAmount'] = this.totalPaidAmount;
    data['installmentOrder'] = this.installmentOrder;
    return data;
  }

  void addAll(List<FeeFeesInstallments> templist) {}
}

class FeeBusInstallments {
  String? feesDetailsId;
  String? installmentName;
  double? installmentNetDue;
  double? netDue;
  double? fineAmount;
  double? balanceAmount;
  bool? checkedInstallment;
  bool? enableInstallment;
  bool? checkedFees;
  double? totalPaidAmount;
  int? installmentOrder;

  FeeBusInstallments(
      {this.feesDetailsId,
      this.installmentName,
      this.installmentNetDue,
      this.netDue,
      this.fineAmount,
      this.balanceAmount,
      this.checkedInstallment,
      this.enableInstallment,
      this.checkedFees,
      this.totalPaidAmount,
      this.installmentOrder});

  FeeBusInstallments.fromJson(Map<String, dynamic> json) {
    feesDetailsId = json['feesDetailsId'];
    installmentName = json['installmentName'];
    installmentNetDue = json['installmentNetDue'];
    netDue = json['netDue'];
    fineAmount = json['fineAmount'];
    balanceAmount = json['balanceAmount'];
    checkedInstallment = json['checkedInstallment'];
    enableInstallment = json['enableInstallment'];
    checkedFees = json['checkedFees'];
    totalPaidAmount = json['totalPaidAmount'];
    installmentOrder = json['installmentOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['feesDetailsId'] = this.feesDetailsId;
    data['installmentName'] = this.installmentName;
    data['installmentNetDue'] = this.installmentNetDue;
    data['netDue'] = this.netDue;
    data['fineAmount'] = this.fineAmount;
    data['balanceAmount'] = this.balanceAmount;
    data['checkedInstallment'] = this.checkedInstallment;
    data['enableInstallment'] = this.enableInstallment;
    data['checkedFees'] = this.checkedFees;
    data['totalPaidAmount'] = this.totalPaidAmount;
    data['installmentOrder'] = this.installmentOrder;
    return data;
  }
}
