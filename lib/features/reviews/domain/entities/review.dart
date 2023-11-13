class Review {
  final String author;
  final AuthorDetails authorDetails;
  final String content;
  final String createdAt;
  final String id;
  final String updatedAt;
  final String url;
  const Review({
    required this.author,
    required this.authorDetails,
    required this.content,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.url,
  });
}
class AuthorDetails {
  final String name;
  final String username;
  final String avatarPath;
  final dynamic rating;
  const AuthorDetails({
    required this.name,
    required this.username,
    required this.avatarPath,
    required this.rating,
  });
}
