# Requerimientos del Proyecto TaskFlow

## Objetivo

Crear una aplicación simple de gestión de tareas para usuarios individuales. El usuario debe poder crear, visualizar, completar y eliminar tareas. La aplicación debe ser responsiva y simple de utilizar.

---

## Funcionalidades Principales

1. **Agregar Tarea**
   - El usuario puede agregar una nueva tarea con título, descripción y prioridad (baja, media, alta).

2. **Listar Tareas**
   - Las tareas deben mostrarse en una lista clara con su título, descripción, estado (completado o no), y prioridad.

3. **Completar Tarea**
   - El usuario puede marcar una tarea como completada (checkbox o acción similar).

4. **Eliminar Tarea**
   - El usuario puede eliminar una tarea que ya no necesita.

5. **Persistencia Temporal**
   - Las tareas pueden mantenerse en memoria por sesión (no es necesaria base de datos en esta versión MVP).

---

## Requerimientos Técnicos

- La app debe desarrollarse con **Flutter**.
- El diseño debe seguir principios **Material 3**.
- Código limpio y bien organizado por módulos (`models/`, `widgets/`, `pages/`, `test/`).
- Preparado para **testing unitario**.

---

## Historias de Usuario (generadas a partir del análisis)

- Como usuario, quiero agregar nuevas tareas para organizar mi día.
- Como usuario, quiero ver todas mis tareas en una lista clara y ordenada.
- Como usuario, quiero marcar las tareas como completadas cuando las termine.
- Como usuario, quiero eliminar tareas que ya no necesito.