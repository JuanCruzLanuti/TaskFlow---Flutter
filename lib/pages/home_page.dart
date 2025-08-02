import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Task> _tasks = [];

  /// Adds a new task with a default title, description, and medium priority
  /// to the list of tasks. The task ID is generated based on the current date
  /// and time.

  void _addTask() {
    final newTask = Task(
      id: DateTime.now().toString(),
      title: 'Nueva Tarea',
      description: 'Descripción de ejemplo',
      priority: TaskPriority.medium,
    );
    setState(() => _tasks.add(newTask));
  }

  /// Updates an existing task in the list.
  ///
  /// Finds the task with the same id as the given [task] in the [_tasks] list
  /// and updates it with the new data. If no task with the same id is found,
  /// no changes are made.
  ///
  /// [task]: The task object containing updated information.

  void _updateTask(Task task) {
    setState(() {
      final index = _tasks.indexWhere((t) => t.id == task.id);
      if (index != -1) {
        _tasks[index] = task;
      }
    });
  }

  /// Toggles the completion status of a task with the specified [id].
  void _toggleComplete(String id) {
    setState(() {
      final task = _tasks.firstWhere((t) => t.id == id);
      task.toggleComplete();
    });
  }

  /// Deletes a task with the specified [id] from the list of tasks.
  ///
  /// The task is identified by its unique [id]. If a task with the
  /// given [id] is found, it is removed from the list of tasks.

  void _deleteTask(String id) {
    setState(() {
      _tasks.removeWhere((t) => t.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TaskFlow')),
      body: ListView(
        children: _tasks
            .map((t) => TaskTile(
                task: t,
                onToggle: _toggleComplete,
                onUpdateTask: _updateTask,
                onDeleteTask: _deleteTask))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
