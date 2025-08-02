import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final void Function(String id) onToggle;
  final void Function(Task task) onUpdateTask;
  final void Function(String id) onDeleteTask;

  const TaskTile(
      {super.key,
      required this.task,
      required this.onToggle,
      required this.onUpdateTask,
      required this.onDeleteTask});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: GestureDetector(
        onTap: () => showDialog(
          context: context,
          builder: (context) {
            final controller = TextEditingController(text: task.title);
            return AlertDialog(
              title: const Text('Editar título de la tarea'),
              content: TextField(
                controller: controller,
                autofocus: true,
              ),
              actions: [
                TextButton(
                  child: const Text('Cancelar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Guardar'),
                  onPressed: () {
                    final newTitle = controller.text;
                    onUpdateTask(task.copyWith(title: newTitle));
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        ),
        child: Text(task.title,
            style: TextStyle(
                decoration:
                    task.isCompleted ? TextDecoration.lineThrough : null)),
      ),
      subtitle: GestureDetector(
        child: Text(task.description,
            style: TextStyle(
                decoration:
                    task.isCompleted ? TextDecoration.lineThrough : null)),
        onTap: () => showDialog(
          context: context,
          builder: (context) {
            final controller = TextEditingController(text: task.description);
            return AlertDialog(
              title: const Text('Editar descripción de la tarea'),
              content: TextField(
                controller: controller,
                autofocus: true,
              ),
              actions: [
                TextButton(
                  child: const Text('Cancelar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Guardar'),
                  onPressed: () {
                    final newDescription = controller.text;
                    onUpdateTask(task.copyWith(description: newDescription));
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: task.isCompleted,
            onChanged: (_) => onToggle(task.id),
          ),
          const SizedBox(width: 8),
          DropdownButton(
            dropdownColor: Colors.white,
            borderRadius: BorderRadius.circular(8),
            value: task.priority,
            focusColor: Colors.transparent,
            underline: const SizedBox(),
            onChanged: (TaskPriority? newPriority) {
              onUpdateTask(task.copyWith(priority: newPriority));
            },
            items: TaskPriority.values.map((priority) {
              return DropdownMenuItem(
                value: priority,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: _getPriorityColor(priority),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    _getPriorityText(priority),
                    style: TextStyle(color: _getPriorityTextColor(priority)),
                  ),
                ),
              );
            }).toList(),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 8),
            ),
            onPressed: () {
              onDeleteTask(task.id);
            },
            child: const Icon(Icons.close, size: 20),
          ),
        ],
      ),
    );
  }
}

Color _getPriorityColor(TaskPriority priority) {
  switch (priority) {
    case TaskPriority.low:
      return Colors.green;
    case TaskPriority.medium:
      return Colors.yellow;
    case TaskPriority.high:
      return Colors.red;
  }
}

String _getPriorityText(TaskPriority priority) {
  switch (priority) {
    case TaskPriority.low:
      return 'Low';
    case TaskPriority.medium:
      return 'Medium';
    case TaskPriority.high:
      return 'High';
  }
}

Color _getPriorityTextColor(TaskPriority priority) {
  switch (priority) {
    case TaskPriority.low:
      return Colors.black;
    case TaskPriority.medium:
      return Colors.black;
    case TaskPriority.high:
      return Colors.white;
  }
}
