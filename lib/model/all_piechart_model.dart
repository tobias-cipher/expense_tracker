class AllPieChartModel {
  bool? success;
  String? message;
  List<Data>? data;

  AllPieChartModel({this.success, this.message, this.data});

  AllPieChartModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
  
}

class Data {
  Map<String, String>? categories;

  Data({this.categories});

  Data.fromJson(Map<String, dynamic> json) {
    categories = json.map((key, value) => MapEntry(key, value.toString()));
  }
}
