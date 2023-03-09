class Bids {
  int id;
  int revesion;
  int price;
  int time;
  String desc;
  int project;
  int user;
  Bids(this.id, this.revesion, this.price, this.time, this.desc, this.project,
      this.user);
  Bids.fromJson(Map<dynamic, dynamic> json)
      : id = json["id"] as int,
        revesion = json["revisions"],
        price = json["price"],
        time = json["proposedtime"],
        desc = json["biddescription"],
        user = json["bidby"],
        project = json["project"];
  static List<Bids> dealsfromapi(List api) {
    return api.map((e) {
      return Bids.fromJson(e);
    }).toList();
  }
}
