# event_alarm_mobile

Aplicación móvil en Flutter que reproduce las pantallas de **Alarma contextual** definidas en los mockups del curso. El paquete se llama `event_alarm_mobile` (`pubspec.yaml`). En Android el `applicationId` es `co.edu.miso.event_alarm_mobile`.

Es un prototipo de interfaz: se puede navegar entre pantallas y los controles cambian de estado en el dispositivo. No hay servidor, no hay login real y no se programan alarmas del sistema.

---

## 1. Descripción

La app muestra el flujo de una alarma que reacciona a hora y a eventos (ubicación, Bluetooth, clima, calendario) y que se apaga con un reto.

Tipo de aplicación: cliente Flutter (Material 3, tema oscuro) pensado para Android. El canvas de diseño está fijado a 360×800 lógicos (`lib/shared/design_canvas.dart`).

Objetivo de esta implementación: dejar las pantallas del mockup navegables e interactivas para revisión y para entregar un APK.

Pantallas:

- Splash
- Inicio de sesión
- Lista de alarmas (home)
- Editor de alarma
- Regla de evento
- Selector de reto
- Alarma sonando

Qué sí hace (estado local con `setState`):

- Campos de texto (correo, contraseña, nombre de alarma)
- Mostrar/ocultar contraseña
- Switches de cada alarma y de opciones del editor
- Toggle a. m. / p. m.
- Selector de días
- Slider de volumen y de pasos del reto
- Selección de tipo de evento y de tipo de reto
- Botones que navegan (entrar, FAB, filas de eventos/retos, probar reto, posponer/apagar)

Qué no hace:

- No valida credenciales ni crea cuentas
- No guarda datos al cerrar la app
- No llama APIs
- No programa alarmas de Android ni envía notificaciones

El botón de iniciar sesión solo cambia a home. Los datos de las tarjetas (hora, título, etc.) están escritos en el código.

---

## 2. Tecnologías utilizadas

Según `pubspec.yaml`, `lib/app/theme.dart` y la carpeta `android/`:

| Tecnología | Uso |
| ---------- | --- |
| Flutter | Framework de la app |
| Dart (SDK `^3.12.2`) | Lenguaje |
| Material 3 | `ThemeData(useMaterial3: true)` en `lib/app/theme.dart` |
| Android | Empaquetado e instalación (`android/`) |
| `flutter_svg` 2.2.0 | Iconos SVG en `assets/icons/` |
| `cupertino_icons` 1.0.8 | Dependencia de la plantilla Flutter (la UI no usa widgets Cupertino propios) |
| `flutter_test` / `flutter_lints` | Tests y análisis estático |

No hay `go_router`, Provider, Riverpod, Firebase ni archivos `.env`.

---

## 3. Requisitos previos

Hace falta un computador con Flutter y el SDK de Android. El editor puede ser Android Studio, VS Code u otro; el SDK de Android se necesita igual para compilar e instalar.

### Flutter SDK

