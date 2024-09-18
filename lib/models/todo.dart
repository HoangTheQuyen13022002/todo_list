class Todo {
  final String title;
  final String content;
  bool isCompleted;

  Todo({
    required this.title,
    required this.content,
    required this.isCompleted
  });

  Todo copyWith({
    String? title,
    String? content,
    bool? isCompleted,
  }) =>
      Todo(
        title: title ?? this.title,
        content: content ?? this.content,
        isCompleted: isCompleted ?? this.isCompleted,
      );
}