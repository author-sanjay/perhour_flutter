class Jobs {
  int id;
  String title;
  int bids;
  String fulldesc;
  int price;
  Jobs(this.id, this.title, this.bids, this.fulldesc, this.price);
  Jobs.fromJson(Map<dynamic, dynamic> json)
      : id = json["id"],
        title = json["title"] as String,
        bids = json["totalbids"],
        fulldesc = json["fulldescription"] as String,
        price = json["price"];
  static List<Jobs> dealsfromapi(List api) {
    return api.map((e) {
      return Jobs.fromJson(e);
    }).toList();
  }
}
