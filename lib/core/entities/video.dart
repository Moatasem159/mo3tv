class Video{
  String ?iso6391;
  String? iso31661;
  String ?name;
  String ?key;
  String ?site;
  int ?size;
  String ?type;
  bool ?official;
  DateTime ?publishedAt;
  String ?id;

  Video(
      {this.iso6391,
      this.iso31661,
      this.name,
      this.key,
      this.site,
      this.size,
      this.type,
      this.official,
      this.publishedAt,
      this.id});
}