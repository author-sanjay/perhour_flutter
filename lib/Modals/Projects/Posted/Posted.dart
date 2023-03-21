// ignore_for_file: file_names

class Postedd {
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
  String? feedback;
  Postedd(this.id, this.title, this.bids, this.fulldesc, this.price, this.fixed,
      this.category, this.experience, this.time, this.status,this.feedback);
  Postedd.fromJson(Map<dynamic, dynamic> json)
      : id = json["id"],
        feedback=json["feedback"],
        title = json["title"] as String,
        bids = json["totalbids"],
        fulldesc = json["fulldescription"] as String,
        price = json["price"],
        category = json["category"] as String,
        fixed = json["fixed"],
        experience = json["experience"] as String,
        time = json["timelimit"] as String,
        status = json["status"] as String;

  static List<Postedd> dealsfromapi(List api) {
    return api.map((e) {
      return Postedd.fromJson(e);
    }).toList();
  }




}
