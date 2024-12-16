import 'package:flutter/material.dart';
import '../Models/models.dart';

class TodoItems extends StatelessWidget {
  final Todo todo;
  final Function(String) onDelete;
  final Function(String) onToggle;

  const TodoItems({
    super.key,
    required this.todo,
    required this.onDelete,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: ListTile(
          onTap: () => onToggle(todo.id!),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          tileColor: Colors.white,
          leading: Icon(
            todo.isDone! ? Icons.check_box : Icons.check_box_outline_blank,
            color: Colors.blue,
          ),
          title: Text(
            todo.todoText!,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              decoration: todo.isDone!
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
          trailing: IconButton(
            onPressed: () => onDelete(todo.id!),
            icon: const Icon(Icons.delete_sweep_sharp, color: Colors.blueAccent),
          ),
        ),
      ),
    );
  }
}
