abstract class BaseApiService {
  Future<dynamic> getApi(
      {required String endpoints, Map<String, dynamic>? queryParameter});
  Future<dynamic> postApi({
    required String endpoints,
    required Map<String, dynamic> payload,
    required Map<String, dynamic> header,
  });
  Future<dynamic> putApi({
    required String endpoints,
    required Map<String, dynamic> payload,
    Map<String, dynamic>? header,
  });
  Future<dynamic> deleteApi({
    required String endpoints,
    required Map<String, dynamic> payload,
    Map<String, dynamic>? header,
  });
}
