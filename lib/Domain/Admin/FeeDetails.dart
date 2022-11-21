class StudentFeeDetailsAdmin {
  double? allPaidAmount;
  double? allTotalDueInstallmentDue;
  double? allTotalDueConcessionAmount;
  double? allTotalDueFineAmount;
  double? allTotalDueNetDueAmount;
  double? allTotalDuePaidAmount;

  List<StudentGeneralFeePaidTotal>? studentGeneralFeePaidTotal;
  List<StudentBusFeePaidTotal>? studentBusFeePaidTotal;
  List<StudentGeneralFeeDueTotal>? studentGeneralFeeDueTotal;
  List<StudentBusFeeDueTotal>? studentBusFeeDueTotal;

  StudentFeeDetailsAdmin(
      {this.allPaidAmount,
      this.allTotalDueInstallmentDue,
      this.allTotalDueConcessionAmount,
      this.allTotalDueFineAmount,
      this.allTotalDueNetDueAmount,
      this.allTotalDuePaidAmount,
      this.studentGeneralFeePaidTotal,
      this.studentBusFeePaidTotal,
      this.studentGeneralFeeDueTotal,
      this.studentBusFeeDueTotal});

  StudentFeeDetailsAdmin.fromJson(Map<String, dynamic> json) {
    allPaidAmount = json['allPaidAmount'];
    allTotalDueInstallmentDue = json['allTotalDueInstallmentDue'];
    allTotalDueConcessionAmount = json['allTotalDueConcessionAmount'];
    allTotalDueFineAmount = json['allTotalDueFineAmount'];
    allTotalDueNetDueAmount = json['allTotalDueNetDueAmount'];
    allTotalDuePaidAmount = json['allTotalDuePaidAmount'];

    if (json['studentGeneralFeePaidTotal'] != null) {
      studentGeneralFeePaidTotal = <StudentGeneralFeePaidTotal>[];
      json['studentGeneralFeePaidTotal'].forEach((v) {
        studentGeneralFeePaidTotal!.add(StudentGeneralFeePaidTotal.fromJson(v));
      });
    }
    if (json['studentBusFeePaidTotal'] != null) {
      studentBusFeePaidTotal = <StudentBusFeePaidTotal>[];
      json['studentBusFeePaidTotal'].forEach((v) {
        studentBusFeePaidTotal!.add(StudentBusFeePaidTotal.fromJson(v));
      });
    }
    if (json['studentGeneralFeeDueTotal'] != null) {
      studentGeneralFeeDueTotal = <StudentGeneralFeeDueTotal>[];
      json['studentGeneralFeeDueTotal'].forEach((v) {
        studentGeneralFeeDueTotal!.add(StudentGeneralFeeDueTotal.fromJson(v));
      });
    }
    if (json['studentBusFeeDueTotal'] != null) {
      studentBusFeeDueTotal = <StudentBusFeeDueTotal>[];
      json['studentBusFeeDueTotal'].forEach((v) {
        studentBusFeeDueTotal!.add(StudentBusFeeDueTotal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['allPaidAmount'] = allPaidAmount;
    data['allTotalDueInstallmentDue'] = allTotalDueInstallmentDue;
    data['allTotalDueConcessionAmount'] = allTotalDueConcessionAmount;
    data['allTotalDueFineAmount'] = allTotalDueFineAmount;
    data['allTotalDueNetDueAmount'] = allTotalDueNetDueAmount;
    data['allTotalDuePaidAmount'] = allTotalDuePaidAmount;

    if (studentGeneralFeePaidTotal != null) {
      data['studentGeneralFeePaidTotal'] =
          studentGeneralFeePaidTotal!.map((v) => v.toJson()).toList();
    }
    if (studentBusFeePaidTotal != null) {
      data['studentBusFeePaidTotal'] =
          studentBusFeePaidTotal!.map((v) => v.toJson()).toList();
    }
    if (studentGeneralFeeDueTotal != null) {
      data['studentGeneralFeeDueTotal'] =
          studentGeneralFeeDueTotal!.map((v) => v.toJson()).toList();
    }
    if (studentBusFeeDueTotal != null) {
      data['studentBusFeeDueTotal'] =
          studentBusFeeDueTotal!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StudentGeneralFeePaidTotal {
  String? transactionId;
  String? billDate;
  double? paidAmount;
  double? totalPaidAmount;
  List<SchoolFees>? schoolFees;

  StudentGeneralFeePaidTotal(
      {this.transactionId,
      this.billDate,
      this.paidAmount,
      this.totalPaidAmount,
      this.schoolFees});

  StudentGeneralFeePaidTotal.fromJson(Map<String, dynamic> json) {
    transactionId = json['transactionId'];
    billDate = json['billDate'];
    paidAmount = json['paidAmount'];
    totalPaidAmount = json['totalPaidAmount'];
    if (json['schoolFees'] != null) {
      schoolFees = <SchoolFees>[];
      json['schoolFees'].forEach((v) {
        schoolFees!.add(new SchoolFees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transactionId'] = this.transactionId;
    data['billDate'] = this.billDate;
    data['paidAmount'] = this.paidAmount;
    data['totalPaidAmount'] = this.totalPaidAmount;
    if (this.schoolFees != null) {
      data['schoolFees'] = this.schoolFees!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SchoolFees {
  String? installmentname;
  double? dueAmount;
  double? concessionAmount;
  double? fineAmount;
  double? paidAmount;
  double? transactionId;
  String? billDate;
  double? totalPaidAmount;

  SchoolFees(
      {this.installmentname,
      this.dueAmount,
      this.concessionAmount,
      this.fineAmount,
      this.paidAmount,
      this.transactionId,
      this.billDate,
      this.totalPaidAmount});

  SchoolFees.fromJson(Map<String, dynamic> json) {
    installmentname = json['installmentname'];
    dueAmount = json['dueAmount'];
    concessionAmount = json['concessionAmount'];
    fineAmount = json['fineAmount'];
    paidAmount = json['paidAmount'];
    transactionId = json['transactionId'];
    billDate = json['billDate'];
    totalPaidAmount = json['totalPaidAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['installmentname'] = this.installmentname;
    data['dueAmount'] = this.dueAmount;
    data['concessionAmount'] = this.concessionAmount;
    data['fineAmount'] = this.fineAmount;
    data['paidAmount'] = this.paidAmount;
    data['transactionId'] = this.transactionId;
    data['billDate'] = this.billDate;
    data['totalPaidAmount'] = this.totalPaidAmount;
    return data;
  }
}

class StudentBusFeePaidTotal {
  String? transactionId;
  String? billDate;
  double? paidAmount;
  double? totalPaidAmount;
  List<BusFees>? busFees;

  StudentBusFeePaidTotal(
      {this.transactionId,
      this.billDate,
      this.paidAmount,
      this.totalPaidAmount,
      this.busFees});

  StudentBusFeePaidTotal.fromJson(Map<String, dynamic> json) {
    transactionId = json['transactionId'];
    billDate = json['billDate'];
    paidAmount = json['paidAmount'];
    totalPaidAmount = json['totalPaidAmount'];
    if (json['busFees'] != null) {
      busFees = <BusFees>[];
      json['busFees'].forEach((v) {
        busFees!.add(new BusFees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transactionId'] = this.transactionId;
    data['billDate'] = this.billDate;
    data['paidAmount'] = this.paidAmount;
    data['totalPaidAmount'] = this.totalPaidAmount;
    if (this.busFees != null) {
      data['busFees'] = this.busFees!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BusFees {
  String? installmentname;
  double? dueAmount;
  double? fineAmount;
  double? paidAmount;
  int? transactionId;
  String? billDate;
  double? totalPaidAmount;

  BusFees(
      {this.installmentname,
      this.dueAmount,
      this.fineAmount,
      this.paidAmount,
      this.transactionId,
      this.billDate,
      this.totalPaidAmount});

  BusFees.fromJson(Map<String, dynamic> json) {
    installmentname = json['installmentname'];
    dueAmount = json['dueAmount'];
    fineAmount = json['fineAmount'];
    paidAmount = json['paidAmount'];
    transactionId = json['transactionId'];
    billDate = json['billDate'];
    totalPaidAmount = json['totalPaidAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['installmentname'] = this.installmentname;
    data['dueAmount'] = this.dueAmount;
    data['fineAmount'] = this.fineAmount;
    data['paidAmount'] = this.paidAmount;
    data['transactionId'] = this.transactionId;
    data['billDate'] = this.billDate;
    data['totalPaidAmount'] = this.totalPaidAmount;
    return data;
  }
}

class StudentGeneralFeeDueTotal {
  String? installmentName;
  double? installmentNetDue;
  double? concessionAmount;
  double? fineAmount;
  double? netDue;
  double? paidAmount;
  double? totalInstallmentDue;
  double? totalConcessionAmount;
  double? totalFineAmount;
  double? totalNetDueAmount;
  double? totalPaidAmount;

  StudentGeneralFeeDueTotal(
      {this.installmentName,
      this.installmentNetDue,
      this.concessionAmount,
      this.fineAmount,
      this.netDue,
      this.paidAmount,
      this.totalInstallmentDue,
      this.totalConcessionAmount,
      this.totalFineAmount,
      this.totalNetDueAmount,
      this.totalPaidAmount});

  StudentGeneralFeeDueTotal.fromJson(Map<String, dynamic> json) {
    installmentName = json['installmentName'];
    installmentNetDue = json['installmentNetDue'];
    concessionAmount = json['concessionAmount'];
    fineAmount = json['fineAmount'];
    netDue = json['netDue'];
    paidAmount = json['paidAmount'];
    totalInstallmentDue = json['totalInstallmentDue'];
    totalConcessionAmount = json['totalConcessionAmount'];
    totalFineAmount = json['totalFineAmount'];
    totalNetDueAmount = json['totalNetDueAmount'];
    totalPaidAmount = json['totalPaidAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['installmentName'] = this.installmentName;
    data['installmentNetDue'] = this.installmentNetDue;
    data['concessionAmount'] = this.concessionAmount;
    data['fineAmount'] = this.fineAmount;
    data['netDue'] = this.netDue;
    data['paidAmount'] = this.paidAmount;
    data['totalInstallmentDue'] = this.totalInstallmentDue;
    data['totalConcessionAmount'] = this.totalConcessionAmount;
    data['totalFineAmount'] = this.totalFineAmount;
    data['totalNetDueAmount'] = this.totalNetDueAmount;
    data['totalPaidAmount'] = this.totalPaidAmount;
    return data;
  }
}

class StudentBusFeeDueTotal {
  String? installmentName;
  double? installmentNetDue;
  double? fineAmount;
  double? netDue;
  double? paidAmount;
  double? totalInstallmentDue;
  double? totalConcessionAmount;
  double? totalFineAmount;
  double? totalNetDueAmount;
  double? totalPaidAmount;

  StudentBusFeeDueTotal(
      {this.installmentName,
      this.installmentNetDue,
      this.fineAmount,
      this.netDue,
      this.paidAmount,
      this.totalInstallmentDue,
      this.totalConcessionAmount,
      this.totalFineAmount,
      this.totalNetDueAmount,
      this.totalPaidAmount});

  StudentBusFeeDueTotal.fromJson(Map<String, dynamic> json) {
    installmentName = json['installmentName'];
    installmentNetDue = json['installmentNetDue'];
    fineAmount = json['fineAmount'];
    netDue = json['netDue'];
    paidAmount = json['paidAmount'];
    totalInstallmentDue = json['totalInstallmentDue'];
    totalConcessionAmount = json['totalConcessionAmount'];
    totalFineAmount = json['totalFineAmount'];
    totalNetDueAmount = json['totalNetDueAmount'];
    totalPaidAmount = json['totalPaidAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['installmentName'] = this.installmentName;
    data['installmentNetDue'] = this.installmentNetDue;
    data['fineAmount'] = this.fineAmount;
    data['netDue'] = this.netDue;
    data['paidAmount'] = this.paidAmount;
    data['totalInstallmentDue'] = this.totalInstallmentDue;
    data['totalConcessionAmount'] = this.totalConcessionAmount;
    data['totalFineAmount'] = this.totalFineAmount;
    data['totalNetDueAmount'] = this.totalNetDueAmount;
    data['totalPaidAmount'] = this.totalPaidAmount;
    return data;
  }
}
