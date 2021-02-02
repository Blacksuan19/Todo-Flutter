import 'dart:convert';

import 'package:hooks_riverpod/all.dart';

class Todo {
  String id;
  String title;
  String content;
  bool isCompleted = false;
  Todo({
    this.id,
    this.title,
    this.content,
    this.isCompleted,
  });

  Todo copyWith({
    String id,
    String title,
    String content,
    bool isCompleted,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'isCompleted': isCompleted,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Todo(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      isCompleted: map['isCompleted'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) => Todo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Todo(id: $id, title: $title, content: $content, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Todo &&
        o.id == id &&
        o.title == title &&
        o.content == content &&
        o.isCompleted == isCompleted;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        content.hashCode ^
        isCompleted.hashCode;
  }
}

List<Todo> todoItems = [
  Todo(
      content: "this is a testing to do",
      id: '1',
      title: "Testing",
      isCompleted: true),
  Todo(
      content: "this is a testing to do",
      id: '2',
      title: "Testing",
      isCompleted: false),
  Todo(
      content: "this is a testing to do",
      id: '3',
      title: "Testing",
      isCompleted: true),
  Todo(
      content: "this is a testing to do",
      id: '4',
      title: "Testing",
      isCompleted: false),
];

// ignore: top_level_function_literal_block
final todoListProvider = Provider((ref) {
  return todoItems;
});
