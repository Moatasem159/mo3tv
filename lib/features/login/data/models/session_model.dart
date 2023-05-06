import 'dart:convert';
import 'package:mo3tv/features/login/domain/entities/session.dart';
SessionModel sessionFromJson(String str) => SessionModel.fromJson(json.decode(str));
String sessionToJson(SessionModel data) => json.encode(data.toJson());
class SessionModel extends Session {
  SessionModel({
    super.success,
    super.sessionId,
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
