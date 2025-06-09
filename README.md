# 📋 Aplicacion de tareas
Proyecto hecho con 🐦 Flutter y 🔥 Firebase.

Con funcionalidad para ➕ agregar, ✏️ modificar y 🗑️ eliminar tareas.

Cada tarea tiene los siguientes campos:
- 🏷️ Titulo.
- 📝 Descripcion.
- 📌 Estado (⏳ pendiente, ✅ terminado).
- 🗑️ Eliminar.

## 📸 Capturas
<div style="display: flex; justify-content: space-between; gap: 16px; width: 100%; align-items: center;">
   <img src="/assets/sample_list.jpg" alt="Screen de MainActivity" style="width: 45%; height: auto;">
   <img src="/assets/sample_modal.jpg" alt="Screen de SaludoActivity" style="width: 45%; height: auto;">
</div>

## 🚀 Inicializacion del proyecto
1. 📥 Clonar el repositorio
    ~~~
    git clone https://github.com/CarlosGunter/appmovil-todo.git
    cd appmovil-todo
    ~~~
2. 🔧 Crear y configurar un proyecto en [firebase](https://firebase.google.com/).
3. 🗄️ Crear una base de datos en firestore con el nombre `todo`.
4. 🛠️ Instalar [firebase tools](https://firebase.google.com/docs/cli?hl=es-419) en el equipo.
    ~~~
    npm install -g firebase-tools
    ~~~
5. 📦 Instalar las dependencias
    ~~~
    flutter pub get
    ~~~
6. ▶️ Correr el proyecto
   ~~~
    flutter run
    ~~~
