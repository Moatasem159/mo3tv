class Message {
  Message({
    required this.success,
   required this.statusCode,
    required this.statusMessage,
  });
  bool success;
  int statusCode;
  String statusMessage;
}
