import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

import '../theme.dart';
import 'material_button.dart';

class BuildTodoItem extends StatefulWidget {
  final Todo item;

  const BuildTodoItem({Key key, this.item}) : super(key: key);

  @override
  _BuildTodoItemState createState() => _BuildTodoItemState();
}

class _BuildTodoItemState extends State<BuildTodoItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: AppTheme.shape,
              scrollable: true,
              title: Text(
                widget.item.title,
                textAlign: TextAlign.center,
              ),
              content: Text(
                widget.item.content,
              ),
              actions: [
                BuildMaterialButton(
                  icon: Icons.delete,
                  text: "Delete",
                  width: 100,
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            );
          }),
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(1, 6),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.title,
                  style: TextStyle(
                    decoration: widget.item.isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: widget.item.isCompleted ? Colors.grey : Colors.black,
                  ),
                  maxLines: 3,
                ),
                Text(
                  widget.item.content,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  textWidthBasis: TextWidthBasis.parent,
                ),
              ],
            ),
            Checkbox(
              value: widget.item.isCompleted,
              onChanged: (bool value) {
                setState(() {
                  if (value == true) {}
                  widget.item.isCompleted = !widget.item.isCompleted;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
