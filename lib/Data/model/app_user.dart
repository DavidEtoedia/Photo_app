class AppUser {
  String username;
  String id;
  DateTime date;
  AppUser({
    required this.username,
    required this.id,
    required this.date,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) => AppUser(
        // date: DateTime.parse(json["date"]),
        id: json['id'],
        username: json['username'],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'date': date.toIso8601String(),
      };
}
