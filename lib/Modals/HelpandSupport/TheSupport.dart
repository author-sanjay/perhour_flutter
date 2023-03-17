// ignore_for_file: file_names

class TheSupport {
  int id;
  String date;
  String message;
  String status;
  String subject;
  String email;
  String phone;
  TheSupport(this.id, this.date, this.message, this.status, this.subject,
      this.email, this.phone);
  TheSupport.fromJson(Map<dynamic, dynamic> json)
      : id = json["id"],
        date = json["date"] as String,
        message = json["message"] as String,
        status = json["status"] as String,
        subject = json["subject"] as String,
        email = json["email"] as String,
        phone = json["phone"] as String;

  static List<TheSupport> dealsfromapi(List api) {
    return api.map((e) {
      return TheSupport.fromJson(e);
    }).toList();
  }
}
