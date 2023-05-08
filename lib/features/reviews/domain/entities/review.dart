class Review{
  String? author;
  AuthorDetails? authorDetails;
  String? content;
  String ?createdAt;
  String ?id;
  String? updatedAt;
  String ?url;
  Review(
      {this.author,
      this.authorDetails,
      this.content,
      this.createdAt,
      this.id,
      this.updatedAt,
      this.url});
}
class AuthorDetails{
  String ?name;
  String ?username;
  String ?avatarPath;
  dynamic rating;

  AuthorDetails({this.name, this.username, this.avatarPath, this.rating});
  Map<String, dynamic> toJson() => {
    "name": name,
    "username": username,
    "avatar_path": avatarPath,
    "rating": rating,
  };
}