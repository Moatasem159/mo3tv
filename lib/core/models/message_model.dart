import 'package:mo3tv/core/entities/message.dart';

class MessageModel extends Message {
  MessageModel({
  required  super.success,
  required super.statusCode,
  required super.statusMessage,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        success: json["success"]??false,
        statusCode: json["status_code"]??0,
        statusMessage: json["status_message"]??'',
      );
}
