import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taskflow/models/task.dart';

/// Unit tests for the [Task] class.
void main() {
  group('Task', () {
    final testResults = <String, bool>{};

    test('Crear tarea con prioridad baja y descripción', () {
      final task = Task(
        id: '1',
        title: 'Comprar leche',
        description: 'Necesito comprar leche para el desayuno',
        priority: TaskPriority.low,
      );
      expect(task.title, 'Comprar leche');
      expect(task.description, 'Necesito comprar leche para el desayuno');
      expect(task.priority, TaskPriority.low);
      testResults['Crear tarea con prioridad baja y descripción'] = true;
    });

    test('Crear tarea con prioridad media y descripción', () {
      final task = Task(
        id: '2',
        title: 'Revisar correos electrónicos',
        description:
            'Debo revisar mis correos electrónicos para responder a los mensajes importantes',
        priority: TaskPriority.medium,
      );
      expect(task.title, 'Revisar correos electrónicos');
      expect(task.description,
          'Debo revisar mis correos electrónicos para responder a los mensajes importantes');
      expect(task.priority, TaskPriority.medium);
      testResults['Crear tarea con prioridad media y descripción'] = true;
    });

    test('Crear tarea con prioridad alta y descripción', () {
      final task = Task(
        id: '3',
        title: 'Entregar proyecto',
        description: 'Debo entregar el proyecto de trabajo para el viernes',
        priority: TaskPriority.high,
      );
      expect(task.title, 'Entregar proyecto');
      expect(task.description,
          'Debo entregar el proyecto de trabajo para el viernes');
      expect(task.priority, TaskPriority.high);
      testResults['Crear tarea con prioridad alta y descripción'] = true;
    });

    test('Marcar tarea como completada', () {
      final task = Task(
        id: '4',
        title: 'Comprar leche',
        description: 'Necesito comprar leche para el desayuno',
        priority: TaskPriority.low,
      );
      task.toggleComplete();
      expect(task.isCompleted, true);
      testResults['Marcar tarea como completada'] = true;
    });

    test('Desmarcar tarea como completada', () {
      final task = Task(
        id: '5',
        title: 'Comprar leche',
        description: 'Necesito comprar leche para el desayuno',
        priority: TaskPriority.low,
      );
      task.toggleComplete();
      task.toggleComplete();
      expect(task.isCompleted, false);
      testResults['Desmarcar tarea como completada'] = true;
    });

    test('Editar título de tarea', () {
      final task = Task(
        id: '6',
        title: 'Comprar leche',
        description: 'Necesito comprar leche para el desayuno',
        priority: TaskPriority.low,
      );
      final taskEdited = task.copyWith(title: 'Comprar pan');
      expect(taskEdited.title, 'Comprar pan');
      testResults['Editar título de tarea'] = true;
    });

    test('Editar descripción de tarea', () {
      final task = Task(
        id: '7',
        title: 'Comprar leche',
        description: 'Necesito comprar leche para el desayuno',
        priority: TaskPriority.low,
      );
      final taskEdited =
          task.copyWith(description: 'Necesito comprar leche para el almuerzo');
      expect(taskEdited.description, 'Necesito comprar leche para el almuerzo');
      testResults['Editar descripción de tarea'] = true;
    });

    test('Cambiar prioridad de tarea', () {
      final task = Task(
        id: '8',
        title: 'Comprar leche',
        description: 'Necesito comprar leche para el desayuno',
        priority: TaskPriority.low,
      );
      final taskEdited = task.copyWith(priority: TaskPriority.medium);
      expect(taskEdited.priority, TaskPriority.medium);
      testResults['Cambiar prioridad de tarea'] = true;
    });

    tearDownAll(() {
      final failedTests = testResults.entries
          .where((entry) => entry.value == false)
          .map((entry) => entry.key)
          .toList();

      if (failedTests.isEmpty) {
        if (kDebugMode) {
          print('All tasks pass successfully');
        }
      } else {
        if (kDebugMode) {
          print('Failed tests: ${failedTests.join(', ')}');
        }
      }
    });
  });
}
