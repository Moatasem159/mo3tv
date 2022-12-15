class MediaAccountDetails {
  MediaAccountDetails({
    this.favorite,
    this.rated,
    this.watchlist,
    this.ratedValue
  });

  bool? favorite;
  dynamic rated;
  dynamic ratedValue;
  bool? watchlist;

  factory MediaAccountDetails.fromJson(Map<String, dynamic> json) => MediaAccountDetails(
    favorite: json["favorite"],
    rated: json["rated"]??true,
    ratedValue:json["rated"]==false?0.0:json["rated"]["value"],
    watchlist: json["watchlist"],
  );

  Map<String, dynamic> toJson() => {
    "favorite": favorite,
    "rated": rated,
    "watchlist": watchlist,
  };
}