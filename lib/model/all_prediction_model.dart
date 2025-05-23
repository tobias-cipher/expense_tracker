class AllPredictionModel {
  bool? success;
  String? message;
  List<Data>? data;

  AllPredictionModel({this.success, this.message, this.data});

  AllPredictionModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? tag;
  int? value;

  Data({this.tag, this.value});

  Data.fromJson(Map<String, dynamic> json) {
    tag = json['tag'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tag'] = this.tag;
    data['value'] = this.value;
    return data;
  }
}
