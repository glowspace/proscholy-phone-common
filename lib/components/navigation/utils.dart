import 'package:flutter/material.dart';
import 'package:proscholy_common/utils/extensions.dart';

void onDestinationSelected(BuildContext context, int index) {
  if (index == 1) {
    context.push('/search');
  } else if (index == 2) {
    context.push('/playlists');
  } else {
    context.popUntil('/');
  }
}
