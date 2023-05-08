abstract class ApiConsumer{
  Future<dynamic> get(String path);
  Future<dynamic> post(String path, {Map<String, dynamic>? body,bool formDataIsEnabled = false,});
  Future<dynamic> put(String path, {Map<String, dynamic>? body});
  Future<dynamic> delete(String path, {Map<String, dynamic>? body});
}