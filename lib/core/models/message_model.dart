import 'package:mo3tv/core/entities/message.dart';

class MessageModel extends Message {
  MessageModel({
    super.success,
    super.statusCode,
    super.statusMessage,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
      );
}
