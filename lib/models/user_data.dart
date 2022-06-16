class User {
  int? id;
  String title;
  String text;
  DateTime time = DateTime.now();
  static const String TABLE_NAME = 'user';

  User({
    this.id,
    required this.title,
    required this.text,
    required this.time,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "text": text,
      "time": time.millisecondsSinceEpoch,
    };
  }
}
