<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

# configuracion del proyecto para android
crear carpeta "fphi-core-widget-android"
- agregar "build.gradle" 
    configurations.maybeCreate("default")
    artifacts.add("default", file('fphi-core-widget-android.aar'))
- agregar "fphi-selphi-widget-android.aar"

crear carpeta "fphi-selphi-widget-android"
- agregar "build.gradle" 
    configurations.maybeCreate("default")
    artifacts.add("default", file('fphi-selphi-widget-android.aar'))
- agregar "fphi-selphi-widget-android.aar"


# ejecutar
flutter run --no-sound-null-safety

flutter build apk --split-per-abi --no-sound-null-safety

flutter build apk --release --no-sound-null-safety