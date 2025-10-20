import 'package:flutter/widgets.dart';
import 'package:proscholy_common/constants.dart';

extension MediaQueryExtension on MediaQueryData {
  bool get isTablet => size.width > kTabletSizeBreakpoint && size.height > kTabletSizeBreakpoint;
}