1. Instalar Flutter desde [https://docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install) y agregar `flutter/bin` al PATH.
2. Abrir una terminal (en Windows: PowerShell; en macOS/Linux: Terminal).
3. Comprobar:

Windows PowerShell:

```powershell
flutter --version
```

macOS/Linux:

```bash
flutter --version
```

Debe imprimir la versión de Flutter y de Dart. Este repo se desarrolló con Dart 3.12.x (el `pubspec.yaml` pide `sdk: ^3.12.2`).

### Dart

Dart viene con Flutter. No hace falta instalarlo por separado.

Windows PowerShell:

```powershell
dart --version
```

macOS/Linux:

```bash
dart --version
```

### Android Studio / Android SDK

Aunque se use otro editor, hay que instalar Android Studio (o al menos el Android SDK) para:

- Android SDK Platform (el proyecto toma `compileSdk` y `targetSdk` del Flutter instalado)
- Android SDK Build-Tools
- Android Emulator
- Platform-Tools (`adb`)

`minSdk` del proyecto es **27** (Android 8.1). El dispositivo o emulador tiene que ser API 27 o más.

### Java / JDK

Gradle está configurado con Java 17:

- `sourceCompatibility` / `targetCompatibility` = `JavaVersion.VERSION_17`
- Kotlin `jvmTarget` = `JVM_17`

en `android/app/build.gradle.kts`.

Windows PowerShell:

```powershell
java -version
```

macOS/Linux:

```bash
java -version
```

Si `flutter doctor -v` muestra otro JDK, usar el que Flutter detecte; lo importante es que compile con 17.

---

## 4. Comprobar el entorno de Flutter

Desde cualquier carpeta:

Windows PowerShell:

```powershell
flutter doctor
```

macOS/Linux:

```bash
flutter doctor
```

Interpretación rápida:

- `[✓]` o `[√]`: ese ítem está bien
- `[!]`: aviso (a veces se puede seguir)
- `[X]`: falta algo (SDK, licencias, Visual Studio solo si se quiere desktop)

Para ver rutas de SDK y Java:

Windows PowerShell:

```powershell
flutter doctor -v
```

macOS/Linux:

```bash
flutter doctor -v
```

En Android, revisar que existan toolchain y al menos un emulador o un celular conectado.

---

## 5. Descargar o abrir el proyecto

Todos los comandos de las secciones siguientes se ejecutan en la **raíz** del repo: la carpeta que contiene `pubspec.yaml`.

Estructura de esa raíz (lo que importa para levantar el proyecto):

```text
Event-Alarm-Mobile/
├── android/
├── assets/
│   ├── fonts/
│   └── icons/
├── ios/
├── lib/
├── test/
├── tooling/
├── pubspec.yaml
├── pubspec.lock
├── analysis_options.yaml
└── README.md
```

Si se clona el repositorio, entrar a esa carpeta antes de seguir. En Windows, por ejemplo:

```powershell
cd ruta\hacia\Event-Alarm-Mobile
```

---

## 6. Instalar las dependencias

`pubspec.yaml` lista los paquetes. `flutter pub get` los descarga y deja el proyecto listo para compilar. No hay `npm` ni CocoaPods obligatorios para Android.

Windows PowerShell:

```powershell
flutter pub get
```

macOS/Linux:

```bash
flutter pub get
```

Si termina bien, aparece algo como `Got dependencies!`. No hay variables de entorno ni claves que configurar.

---

## 7. Verificar los dispositivos disponibles

Windows PowerShell:

```powershell
flutter devices
```

macOS/Linux:

```bash
flutter devices
```

La lista muestra id, nombre y plataforma. Para esta entrega interesa una línea `android` (emulador o físico). También pueden salir `windows`, `chrome` o `edge`; no son el APK de Android.

### Opción A: celular Android

1. En el teléfono: Ajustes → Acerca del teléfono → tocar varias veces el número de compilación para abrir opciones de desarrollador.
2. Activar **Depuración USB**.
3. Conectar el cable.
4. Aceptar el diálogo “¿Permitir depuración USB?”.
5. Correr `flutter devices` y confirmar que el aparato aparece.

### Opción B: emulador

1. Abrir Android Studio.
2. Device Manager.
3. Crear o elegir un AVD (API 27 o superior).
4. Start.
5. Volver a `flutter devices`.

---

## 8. Ejecutar la aplicación

Con un dispositivo Android visible:

Windows PowerShell:

```powershell
flutter run
```

macOS/Linux:

```bash
flutter run
```

Flutter compila, instala y abre la app. La terminal se queda ocupada (modo debug).

Con la app corriendo, en esa misma terminal:

- `r` — hot reload (recarga el UI sin reinstalar)
- `R` — hot restart
- `q` — cierra el proceso de `flutter run`

`q` termina `flutter run`.

El flujo al abrir: splash (~3,2 s o un tap) → login → **Iniciar sesión** → home.

---

## 9. Ejecutar en un dispositivo específico

Si hay más de un destino:

```powershell
flutter devices
```

```bash
flutter devices
```

El id es la segunda columna (por ejemplo `emulator-5554`).

Windows PowerShell:

```powershell
flutter run -d emulator-5554
```

macOS/Linux:

```bash
flutter run -d emulator-5554
```

Sustituir `emulator-5554` por el id real.

---

## 10. Generar un APK

El APK es el archivo que se instala en Android sin pasar por una tienda.

Los comandos se lanzan desde la raíz (junto a `pubspec.yaml`). La salida queda en `build/app/outputs/flutter-apk/`.

### 10.1 Limpiar compilaciones anteriores

Útil si cambió el SDK, falló un build o se quiere un APK “limpio”.

Windows PowerShell:

```powershell
flutter clean
flutter pub get
```

macOS/Linux:

```bash
flutter clean
flutter pub get
```

### 10.2 APK de prueba (debug)

Windows PowerShell:

```powershell
flutter build apk --debug
```

macOS/Linux:

```bash
flutter build apk --debug
```

Sirve para instalar rápido en un emulador. No es el archivo de entrega.

Ruta:

```text
build/app/outputs/flutter-apk/app-debug.apk
```

### 10.3 APK release (el de entrega)

Windows PowerShell:

```powershell
flutter build apk --release
```

macOS/Linux:

```bash
flutter build apk --release
```

Es un solo APK (varias ABI dentro). En este proyecto el `buildType` release firma con el keystore de **debug** (`android/app/build.gradle.kts`), así que se puede instalar sin un `key.properties` propio. Para Play Store haría falta otra firma; para la entrega del curso alcanza.

Ruta:

```text
build/app/outputs/flutter-apk/app-release.apk
```

### 10.4 APK por arquitectura (opcional)

```powershell
flutter build apk --split-per-abi
```

```bash
flutter build apk --split-per-abi
```

Genera varios archivos más livianos:

- `armeabi-v7a` — celulares 32 bits
- `arm64-v8a` — la mayoría de teléfonos actuales
- `x86_64` — emuladores x86

Para **un** archivo de entrega usar `--release` sin `--split-per-abi`.

---

## 11. Localizar el APK generado

Desde la raíz:

```text
build/
└── app/
    └── outputs/
        └── flutter-apk/
            ├── app-release.apk
            └── app-debug.apk
```

`app-release.apk` es el que se copia, se sube a la carpeta compartida o se manda al evaluador.

---

## 12. Instalar manualmente el APK

### Método 1: copiar al celular

1. Generar `app-release.apk`.
2. Pasarlo por USB, Drive, correo, etc.
3. Abrirlo en el administrador de archivos.
4. Si Android pide permiso para instalar apps de esa fuente, aceptarlo.
5. Instalar.

Los nombres de las pantallas de permiso cambian según fabricante y versión.

### Método 2: ADB

Dispositivo conectado y depuración USB (o emulador encendido):

Windows PowerShell:

```powershell
adb devices
adb install .\build\app\outputs\flutter-apk\app-release.apk
```

macOS/Linux:

```bash
adb devices
adb install ./build/app/outputs/flutter-apk/app-release.apk
```

Si ya estaba instalada:

Windows PowerShell:

```powershell
adb install -r .\build\app\outputs\flutter-apk\app-release.apk
```

macOS/Linux:

```bash
adb install -r ./build/app/outputs/flutter-apk/app-release.apk
```

Si falla por firma distinta, desinstalar la app anterior e instalar de nuevo.

---

## 13. Compatibilidad con Android

En `android/app/build.gradle.kts`:

| Campo | Valor en el repo |
| ----- | ---------------- |
| `minSdk` | `27` |
| `compileSdk` | `flutter.compileSdkVersion` (lo define el Flutter instalado) |
| `targetSdk` | `flutter.targetSdkVersion` (igual) |
| `applicationId` | `co.edu.miso.event_alarm_mobile` |
| versión | `1.0.0+1` en `pubspec.yaml` (`versionName` 1.0.0, `versionCode` 1) |

- **minSdk**: versión mínima. 27 = Android 8.1. Cumple el requisito de API 27 o superior.
- **compileSdk**: API con la que se compila.
- **targetSdk**: API contra la que se declara el comportamiento en runtime.

No hay product flavors. El label del ícono en el manifiesto es `event_alarm_mobile`; el título de `MaterialApp` es `Alarma contextual`.

---

## 14. Verificar el APK antes de entregarlo

Probar el **APK**, no solo `flutter run`.

```text
[ ] flutter pub get y la app compiló.
[ ] Existe build/app/outputs/flutter-apk/app-release.apk y no está vacío.
[ ] Se instaló en un Android API 27+ (emulador o físico).
[ ] Abre: splash y luego login.
[ ] Iniciar sesión lleva a Mis alarmas.
[ ] El FAB abre Configurar alarma.
[ ] Desde el editor se llega a Regla de evento y a Cómo apagarla.
[ ] Una tarjeta de alarma (o Probar el reto ahora) abre la pantalla de alarma en curso.
[ ] Atrás / Continuar / Guardar / Apagar / Posponer responden.
[ ] Switches de alarmas y del editor cambian.
[ ] Toggle a. m. / p. m. cambia.
[ ] Se pueden marcar y desmarcar días.
[ ] El slider de volumen y el de pasos del reto se mueven.
[ ] Se puede elegir tipo de evento y tipo de reto.
[ ] El ojo de la contraseña muestra u oculta el texto.
[ ] Los campos aceptan teclado.
[ ] No hay pantallazo rojo ni overflow evidente al recorrer el flujo.
```

No hay dropdowns tipo `DropdownButton` en el código; la selección de evento y de reto es por filas/tarjetas.

---

## 15. Estructura del proyecto

```text
lib/
├── main.dart
├── app/
│   ├── app.dart
│   ├── routes.dart
│   └── theme.dart
├── design_system/
│   ├── app_assets.dart
│   ├── colors.dart
│   ├── dimensions.dart
│   ├── radii.dart
│   ├── spacing.dart
│   └── typography.dart
├── screens/
│   ├── splash/
│   ├── login/
│   ├── home/
│   ├── alarm_editor/
│   ├── event_rule/
│   ├── challenge_selector/
│   └── alarm_ringing/
├── widgets/
│   ├── atoms/
│   ├── molecules/
│   └── organisms/
└── shared/
    └── design_canvas.dart
```

- `lib/main.dart` — arranque; oculta las barras de sistema.
- `lib/app/` — `MaterialApp`, rutas y tema.
- `lib/design_system/` — colores, tipos, medidas, rutas de iconos.
- `lib/screens/` — una carpeta por pantalla.
- `lib/widgets/atoms/` — piezas chicas (texto, icono, chip de día, divisor).
- `lib/widgets/molecules/` — controles (campo, switch, slider, botón, fila de navegación).
- `lib/widgets/organisms/` — bloques (tarjeta de alarma, editor, barra superior).
- `lib/shared/design_canvas.dart` — escala el layout 360×800 al ancho del aparato.

No hay carpetas `templates/` ni `pages/`.

Otras carpetas de la raíz:

- `android/` — Gradle, manifiesto, `MainActivity`
- `ios/` — proyecto Xcode (el APK de entrega es Android)
- `assets/fonts/` y `assets/icons/`
- `test/` — `widget_test.dart` y goldens
- `tooling/pixel_audit/` — script Python de comparación visual; no entra en el APK

---

## 16. Pantallas implementadas

| Pantalla | Archivo | Qué es |
| -------- | ------- | ------ |
| Splash | `lib/screens/splash/splash_screen.dart` | Logo y texto; a los 3,2 s o con un tap pasa a login |
| Inicia sesión | `lib/screens/login/login_screen.dart` | Correo, contraseña, ojo, botón a home |
| Mis alarmas | `lib/screens/home/home_screen.dart` | Lista activa/inactiva, switches, FAB al editor; tap en tarjeta activa abre ringing |
| Configurar alarma | `lib/screens/alarm_editor/alarm_editor_screen.dart` | Hora (texto fijo 06:15), a. m./p. m., días, nombre, switches, volumen, filas a evento y reto, guardar (pop) |
| Regla de evento | `lib/screens/event_rule/event_rule_screen.dart` | Cuatro opciones; Continuar hace pop |
| Cómo apagarla | `lib/screens/challenge_selector/challenge_selector_screen.dart` | Tipos de reto, slider de pasos, switch, “Probar el reto ahora” → ringing |
| Alarma en curso | `lib/screens/alarm_ringing/alarm_ringing_screen.dart` | Posponer / Apagar vuelven a home y limpian el stack |

El avatar de perfil en home no navega. La alarma desactivada no tiene `onTap`.

---

## 17. Navegación

No se usa `go_router`. `MaterialApp` define `initialRoute: '/'` y `onGenerateRoute` en `lib/app/app.dart`. Las constantes están en `lib/app/routes.dart`:

| Constante | Ruta |
| --------- | ---- |
| `AppRoutes.splash` | `/` |
| `AppRoutes.login` | `/login` |
| `AppRoutes.home` | `/home` |
| `AppRoutes.alarmEditor` | `/alarm-editor` |
| `AppRoutes.eventRule` | `/event-rule` |
| `AppRoutes.challengeSelector` | `/challenge-selector` |
| `AppRoutes.alarmRinging` | `/alarm-ringing` |

Las transiciones duran `Duration.zero`. Se usa `Navigator.pushNamed`, `pushReplacementNamed`, `pop` y, al salir del ringing, `pushNamedAndRemoveUntil` hacia home.

```text
Splash → Login → Home
                ├─ FAB → Editor → Evento (pop)
                │              └─ Retos → Ringing → Home
                └─ tarjeta → Ringing → Home
```

---

## 18. Assets

En `pubspec.yaml`:

```yaml
assets:
  - assets/icons/
fonts:
  - family: Archivo
  - family: Manrope
```

- `assets/icons/` — SVG (`brand_mark`, chevron, retos, eventos, etc.). Las rutas están en `lib/design_system/app_assets.dart`.
- `assets/fonts/` — Archivo (400–900) y Manrope (400–700).

Los PNG de `test/goldens/` son referencia de tests, no se empaquetan como asset de la app. Las capturas de `tooling/pixel_audit/*.png` están en `.gitignore`.

---

## 19. Solución de problemas frecuentes

### `flutter` no se reconoce

Flutter no está en el PATH. Cerrar y abrir la terminal después de instalarlo, o usar la ruta completa al `flutter.bat` / binario.

### No aparece ningún dispositivo Android

```powershell
flutter devices
```

```bash
flutter devices
```

Revisar emulador encendido, cable, depuración USB y el diálogo de autorización en el teléfono.

### El proyecto recién clonado no compila

Desde la raíz:

Windows PowerShell:

```powershell
flutter clean
flutter pub get
```

macOS/Linux:

```bash
flutter clean
flutter pub get
```

### Licencias del SDK

Windows PowerShell:

```powershell
flutter doctor --android-licenses
```

macOS/Linux:

```bash
flutter doctor --android-licenses
```

Aceptar las licencias pendientes.

### Gradle / Java

Correr `flutter doctor -v` y mirar qué JDK usa Flutter. Este módulo Android espera 17. No hace falta tocar `android/gradle` si `flutter build apk` ya funciona.

### `adb install` falla por firma

Se instaló antes una build con otra clave. Desinstalar `co.edu.miso.event_alarm_mobile` e instalar el APK de nuevo.

---

## 20. Tests (opcional)

No se necesitan para generar el APK. Si se quiere comprobar el repo:

Windows PowerShell:

```powershell
flutter analyze
flutter test
```

macOS/Linux:

```bash
flutter analyze
flutter test
```

Hay tests de flujo (`test/widget_test.dart`) y goldens (`test/goldens_test.dart`).

---

## Resumen rápido para generar el APK de entrega

Trabajar en la carpeta de `pubspec.yaml`. Tener un Android API 27+ para instalar y probar el archivo.

### Windows PowerShell

```powershell
flutter doctor
flutter clean
flutter pub get
flutter build apk --release
```

Archivo:

```text
build\app\outputs\flutter-apk\app-release.apk
```

### macOS/Linux

```bash
flutter doctor
flutter clean
flutter pub get
flutter build apk --release
```

Archivo:

```text
build/app/outputs/flutter-apk/app-release.apk
```

Instalar ese APK (copia al celular o `adb install -r`), recorrer splash → login → home → editor → evento → retos → ringing y confirmar que no se cae. Ese es el archivo que se sube a la entrega.
