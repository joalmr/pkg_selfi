import 'dart:convert';
import 'dart:core';
import 'package:selphi_face_plugin/SelphiFaceFinishStatus.dart';
import 'package:selphi_face_plugin/SelphiFaceErrorType.dart';

class SelphiFaceResult {
  final SelphiFaceFinishStatus? finishStatus;
  final SelphiFaceErrorType? errorDiagnostic;
  final String? errorMessage;
  final String? templateRaw;
  final double? eyeGlassesScore;
  final double? templateScore;
  final String? qrData;
  final String? bestImage;
  final String? bestImageCropped;

  const SelphiFaceResult({
    this.finishStatus,
    this.errorDiagnostic,
    this.errorMessage,
    this.templateRaw,
    this.eyeGlassesScore,
    this.templateScore,
    this.qrData,
    this.bestImage,
    this.bestImageCropped,
  });

  Map<String, dynamic> toMap() {
    return {
      'finishStatus': finishStatus!.toInt(),
      'errorDiagnostic': errorDiagnostic!.toInt(),
      'errorMessage': errorMessage,
      'templateRaw': templateRaw,
      'eyeGlassesScore': eyeGlassesScore,
      'templateScore': templateScore,
      'qrData': qrData,
      'bestImage': bestImage,
      'bestImageCropped': bestImageCropped,
    };
  }

  static SelphiFaceResult? fromMap(Map<dynamic, dynamic> map) {
    if (map == null) return null;

    return SelphiFaceResult(
      finishStatus: SelphiFaceFinishStatus.getEnum(map['finishStatus']),
      errorDiagnostic: SelphiFaceErrorType.getEnum(map['errorDiagnostic']),
      errorMessage: map['errorMessage'],
      templateRaw: map['templateRaw'],
      eyeGlassesScore: map['eyeGlassesScore'],
      templateScore: map['templateScore'],
      qrData: map['qrData'],
      bestImage: map['bestImage'],
      bestImageCropped: map['bestImageCropped'],
    );
  }

  @override
  String toString() {
    return 'SelphiFaceResult(finishStatus: $finishStatus, errorDiagnostic: $errorDiagnostic, errorMessage: $errorMessage, templateRaw: $templateRaw, eyeGlassesScore: $eyeGlassesScore, templateScore: $templateScore, qrData: $qrData, bestImage: $bestImage, bestImageCropped: $bestImageCropped)';
  }
}
