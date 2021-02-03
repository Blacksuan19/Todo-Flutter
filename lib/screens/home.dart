import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

import '../models/todo.dart';
import '../theme.dart';
import '../widgets/material_button.dart';
import '../widgets/todo_item.dart';

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
      body: Consumer(builder: (context, watch, child) {
        var items = watch(todoListProvider).todoItems;
        return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return BuildTodoItem(
                item: items[index],
              );
            });
      }),
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
                onPressed: () {
                  // make sure both text fields are not empty
                  if (!_titleController.text.isEmpty &
                      !_contentController.text.isEmpty) {
                    // add todo to list
                    context.read(todoListProvider).add(
                          Todo(
                            title: _titleController.text,
                            content: _contentController.text,
                            isCompleted: false,
                          ),
                        );
                    // clear text fields
                    _titleController.clear();
                    _contentController.clear();
                    // close popup
                    Navigator.pop(context);
                  }
                },
              )
            ],
          );
        });
  }
}
