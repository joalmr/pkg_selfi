import 'package:dartz/dartz.dart';
import 'package:selphi_face_plugin/SelphiFaceConfiguration.dart';
import 'package:selphi_face_plugin/SelphiFaceLivenessMode.dart';
import 'package:selphi_face_plugin/selphi_face_plugin.dart';
import 'SelphiFaceResult.dart';

/// This sample class calls the Selphi Plugin and launch the native widget. Return the result to the UI
class SelphiFaceWidget {
  Future<Either<Exception, SelphiFaceResult>> launchSelphiAuthenticate(
      String resourcesPath) async {
    return launchSelphiAuthenticateWithConfiguration(
        resourcesPath, createStandardConfiguration());
  }

  Future<Either<Exception, SelphiFaceResult>>
      launchSelphiAuthenticateWithConfiguration(
          String resourcesPath, SelphiFaceConfiguration configuration) async {
    try {
      final Map resultJson = await SelphiFacePlugin.startSelphiFaceWidget(
          resourcesPath: resourcesPath,
          widgetConfigurationJSON: createStandardConfiguration());

      if (resultJson != null)
        return Right(SelphiFaceResult.fromMap(resultJson)!);
      else
        throw Exception('Plugin internal error');
    } on Exception catch (e) {
      return (Left(e));
    }
  }

  /// Sample of standard plugin configuration
  SelphiFaceConfiguration createStandardConfiguration() {
    SelphiFaceConfiguration configurationWidget;
    configurationWidget = SelphiFaceConfiguration();
    configurationWidget.livenessMode =
        SelphiFaceLivenessMode.LM_PASSIVE; // Liveness mode
    configurationWidget.fullscreen = true;
    configurationWidget.enableImages = false;
    configurationWidget.jpgQuality = 0.8;
    return configurationWidget;
  }
}
