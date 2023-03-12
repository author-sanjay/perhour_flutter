// ignore_for_file: file_names

class Txn {
  int id;
  double amount;
  String date ;
  bool incoming;
  String projectname;
  int projectid;
  Txn(this.id, this.amount, this.date, this.incoming, this.projectid, this.projectname);
  Txn.fromJson(Map<dynamic, dynamic> json)
      : id = json["id"],
        amount = json["amount"] ,
        date = json["date"] as String,
        incoming = json["incoming"],
        projectid=json["projectid"],
        projectname=json["projecttitle"] as String;

  static List<Txn> dealsfromapi(List api) {
    return api.map((e) {
      return Txn.fromJson(e);
    }).toList();
  }
}
