class Bids {
  int id;
  int revesion;
  int price;
  int time;
  String desc;

  String username;
  int user;

  Bids(this.id, this.revesion, this.price, this.time, this.desc, this.username,
      this.user);
  Bids.fromJson(Map<dynamic, dynamic> json)
      : id = json["id"],
        revesion = json["revisions"],
        price = json["price"],
        time = json["proposedtime"],
        desc = json["biddescription"] as String,
        username = json["username"],
        user = json["userid"];
  static List<Bids> dealsfromapi(List api) {
    return api.map((e) {
      return Bids.fromJson(e);
    }).toList();
  }
}
