class OnlineFeePaymentHistoryDetails {
  int? id;
  String? billDate;
  String? paymentMode;
  String? paymentGateWay;
  String? orderNo;
  String? transactionId;
  double? billAmount;
  int? orderId;

  OnlineFeePaymentHistoryDetails(
      {this.id,
      this.billDate,
      this.paymentMode,
      this.paymentGateWay,
      this.orderNo,
      this.transactionId,
      this.billAmount,
      this.orderId});

  OnlineFeePaymentHistoryDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    billDate = json['billDate'];
    paymentMode = json['paymentMode'];
    paymentGateWay = json['paymentGateWay'];
    orderNo = json['orderNo'];
    transactionId = json['transactionId'];
    billAmount = json['billAmount'];
    orderId = json['orderId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['billDate'] = this.billDate;
    data['paymentMode'] = this.paymentMode;
    data['paymentGateWay'] = this.paymentGateWay;
    data['orderNo'] = this.orderNo;
    data['transactionId'] = this.transactionId;
    data['billAmount'] = this.billAmount;
    data['orderId'] = this.orderId;
    return data;
  }
}

//attachment
class FeeHistoryAttachment {
  String? name;
  String? extension;
  String? path;
  String? url;
  bool? isTemporary;
  bool? isDeleted;

  String? createdAt;
  String? id;

  FeeHistoryAttachment(
      {this.name,
      this.extension,
      this.path,
      this.url,
      this.isTemporary,
      this.isDeleted,
      this.createdAt,
      this.id});

  FeeHistoryAttachment.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    extension = json['extension'];
    path = json['path'];
    url = json['url'];
    isTemporary = json['isTemporary'];
    isDeleted = json['isDeleted'];

    createdAt = json['createdAt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['extension'] = this.extension;
    data['path'] = this.path;
    data['url'] = this.url;
    data['isTemporary'] = this.isTemporary;
    data['isDeleted'] = this.isDeleted;

    data['createdAt'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
