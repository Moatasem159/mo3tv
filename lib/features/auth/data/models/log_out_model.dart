import 'package:mo3tv/features/auth/domain/entities/log_out_entity.dart';
class LogOutModel extends LogOut{
  const LogOutModel({required super.success, required super.statusCode, required super.statusMessage});
  factory LogOutModel.fromJson(Map<String, dynamic> json) => LogOutModel(
    success: json["success"],
    statusCode: json["status_code"]??0,
    statusMessage: json["status_message"]??'',
  );
  Map<String, dynamic> toJson() => {
    "success": success,
    "status_code": statusCode,
    "status_message": statusMessage,
  };
}