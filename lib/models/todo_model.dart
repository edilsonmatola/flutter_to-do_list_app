class TodoModel {
  TodoModel({
    required this.title,
    required this.dateTime,
  });

  final String title;
  final DateTime dateTime;

  Map<String, dynamic> toJson() => {
        'title': title,
        'dateTime': dateTime.toIso8601String(),
      };
}
