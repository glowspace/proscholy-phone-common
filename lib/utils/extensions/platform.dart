import 'package:flutter/foundation.dart';

extension PlatformExtension on TargetPlatform {
  bool get isAndroid => this == TargetPlatform.android;
  bool get isIos => this == TargetPlatform.iOS;
}
