// ignore_for_file: file_names

class Member {
  int id;
  String title;
  int price;
  String benefits;
  bool monthly;
  int extendedbids;
  Member(this.id, this.title, this.price, this.benefits, this.monthly,
      this.extendedbids);
  Member.fromJson(Map<dynamic, dynamic> json)
      : id = json["id"],
        title = json["name"] as String,
        price = json["price"],
        benefits = json["description"],
        monthly = json["montly"],
        extendedbids = json["extendedbids"];

  static List<Member> dealsfromapi(List api) {
    return api.map((e) {
      return Member.fromJson(e);
    }).toList();
  }
}
