class TransactionModel {
  bool? success;
  TransactionData? data;

  TransactionModel({this.success, this.data});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new TransactionData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class TransactionData {
  List<Transactions>? transactions;

  TransactionData({this.transactions});

  TransactionData.fromJson(Map<String, dynamic> json) {
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add(new Transactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.transactions != null) {
      data['transactions'] = this.transactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Transactions {
  String? transactionId;
  String? shopName;
  String? shopLogo;
  String? paymentType;
  String? timestamp;
  int? amountSend;
  int? amountRecieved;

  Transactions(
      {this.transactionId,
        this.shopName,
        this.shopLogo,
        this.paymentType,
        this.timestamp,
        this.amountSend,
        this.amountRecieved});

  Transactions.fromJson(Map<String, dynamic> json) {
    transactionId = json['transaction_id'];
    shopName = json['shop_name'];
    shopLogo = json['shop_logo'];
    paymentType = json['payment_type'];
    timestamp = json['timestamp'];
    amountSend = json['amount_send'];
    amountRecieved = json['amount_recieved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transaction_id'] = this.transactionId;
    data['shop_name'] = this.shopName;
    data['shop_logo'] = this.shopLogo;
    data['payment_type'] = this.paymentType;
    data['timestamp'] = this.timestamp;
    data['amount_send'] = this.amountSend;
    data['amount_recieved'] = this.amountRecieved;
    return data;
  }
}