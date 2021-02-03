import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:uuid/uuid.dart';

var _uuid = Uuid();

class Todo {
  String id;
  String title;
  String content;
  bool isCompleted = false;
  Todo({
    String id,
    this.title,
    this.content,
    this.isCompleted,
  }) : id = _uuid.v4();

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

class TodoList extends ChangeNotifier {
  List<Todo> todoItems = [
    Todo(
        content: "this is a testing to do",
        title: "Testing",
        isCompleted: true),
    Todo(
        content: "this is a testing to do",
        title: "Finish the App interface",
        isCompleted: false),
    Todo(
        content: "Todo is not deletable from the current UI.",
        title: "Fix todo deletion",
        isCompleted: false),
    Todo(
        content: "this is a testing to do",
        title: "Jump on new PyTorch course",
        isCompleted: false),
    Todo(
        content: "Todo is not deletable from the current UI.",
        title: "Fix todo deletion",
        isCompleted: false),
    Todo(
        content: "this is a testing to do",
        title: "Jump on new PyTorch course",
        isCompleted: false),
    Todo(
        content: "Todo is not deletable from the current UI.",
        title: "Fix todo deletion",
        isCompleted: false),
    Todo(
        content: "this is a testing to do",
        title: "Jump on new PyTorch course",
        isCompleted: false),
    Todo(
        content:
            "Todo is not deletable from the current UI. this is extra text to test overflow behavior it should be better now",
        title: "Fix todo deletion",
        isCompleted: false),
    Todo(
        content: "this is a testing to do",
        title: "Jump on new PyTorch course",
        isCompleted: false),
  ];
  void remove(Todo item) {
    todoItems.remove(item);
    notifyListeners();
  }

  void add(Todo item) {
    todoItems.add(item);
  }
}

// ignore: top_level_function_literal_block
final todoListProvider = ChangeNotifierProvider((ref) {
  return TodoList();
});
