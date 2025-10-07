import 'package:flutter/material.dart';
import 'package:proscholy_common/models/bible_passage.dart';
import 'package:proscholy_common/models/user_text.dart';
import 'package:proscholy_common/models/model.dart';
import 'package:proscholy_common/models/playlist.dart';
import 'package:proscholy_common/models/song_lyric.dart';
import 'package:proscholy_common/models/songbook.dart';
import 'package:proscholy_common/views/bible_passage.dart';

extension RecentItemView on RecentItem {
  IconData get icon => map(
        biblePassage: (_) => Icons.book_outlined,
        userText: (_) => Icons.edit_note,
        playlist: (_) => Icons.playlist_play_rounded,
        songbook: (_) => Icons.book,
        songLyric: (_) => Icons.music_note,
      );

  String get title => map(
        biblePassage: (biblePassage) => biblePassage.name,
        userText: (userText) => userText.name,
        playlist: (playlist) => playlist.name,
        songbook: (songbook) => songbook.name,
        songLyric: (songLyric) => songLyric.name,
      );

  T map<T>({
    required T Function(BiblePassage) biblePassage,
    required T Function(UserText) userText,
    required T Function(Playlist) playlist,
    required T Function(Songbook) songbook,
    required T Function(SongLyric) songLyric,
  }) =>
      switch (this) {
        BiblePassage value => biblePassage(value),
        UserText value => userText(value),
        Playlist value => playlist(value),
        Songbook value => songbook(value),
        SongLyric value => songLyric(value),
        _ => throw UnimplementedError('$this is not supported `RecentItem`'),
      };
}
