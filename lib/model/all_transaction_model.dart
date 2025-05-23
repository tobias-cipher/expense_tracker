class AllTransactionModel {
  bool? success;
  String? message;
  Data? data;

  AllTransactionModel({this.success, this.message, this.data});

  AllTransactionModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? totalBalance;
  int? totallIncome;
  int? totallExpense;
  List<Transction>? transction;

  Data(
      {this.totalBalance,
      this.totallIncome,
      this.totallExpense,
      this.transction});

  Data.fromJson(Map<String, dynamic> json) {
    totalBalance = json['totalBalance'];
    totallIncome = json['totallIncome'];
    totallExpense = json['totallExpense'];
    if (json['transction'] != null) {
      transction = <Transction>[];
      json['transction'].forEach((v) {
        transction!.add(new Transction.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalBalance'] = this.totalBalance;
    data['totallIncome'] = this.totallIncome;
    data['totallExpense'] = this.totallExpense;
    if (this.transction != null) {
      data['transction'] = this.transction!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Transction {
  String? sId;
  String? tranactionType;
  String? category;
  String? curentDate;
  int? amount;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? user;

  Transction(
      {this.sId,
      this.tranactionType,
      this.category,
      this.curentDate,
      this.amount,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.user});

  Transction.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    tranactionType = json['tranactionType'];
    category = json['category'];
    curentDate = json['curentDate'];
    amount = json['amount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['tranactionType'] = this.tranactionType;
    data['category'] = this.category;
    data['curentDate'] = this.curentDate;
    data['amount'] = this.amount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['user'] = this.user;
    return data;
  }
}
