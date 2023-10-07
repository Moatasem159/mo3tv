class LogOut{
  final bool success;
  final int statusCode;
  final String statusMessage;
  const LogOut({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
  });
}