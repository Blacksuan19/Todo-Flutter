import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class BuildTodoItem extends StatefulWidget {
  final Todo item;
  final BuildContext cont;

  const BuildTodoItem({Key key, this.item, this.cont}) : super(key: key);

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
              title: Column(
                children: [
                  Text(widget.item.title),
                  VerticalDivider(
                    color: AppTheme.accentColor,
                  ),
                ],
              ),
              content: Text(widget.item.content),
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
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              // blurRadius: 1,

              offset: Offset(1, 6),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(
              value: widget.item.isCompleted,
              onChanged: (bool value) {
                setState(() {
                  widget.item.isCompleted = !widget.item.isCompleted;
                });
              },
            ),
            Column(
              children: [
                Text(
                  widget.item.title,
                  style: TextStyle(
                    decoration: widget.item.isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: widget.item.isCompleted ? Colors.grey : Colors.black,
                  ),
                ),
                Text(
                  widget.item.content,
                  maxLines: 3,
                ),
              ],
            ),
            MaterialButton(
              onPressed: () => {
                setState(() {
                  todoItems.remove(widget.item);
                })
              },
              color: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  Text(
                    "Delete Todo",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
