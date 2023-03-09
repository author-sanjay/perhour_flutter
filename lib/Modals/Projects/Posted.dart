class Posted {
  int id;
  String title;
  int bids;
  String fulldesc;
  int price;
  bool fixed;
  String status;
  String category;
  String experience;
  String time;
  Posted(this.id, this.title, this.bids, this.fulldesc, this.price, this.fixed,
      this.category, this.experience, this.time, this.status);
  Posted.fromJson(Map<dynamic, dynamic> json)
      : id = json["id"],
        title = json["title"] as String,
        bids = json["totalbids"],
        fulldesc = json["fulldescription"] as String,
        price = json["price"],
        category = json["category"] as String,
        fixed = json["fixed"],
        experience = json["experience"] as String,
        time = json["timelimit"] as String,
        status = json["status"] as String;

  static List<Posted> dealsfromapi(List api) {
    return api.map((e) {
      return Posted.fromJson(e);
    }).toList();
  }
}
