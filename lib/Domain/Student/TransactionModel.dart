class TransactionModel {
  String? requestType;
  String? mid;
  String? websiteName;
  String? orderId;
  String? callbackUrl;
  TxnAmount? txnAmount;
  UserInfo? userInfo;
  bool? isStaging;
  bool? success;
  String? txnToken;

  TransactionModel(
      {this.requestType,
      this.mid,
      this.websiteName,
      this.orderId,
      this.callbackUrl,
      this.txnAmount,
      this.userInfo,
      this.isStaging,
      this.success,
      this.txnToken});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    requestType = json['requestType'];
    mid = json['mid'];
    websiteName = json['websiteName'];
    orderId = json['orderId'];
    callbackUrl = json['callbackUrl'];
    txnAmount = json['txnAmount'] != null
        ? new TxnAmount.fromJson(json['txnAmount'])
        : null;
    userInfo = json['userInfo'] != null
        ? new UserInfo.fromJson(json['userInfo'])
        : null;
    isStaging = json['isStaging'];
    success = json['success'];
    txnToken = json['txnToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['requestType'] = this.requestType;
    data['mid'] = this.mid;
    data['websiteName'] = this.websiteName;
    data['orderId'] = this.orderId;
    data['callbackUrl'] = this.callbackUrl;
    if (this.txnAmount != null) {
      data['txnAmount'] = this.txnAmount!.toJson();
    }
    if (this.userInfo != null) {
      data['userInfo'] = this.userInfo!.toJson();
    }
    data['isStaging'] = this.isStaging;
    data['success'] = this.success;
    data['txnToken'] = this.txnToken;
    return data;
  }
}

class TxnAmount {
  String? value;
  String? currency;

  TxnAmount({this.value, this.currency});

  TxnAmount.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['currency'] = this.currency;
    return data;
  }
}

class UserInfo {
  String? custId;
  String? mobile;
  String? email;

  UserInfo({this.custId, this.mobile, this.email});

  UserInfo.fromJson(Map<String, dynamic> json) {
    custId = json['custId'];
    mobile = json['mobile'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['custId'] = this.custId;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    return data;
  }
}

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////        payment       //////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
class PaytmFinalStatusModel {
  String? orderId;
  String? readableOrderId;
  String? reponseCode;
  String? reponseMsg;
  String? txnId;
  String? paymentMode;

  PaytmFinalStatusModel(
      {this.orderId,
      this.readableOrderId,
      this.reponseCode,
      this.reponseMsg,
      this.txnId,
      this.paymentMode});

  PaytmFinalStatusModel.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    readableOrderId = json['readableOrderId'];
    reponseCode = json['reponseCode'];
    reponseMsg = json['reponseMsg'];
    txnId = json['txnId'];
    paymentMode = json['paymentMode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['readableOrderId'] = this.readableOrderId;
    data['reponseCode'] = this.reponseCode;
    data['reponseMsg'] = this.reponseMsg;
    data['txnId'] = this.txnId;
    data['paymentMode'] = this.paymentMode;
    return data;
  }
}
