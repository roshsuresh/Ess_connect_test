import 'dart:convert';

 class FeesModel {
  FeesModel({
    this.allowPartialPayment,
    this.concessionCaption,
    this.feeFeesInstallments,
    this.feeBusInstallments,
  });

  bool? allowPartialPayment;
  dynamic concessionCaption;
  List<FeesInstallment>? feeFeesInstallments;
  List<FeesInstallment>? feeBusInstallments;

  factory FeesModel.fromJson(Map<String, dynamic> json) => FeesModel(
    allowPartialPayment: json["allowPartialPayment"],
    concessionCaption: json["concessionCaption"],
    feeFeesInstallments: List<FeesInstallment>.from(json["feeFeesInstallments"].map((x) => FeesInstallment.fromJson(x))),
    feeBusInstallments: List<FeesInstallment>.from(json["feeBusInstallments"].map((x) => FeesInstallment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "allowPartialPayment": allowPartialPayment,
    "concessionCaption": concessionCaption,
    "feeFeesInstallments": List<dynamic>.from(feeFeesInstallments!.map((x) => x.toJson())),
    "feeBusInstallments": List<dynamic>.from(feeBusInstallments!.map((x) => x.toJson())),
  };
}

class FeesInstallment {
  FeesInstallment({
    this.feesDetailsId,
    required this.installmentName,
    this.installmentNetDue,
    required this.netDue,
    this.fineAmount,
    this.balanceAmount,
    this.checkedInstallment,
    this.enableInstallment,
    this.checkedFees,
    this.totalPaidAmount,
    this.installmentOrder,
    this.concessionAmount,
  });

  String? feesDetailsId;
  String installmentName;
  double? installmentNetDue;
  double netDue;
  double? fineAmount;
  double? balanceAmount;
  bool? checkedInstallment;
  bool? enableInstallment;
  bool? checkedFees;
  double? totalPaidAmount;
  int? installmentOrder;
  double?  concessionAmount;

  factory FeesInstallment.fromJson(Map<String, dynamic> json) => FeesInstallment(
    feesDetailsId: json["feesDetailsId"],
    installmentName: json["installmentName"],
    installmentNetDue: json["installmentNetDue"].toDouble(),
    netDue: json["netDue"].toDouble(),
    fineAmount: json["fineAmount"].toDouble(),
    balanceAmount: json["balanceAmount"].toDouble(),
    checkedInstallment: json["checkedInstallment"],
    enableInstallment: json["enableInstallment"],
    checkedFees: json["checkedFees"],
    totalPaidAmount: json["totalPaidAmount"].toDouble(),
    installmentOrder: json["installmentOrder"],
    concessionAmount: json["concessionAmount"] == null ? null : json["concessionAmount"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "feesDetailsId": feesDetailsId,
    "installmentName": installmentName,
    "installmentNetDue": installmentNetDue,
    "netDue": netDue,
    "fineAmount": fineAmount,
    "balanceAmount": balanceAmount,
    "checkedInstallment": checkedInstallment,
    "enableInstallment": enableInstallment,
    "checkedFees": checkedFees,
    "totalPaidAmount": totalPaidAmount,
    "installmentOrder": installmentOrder,
    "concessionAmount": concessionAmount == null ? null : concessionAmount,
  };
}
