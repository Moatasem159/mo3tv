import 'package:mo3tv/features/reviews/domain/entities/review.dart';
class ReviewModel extends Review {
  const ReviewModel(
      {required super.author,
      required super.authorDetails,
      required super.content,
      required super.createdAt,
      required super.id,
      required super.updatedAt,
      required super.url});
  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        author: json["author"] ?? '',
        authorDetails: AuthorModel.fromJson(json["author_details"]),
        content: json["content"] ?? '',
        createdAt: json["created_at"] ?? '',
        id: json["id"] ?? 0,
        updatedAt: json["updated_at"] ?? '',
        url: json["url"] ?? '',
      );
}
class AuthorModel extends AuthorDetails {
  const AuthorModel({
    required super.name,
    required super.username,
    required super.avatarPath,
    required super.rating,
  });
  factory AuthorModel.fromJson(Map<String, dynamic> json) => AuthorModel(
        name: json["name"] ?? '',
        username: json["username"] ?? '',
        avatarPath: json["avatar_path"] ?? '',
        rating: json["rating"] ?? 0,
      );
}