import 'package:proscholy_common/models/external.dart';
import 'package:proscholy_common/models/playlist.dart';
import 'package:proscholy_common/models/song_lyric.dart';
import 'package:proscholy_common/views/external.dart';

final _bAccidentalsRE = RegExp(r'\[(B|S|.b|.s)\]');

const _langCodeToNameMap = {
  "cs": "čeština",
  "sk": "slovenština",
  "en": "angličtina",
  "la": "latina",
  "pl": "polština",
  "de": "němčina",
  "fr": "francouzština",
  "es": "španělština",
  "pt": "portugalština",
  "it": "italština",
  "sv": "svahilština",
  "he": "hebrejština",
  "cr": "chorvatština",
  "cu": "staroslověnština",
  "mixed": "vícejazyčná píseň"
};

extension SongLyricView on SongLyric {
  // FIXME: should be true also if there are valid svg notes
  bool get shouldAppearToUser => hasLyrics || hasFiles || hasRecordings;

  bool get hasLyrics => lyrics.isNotEmpty;
  // temporary fix, until API provides correct value
  bool get hasChords => lyrics.contains('[');

  bool get hasTranslations => song.target?.hasTranslations ?? false;

  bool get hasFiles => externals.any((external) => external.isFile);
  bool get hasRecordings => externals.any((external) => external.isRecording);

  bool get hasTags => tags.isNotEmpty;
  bool get hasSongbooks => songbookRecords.isNotEmpty;
  bool get hasHymnology => hymnology.isNotEmpty;

  bool get isFavorite =>
      playlistRecords.any((playlistRecord) => playlistRecord.playlist.targetId == favoritesPlaylistId);

  int get defaultAccidentals => _bAccidentalsRE.hasMatch(lyrics) ? 1 : 0;

  List<External> get files => externals.where((external) => external.isFile).toList();

  String get langDescription => _langCodeToNameMap[lang] ?? lang;

  String get authorsText {
    if (type == SongLyricType.original) {
      if (authors.isEmpty) {
        return 'Autor neznámý';
      } else if (authors.length == 1) {
        return 'Autor: $_authorsNames';
      } else {
        return 'Autoři: $_authorsNames';
      }
    } else {
      final original = song.target?.original;
      final String originalText;

      if (original != null) {
        originalText = 'Originál: ${original.name}\n${original.authorsText}, ';
      } else {
        originalText = '';
      }

      if (authors.isEmpty) {
        return '${originalText}Autor překladu neznámý';
      } else if (authors.length == 1) {
        return '${originalText}Autor překladu: $_authorsNames';
      } else {
        return '${originalText}Autoři překladu: $_authorsNames';
      }
    }
  }

  String get _authorsNames => authors.map((author) => author.name).join(', ');
}
