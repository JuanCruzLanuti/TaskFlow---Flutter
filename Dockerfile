# syntax=docker/dockerfile:1

# Etapa 1: Build de Flutter (web y mobile)
FROM ghcr.io/cirruslabs/flutter:latest AS build

WORKDIR /app

# Copia los archivos necesarios
COPY pubspec.* ./
RUN flutter pub get
COPY . .

# Build web
RUN flutter build web --release
# Build APK (Android)
RUN flutter build apk --release
# (Opcional) Build iOS (solo en MacOS):
# RUN flutter build ios --release

# Etapa 2: Nginx para servir la app web
FROM nginx:alpine AS web
COPY --from=build /app/build/web /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

# Notas para mobile:
# El APK generado estará en /app/build/app/outputs/flutter-apk/app-release.apk
# Puedes copiarlo del contenedor usando:
# docker cp <container_id>:/app/build/app/outputs/flutter-apk/app-release.apk ./
