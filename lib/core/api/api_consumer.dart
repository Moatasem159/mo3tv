abstract class ApiConsumer{


  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameters,String ?token});
  Future<dynamic> post(String path, {Map<String, dynamic>? body,Map<String, dynamic>? queryParameters,String ?token});
  Future<dynamic> put(String path, {Map<String, dynamic>? body,Map<String, dynamic>? queryParameters,String ?token});
  Future<dynamic> delete(String path, {Map<String, dynamic>? body, String? token, String lang='en', int ?id, Map<String, dynamic>? queryParameters});
}