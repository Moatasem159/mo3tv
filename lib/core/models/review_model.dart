import 'package:mo3tv/core/entities/review.dart';

class ReviewModel extends Review{
  ReviewModel(
      {super.author,
      super.authorDetails,
      super.content,
      super.createdAt,
      super.id,
      super.updatedAt,
      super.url});


  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
    author: json["author"]??'',
    authorDetails: AuthorModel.fromJson(json["author_details"]??AuthorDetails()),
    content: json["content"]??'',
    createdAt: json["created_at"]??'',
    id: json["id"]??0,
    updatedAt: json["updated_at"]??'',
    url: json["url"]??'',
  );

  Map<String, dynamic> toJson() => {
    "author": author,
    "author_details": authorDetails!.toJson(),
    "content": content,
    "created_at": createdAt,
    "id": id,
    "updated_at": updatedAt,
    "url": url,
  };
}


class AuthorModel extends AuthorDetails{
  AuthorModel({super.name, super.username, super.avatarPath, super.rating});

  factory AuthorModel.fromJson(Map<String, dynamic> json) => AuthorModel(
    name: json["name"]??'',
    username: json["username"]??'',
    avatarPath: json["avatar_path"]??'',
    rating: json["rating"]??0,
  );

  @override
  Map<String, dynamic> toJson() => {
    "name": name,
    "username": username,
    "avatar_path": avatarPath,
    "rating": rating,
  };
}



