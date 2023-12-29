class Network {
  final int? id;
  final String name;
  final String logoPath;
  final String originCountry;
  const Network({required this.id,required this.name,required this.logoPath,required this.originCountry});
  factory Network.fromJson(Map<String, dynamic> json) => Network(
    id: json["id"]??0,
    name: json["name"]??'',
    logoPath: json["logo_path"] ??'',
    originCountry: json["origin_country"]??'',
  );
}