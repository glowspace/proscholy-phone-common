import 'package:proscholy_common/models/external.dart';

// `publicName` property of `External` is in this format "(NAME | AUTHOR_NAME)", this regex will extract only NAME from this
final RegExp _nameRE = RegExp(r'\(([^|]+\|\s?)?(.+)\)');

extension ExternalView on External {
  String get name {
    final name = _nameRE.firstMatch(publicName)?.group(2) ?? publicName;

    return switch (mediaType) {
      MediaType.pdf || MediaType.jpg => mediaId ?? name,
      _ => name,
    };
  }

  bool get isFile => mediaType == MediaType.pdf || mediaType == MediaType.jpg;
  bool get isRecording => mediaType == MediaType.youtube || mediaType == MediaType.mp3;
}
