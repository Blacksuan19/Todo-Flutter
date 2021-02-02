import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import '../models/todo.dart';
import '../widgets/material_button.dart';
import '../widgets/todo_item.dart';
import '../theme.dart';

class Home extends StatefulHookWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var _titleController = useTextEditingController();
    var _contentController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Gotta Do It!"),
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Consumer(builder: (context, watch, child) {
          var items = watch(todoListProvider);
          return ListView.builder(
              itemCount: items.todoItems.length,
              itemBuilder: (context, index) {
                return BuildTodoItem(
                  item: items.todoItems[index],
                );
              });
        }),
      ),
      floatingActionButton: BuildMaterialButton(
        icon: Icons.add,
        text: "Add Todo",
        width: 120,
        onPressed: () =>
            _buildAddNoteDialog(context, _titleController, _contentController),
      ),
    );
  }

  Future _buildAddNoteDialog(context, _titleController, _contentController) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Add Todo"),
            shape: AppTheme.shape,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: "Title",
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _contentController,
                  decoration: InputDecoration(
                    labelText: "Content",
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
            actions: [
              BuildMaterialButton(
                icon: Icons.cancel,
                text: "Cancel",
                width: 100,
                onPressed: () => Navigator.pop(context),
              ),
              BuildMaterialButton(
                icon: Icons.add,
                text: "Add",
                width: 80,
                onPressed: () => {},
              )
            ],
          );
        });
  }
}
