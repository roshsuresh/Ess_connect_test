class FeeDetailsAdmin {
  FeeCollectionPopupDetails? feeCollectionPopupDetails;

  FeeDetailsAdmin({this.feeCollectionPopupDetails});

  FeeDetailsAdmin.fromJson(Map<String, dynamic> json) {
    feeCollectionPopupDetails = json['feeCollectionPopupDetails'] != null
        ? FeeCollectionPopupDetails.fromJson(json['feeCollectionPopupDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (feeCollectionPopupDetails != null) {
      data['feeCollectionPopupDetails'] =
          this.feeCollectionPopupDetails!.toJson();
    }
    return data;
  }
}

class FeeCollectionPopupDetails {
  String? totalpaid;
  StudentAllDetails? studentAllDetails;
  List<GeneralCollectDetails>? generalCollectDetails;
  List<BusCollectDetails>? busCollectDetails;
  FeeCollectionPopupDetails(
      {this.totalpaid,
      this.studentAllDetails,
      this.generalCollectDetails,
      this.busCollectDetails});

  FeeCollectionPopupDetails.fromJson(Map<String, dynamic> json) {
    totalpaid = json['totalpaid'];
    studentAllDetails = json['studentAllDetails'] != null
        ? StudentAllDetails.fromJson(json['studentAllDetails'])
        : null;
    if (json['generalCollectDetails'] != null) {
      generalCollectDetails = <GeneralCollectDetails>[];
      json['generalCollectDetails'].forEach((v) {
        generalCollectDetails!.add(GeneralCollectDetails.fromJson(v));
      });
    }
    if (json['busCollectDetails'] != null) {
      busCollectDetails = <BusCollectDetails>[];
      json['busCollectDetails'].forEach((v) {
        busCollectDetails!.add(BusCollectDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['totalpaid'] = this.totalpaid;
    if (this.studentAllDetails != null) {
      data['studentAllDetails'] = this.studentAllDetails!.toJson();
    }
    if (this.generalCollectDetails != null) {
      data['generalCollectDetails'] =
          this.generalCollectDetails!.map((v) => v.toJson()).toList();
    }
    if (this.busCollectDetails != null) {
      data['busCollectDetails'] =
          this.busCollectDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StudentAllDetails {
  String? feeCollectionId;
  String? busFeeCollectionId;
  String? admissionNo;
  String? name;
  String? division;
  String? orderId;
  String? transactionId;
  String? transactionDate;
  String? studentId;

  StudentAllDetails(
      {this.feeCollectionId,
      this.busFeeCollectionId,
      this.admissionNo,
      this.name,
      this.division,
      this.orderId,
      this.transactionId,
      this.transactionDate,
      this.studentId});

  StudentAllDetails.fromJson(Map<String, dynamic> json) {
    feeCollectionId = json['feeCollectionId'];
    busFeeCollectionId = json['busFeeCollectionId'];
    admissionNo = json['admissionNo'];
    name = json['name'];
    division = json['division'];
    orderId = json['orderId'];
    transactionId = json['transactionId'];
    transactionDate = json['transactionDate'];
    studentId = json['studentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['feeCollectionId'] = this.feeCollectionId;
    data['busFeeCollectionId'] = this.busFeeCollectionId;
    data['admissionNo'] = this.admissionNo;
    data['name'] = this.name;
    data['division'] = this.division;
    data['orderId'] = this.orderId;
    data['transactionId'] = this.transactionId;
    data['transactionDate'] = this.transactionDate;
    data['studentId'] = this.studentId;
    return data;
  }
}

class GeneralCollectDetails {
  String? feeCollectionId;
  String? busFeeCollectionId;
  String? dueAmount;
  double? concessionAmount;
  double? fineAmount;
  double? netDue;
  double? paidAmount;
  String? installmentname;

  GeneralCollectDetails(
      {this.feeCollectionId,
      this.busFeeCollectionId,
      this.dueAmount,
      this.concessionAmount,
      this.fineAmount,
      this.netDue,
      this.paidAmount,
      this.installmentname});

  GeneralCollectDetails.fromJson(Map<String, dynamic> json) {
    feeCollectionId = json['feeCollectionId'];
    busFeeCollectionId = json['busFeeCollectionId'];
    dueAmount = json['dueAmount'];
    concessionAmount = json['concessionAmount'];
    fineAmount = json['fineAmount'];
    netDue = json['netDue'];
    paidAmount = json['paidAmount'];
    installmentname = json['installmentname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['feeCollectionId'] = this.feeCollectionId;
    data['busFeeCollectionId'] = this.busFeeCollectionId;
    data['dueAmount'] = this.dueAmount;
    data['concessionAmount'] = this.concessionAmount;
    data['fineAmount'] = this.fineAmount;
    data['netDue'] = this.netDue;
    data['paidAmount'] = this.paidAmount;
    data['installmentname'] = this.installmentname;
    return data;
  }
}

class BusCollectDetails {
  String? feeCollectionId;
  String? busFeeCollectionId;
  String? dueAmount;
  double? netDue;
  double? paidAmount;
  String? installmentname;
  double? concessionAmount;
  double? fineAmount;

  BusCollectDetails(
      {this.feeCollectionId,
      this.busFeeCollectionId,
      this.dueAmount,
      this.netDue,
      this.paidAmount,
      this.installmentname,
      this.concessionAmount,
      this.fineAmount});

  BusCollectDetails.fromJson(Map<String, dynamic> json) {
    feeCollectionId = json['feeCollectionId'];
    busFeeCollectionId = json['busFeeCollectionId'];
    dueAmount = json['dueAmount'];
    netDue = json['netDue'];
    paidAmount = json['paidAmount'];
    installmentname = json['installmentname'];
    concessionAmount = json['concessionAmount'];
    fineAmount = json['fineAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['feeCollectionId'] = this.feeCollectionId;
    data['busFeeCollectionId'] = this.busFeeCollectionId;
    data['dueAmount'] = this.dueAmount;
    data['netDue'] = this.netDue;
    data['paidAmount'] = this.paidAmount;
    data['installmentname'] = this.installmentname;
    data['concessionAmount'] = this.concessionAmount;
    data['fineAmount'] = this.fineAmount;
    return data;
  }
}
