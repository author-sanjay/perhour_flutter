class Jobs {
  int id;
  String title;
  String bids;
  String fulldesc;
  int price;
  Jobs(this.id, this.title, this.bids, this.fulldesc, this.price);
  Jobs.fromJson(Map<dynamic, dynamic> json)
      : id = json["id"] as int,
        title = json["title"] as String,
        bids = json["totalbids"] as String,
        fulldesc = json["fulldescription"] as String,
        price = json["price"] as int;
  static List<Jobs> dealsfromapi(List api) {
    return api.map((e) {
      return Jobs.fromJson(e);
    }).toList();
  }
}
