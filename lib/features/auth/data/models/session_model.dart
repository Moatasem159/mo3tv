import 'package:mo3tv/features/auth/domain/entities/session.dart';
class SessionModel extends Session {
  const SessionModel({
   required super.success,
   required super.sessionId,
  });
  factory SessionModel.fromJson(Map<String, dynamic> json) => SessionModel(
    success: json["success"]??false,
    sessionId: json["session_id"]??'',
  );
  Map<String, dynamic> toJson() => {
    "success": success,
    "session_id": sessionId,
  };
}