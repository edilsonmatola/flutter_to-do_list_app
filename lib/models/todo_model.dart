class TodoModel {
  TodoModel({
    required this.title,
    required this.dateTime,
  });

  TodoModel.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String,
        dateTime = DateTime.parse(json['dateTime'] as String);

  final String title;
  final DateTime dateTime;

  Map<String, dynamic> toJson() => {
        'title': title,
        'dateTime': dateTime.toIso8601String(),
      };
}
