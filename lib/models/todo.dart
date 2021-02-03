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

  // remove todo
  void remove(Todo item) {
    todoItems.remove(item);
    notifyListeners();
  }

  // add new item to the top of the list
  void add(Todo item) {
    todoItems.insert(0, item);
    notifyListeners();
  }
}

// ignore: top_level_function_literal_block
final todoListProvider = ChangeNotifierProvider((ref) {
  return TodoList();
});
