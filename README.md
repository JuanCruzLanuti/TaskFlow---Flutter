# TaskFlow

Una aplicación simple de gestión de tareas desarrollada en Flutter siguiendo principios Material 3.

## Descripción

TaskFlow es una aplicación MVP (Minimum Viable Product) que permite a los usuarios individuales gestionar sus tareas diarias de manera eficiente. La aplicación incluye funcionalidades para crear, visualizar, completar y eliminar tareas con diferentes niveles de prioridad.

## Funcionalidades

- ✅ **Agregar Tareas**: Crear nuevas tareas con título, descripción y prioridad (baja, media, alta)
- 📋 **Listar Tareas**: Visualizar todas las tareas en una lista clara y ordenada
- ✓ **Completar Tareas**: Marcar tareas como completadas
- 🗑️ **Eliminar Tareas**: Remover tareas que ya no son necesarias
- 💾 **Persistencia Temporal**: Las tareas se mantienen en memoria durante la sesión

## Arquitectura

El proyecto está organizado siguiendo buenas prácticas de Flutter:

```
lib/
├── main.dart           # Punto de entrada de la aplicación
├── models/            # Modelos de datos
│   └── task.dart
├── pages/             # Páginas/Pantallas
│   └── home_page.dart
└── widgets/           # Widgets reutilizables
    └── task_tile.dart

test/                  # Tests unitarios
└── task_test.dart
```

## Testing

La aplicación incluye tests unitarios para validar la funcionalidad de los modelos y componentes principales. Los tests están ubicados en el directorio `test/`.

Para ejecutar los tests:

```bash
flutter test
```

## Cómo Ejecutar

### Desarrollo Local

1. Asegúrate de tener Flutter instalado y configurado
2. Clona el repositorio
3. Instala las dependencias:
   ```bash
   flutter pub get
   ```
4. Ejecuta la aplicación:
   ```bash
   flutter run
   ```

### Docker (Web y Mobile)

La aplicación está configurada para ejecutarse en contenedores Docker:

#### Para Web:
```bash
docker compose up --build
```
Luego accede a `http://localhost` en tu navegador.

#### Para Mobile (APK):
1. Construye la imagen:
   ```bash
   docker build -t taskflow .
   ```
2. Extrae el APK:
   ```bash
   docker run --name taskflow-build taskflow
   docker cp taskflow-build:/app/build/app/outputs/flutter-apk/app-release.apk ./
   ```
3. Instala el APK en tu emulador o dispositivo Android

## Tecnologías

- **Flutter**: Framework de desarrollo multiplataforma
- **Dart**: Lenguaje de programación
- **Material 3**: Sistema de diseño de Google
- **Docker**: Containerización para despliegue

## Recursos Flutter

Si eres nuevo en Flutter, aquí tienes algunos recursos útiles:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Documentación oficial](https://docs.flutter.dev/)
