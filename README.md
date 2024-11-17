
# Technical Test - Flutter

Este es un proyecto de prueba técnica desarrollado en Flutter. El objetivo de esta prueba es demostrar mis habilidades en el desarrollo de aplicaciones móviles, particularmente en la gestión del estado utilizando el patrón `Cubit`, manejo de interfaces de usuario y pruebas de widget.

## Requisitos previos

Antes de ejecutar la aplicación, asegúrate de tener instaladas las siguientes dependencias:

- **Flutter**: Asegúrate de tener Flutter instalado en tu máquina. Puedes verificarlo ejecutando el siguiente comando:
  ```bash
  flutter --version
  ```
- **Dart**: Este proyecto requiere Dart 2.x, que ya viene incluido con Flutter.

## Pasos para ejecutar la aplicación

### Clonar el repositorio

Si aún no tienes el repositorio clonado, puedes hacerlo ejecutando el siguiente comando en tu terminal:

```bash
git clone https://github.com/salbisser105/technical-test-flutter.git
```

### Instalar dependencias

Una vez que hayas clonado el repositorio, navega a la carpeta del proyecto e instala las dependencias necesarias ejecutando:

```bash
cd technical-test-flutter
flutter pub get
```

### Ejecutar la aplicación

Para ejecutar la aplicación en un dispositivo o emulador, usa el siguiente comando:

```bash
flutter run
```

Este comando compilará la aplicación y la lanzará en el dispositivo o emulador configurado.

## Funcionalidad de la aplicación

Este proyecto utiliza el patrón Cubit para gestionar el estado de la aplicación. A continuación se detalla la funcionalidad principal:

- **Página de seguimiento de puntos (PointTrackerPage)**: Muestra los puntos actuales del usuario y una lista de actualizaciones de puntos.
- **Flotantes de acción**: Utiliza dos botones flotantes para agregar o restar puntos. Al hacer clic en estos botones, se navega a una nueva página (InputPage) donde el usuario puede ingresar un valor de puntos.
- **Manejo del estado**: La aplicación usa Cubit para gestionar el estado de los puntos del usuario y sus actualizaciones. Los estados se actualizan dinámicamente a medida que el usuario agrega o resta puntos.

## Cubit y gestión del estado

- **PointsCubit**: Este es el cubit que maneja el estado de los puntos. Los métodos principales son:
  - `addPoints(int value)`: Agrega puntos.
  - `subtractPoints(int value)`: Resta puntos.
- **PointsState**: Mantiene el estado actual de los puntos y un historial de actualizaciones.

## Consideraciones adicionales

- **Interfaz de usuario**: La UI está construida utilizando MaterialPageRoute para la navegación y el uso de widgets como FloatingActionButton y ListView para mostrar los puntos y las actualizaciones.

### Dependencias:

- **flutter_bloc**: Para gestionar el estado de la aplicación con el patrón Cubit.
- **flutter_test**: Para pruebas unitarias y pruebas de widget.

## Pruebas

### Ejecutar las pruebas de widget

Puedes ejecutar las pruebas de widget utilizando el siguiente comando:

```bash
flutter test
```

Esto ejecutará todas las pruebas definidas en el directorio test/ y te proporcionará un informe de los resultados.

### Consideraciones para las pruebas

Las pruebas están centradas en los widgets principales de la aplicación como PointTrackerPage y FloatingActionContentWidget. Se realizan pruebas de interacción, verificando si los botones flotantes funcionan correctamente y si el estado de los puntos se actualiza adecuadamente.

## Autor

**Santiago Albisser**

Fecha: 17 de noviembre de 2024
