// ignore_for_file: file_names

class User3 {
  int id;
  String? photo;
  double? rate;
  String? name;
  String? tagline;
  double contri;

  User3(this.id, this.photo, this.rate, this.name, this.tagline,this.contri);
  User3.fromJson(Map<dynamic, dynamic> json)
      : id = json["id"],
        photo = json["photo"],
        rate = json["rates"],
        name = json["firstname"],
        contri=json["referralcontri"],
        tagline = json["headline"];

  static List<User3> dealsfromapi(List api) {
    return api.map((e) {
      return User3.fromJson(e);
    }).toList();
  }
}
