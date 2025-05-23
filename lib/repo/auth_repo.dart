

import '../api_network/network_api.dart';

class AuthRepo {
  final _apiService = NetworkApiService();  
  
  Future<dynamic> login(String email,) async {
    var payload = {"email": email,};

    var response =
        await _apiService.postApi(endpoints:"api/auth/signin"  , payload: payload);
    return response;
  }
  Future<dynamic> createTransaction(String transactionType, String category , String currentDate , String amount) async {
    var payload = {
    "tranactionType": transactionType,
    "category":category,
    "curentDate":currentDate,
    // "discription":"",
    "amount":amount
};    var response =
        await _apiService.postApi(endpoints:
        "api/transaction", payload: payload,  header: {
        'Authorization': 'Bearer ${NetworkApiService.getToken()}',
      },);
    return response;
  }
}