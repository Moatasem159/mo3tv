class MediaAccountDetails {
  MediaAccountDetails(
      {this.favorite = false,
      this.rated = false,
      this.watchlist = false,
      this.ratedValue = 0.0});

  bool? favorite;
  dynamic rated;
  dynamic ratedValue;
  bool? watchlist;

  factory MediaAccountDetails.fromJson(Map<String, dynamic> json) =>
      MediaAccountDetails(
        favorite: json["favorite"] ?? false,
        rated: json["rated"] ?? false,
        ratedValue: json["rated"] == false ? 0.0 : json["rated"]["value"],
        watchlist: json["watchlist"] ?? false,
      );
}
