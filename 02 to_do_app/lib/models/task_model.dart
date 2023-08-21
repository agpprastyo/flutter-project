class Task {
  int? id;
  String title;
  DateTime date;
  String priority;
  int status;

  Task({
    this.id,
    required this.title,
    required this.date,
    required this.priority,
    this.status = 0, // Set a default value for status
  });

  Task.withId({
    this.id,
    required this.title,
    required this.date,
    required this.priority,
    this.status = 0, // Set a default value for status
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['date'] = date.toIso8601String();
    map['priority'] = priority;
    map['status'] = status;
    return map;
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task.withId(
      id: map['id'],
      title: map['title'],
      date: DateTime.parse(map['date']),
      priority: map['priority'],
      status: map['status'],
    );
  }

  static Task empty() {
    return Task(
      title: '',
      date: DateTime.now(),
      priority: 'Low',
      id: 0,
      status: 0,
    );
  }
}
