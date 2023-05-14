import '../../../../core/dio_client.dart';

class SearchApi {
  // dio instance
  final DioClient _dioClient;

  // injecting dio instance
  SearchApi(this._dioClient);

  Future<Map<String, dynamic>> fetchSearchApiRequest(String endpoint) async {
    try {
      final res = await _dioClient.get(endpoint);
      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}
