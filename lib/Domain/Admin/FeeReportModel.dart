class FeeCollectionReportDetails {
  List<AllFeeCollect>? allFeeCollect;
  // List<Null>? generalFeeCollect;
  // List<Null>? busFeeCollect;
  double? generalTotal;
  double? busTotal;
  double? allTotal;

  FeeCollectionReportDetails(
      {this.allFeeCollect,
      // this.generalFeeCollect,
      // this.busFeeCollect,
      this.generalTotal,
      this.busTotal,
      this.allTotal});

  FeeCollectionReportDetails.fromJson(Map<String, dynamic> json) {
    if (json['allFeeCollect'] != null) {
      allFeeCollect = <AllFeeCollect>[];
      json['allFeeCollect'].forEach((v) {
        allFeeCollect!.add(new AllFeeCollect.fromJson(v));
      });
    }
    // if (json['generalFeeCollect'] != null) {
    //   generalFeeCollect = <Null>[];
    //   json['generalFeeCollect'].forEach((v) {
    //     generalFeeCollect!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['busFeeCollect'] != null) {
    //   busFeeCollect = <Null>[];
    //   json['busFeeCollect'].forEach((v) {
    //     busFeeCollect!.add(new Null.fromJson(v));
    //   });
    // }
    generalTotal = json['generalTotal'];
    busTotal = json['busTotal'];
    allTotal = json['allTotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allFeeCollect != null) {
      data['allFeeCollect'] =
          this.allFeeCollect!.map((v) => v.toJson()).toList();
    }
    // if (this.generalFeeCollect != null) {
    //   data['generalFeeCollect'] =
    //       this.generalFeeCollect!.map((v) => v.toJson()).toList();
    // }
    // if (this.busFeeCollect != null) {
    //   data['busFeeCollect'] =
    //       this.busFeeCollect!.map((v) => v.toJson()).toList();
    // }
    data['generalTotal'] = this.generalTotal;
    data['busTotal'] = this.busTotal;
    data['allTotal'] = this.allTotal;
    return data;
  }
}

class AllFeeCollect {
  String? feeCollectionId;
  String? busFeeCollectionId;
  int? id;
  String? studentId;
  String? admissionNo;
  String? name;
  String? course;
  String? division;
  double? remittedFees;
  String? remittedDate;

  AllFeeCollect(
      {this.feeCollectionId,
      this.busFeeCollectionId,
      this.id,
      this.studentId,
      this.admissionNo,
      this.name,
      this.course,
      this.division,
      this.remittedFees,
      this.remittedDate});

  AllFeeCollect.fromJson(Map<String, dynamic> json) {
    feeCollectionId = json['feeCollectionId'];
    busFeeCollectionId = json['busFeeCollectionId'];
    id = json['id'];
    studentId = json['studentId'];
    admissionNo = json['admissionNo'];
    name = json['name'];
    course = json['course'];
    division = json['division'];
    remittedFees = json['remittedFees'];
    remittedDate = json['remittedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['feeCollectionId'] = this.feeCollectionId;
    data['busFeeCollectionId'] = this.busFeeCollectionId;
    data['id'] = this.id;
    data['studentId'] = this.studentId;
    data['admissionNo'] = this.admissionNo;
    data['name'] = this.name;
    data['course'] = this.course;
    data['division'] = this.division;
    data['remittedFees'] = this.remittedFees;
    data['remittedDate'] = this.remittedDate;
    return data;
  }
}
