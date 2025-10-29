// ignore_for_file: invalid_use_of_protected_member

import 'dart:convert';
import 'dart:typed_data';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:proscholy_common/models/bible_passage.dart';
import 'package:proscholy_common/models/playlist.dart';
import 'package:proscholy_common/models/song_lyric.dart';
import 'package:proscholy_common/models/user_text.dart';
import 'package:proscholy_common/providers/bible_passage.dart';
import 'package:proscholy_common/providers/playlists.dart';
import 'package:proscholy_common/providers/song_lyrics.dart';
import 'package:proscholy_common/providers/user_text.dart';
import 'package:proscholy_common/utils/extensions/build_context.dart';
import 'package:share_plus/share_plus.dart';

const _emptyPlaylistNameMessage = 'Název playlistu je prázdný';
const _playlistWithSameNameMessage = 'Playlist s tímto názvem již existuje';

extension PlaylistDialogsExtension on Playlist {
  static Future<Playlist?> createPlaylistWithDialog(BuildContext context, {SongLyric? songLyric}) async {
    final results = await showTextInputDialog(
      context: context,
      title: 'Nový playlist',
      okLabel: 'Vytvořit',
      cancelLabel: 'Zrušit',
      textFields: [
        DialogTextField(
          hintText: 'Název',
          validator: _playlistNameValidator(context.read(playlistsProvider)),
        ),
      ],
    );

    if (results != null && context.mounted) {
      final playlist = context.read(playlistsProvider.notifier).addPlaylist(Playlist.empty(results.first));

      if (songLyric != null) {
        context.read(playlistProvider(playlist).notifier).addSongLyric(songLyric);
        context.popAndPush('/playlist', arguments: playlist);
      }

      return playlist;
    }

    return null;
  }

  Future<Playlist?> renameWithDialog(BuildContext context) async {
    final results = await showTextInputDialog(
      context: context,
      title: 'Přejmenovat playlist',
      okLabel: 'Přejmenovat',
      cancelLabel: 'Zrušit',
      textFields: [
        DialogTextField(
          hintText: 'Název',
          initialText: name,
          validator: _playlistNameValidator(context.read(playlistsProvider), originalPlaylist: this),
        ),
      ],
    );

    if (results != null && context.mounted) { return context.read(playlistProvider(this).notifier).rename(results.first);
    }

    return null;
  }

  Future<Playlist?> duplicateWithDialog(BuildContext context) async {
    final results = await showTextInputDialog(
      context: context,
      title: 'Duplikovat playlist',
      okLabel: 'Vytvořit',
      cancelLabel: 'Zrušit',
      textFields: [
        DialogTextField(
          hintText: 'Název',
          initialText: '$name (kopie)',
          validator: _playlistNameValidator(context.read(playlistsProvider)),
        ),
      ],
    );

    if (results != null && context.mounted) {
      return context.read(playlistProvider(this).notifier).duplicate(results.first);
    }

    return null;
  }

  Future<bool> removeWithDialog(BuildContext context) async {
    final result = await showOkCancelAlertDialog(
      context: context,
      title: 'Smazat playlist',
      okLabel: 'Smazat',
      isDestructiveAction: true,
      cancelLabel: 'Zrušit',
    );

    if (result == OkCancelResult.ok && context.mounted) {
      final removed = context.read(playlistProvider(this).notifier).remove();

      if (context.isPlaylist) context.pop();

      return removed;
    }

    return false;
  }

  Future<void> share(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox;

    await SharePlus.instance.share(
      ShareParams(
        files: [XFile.fromData(serialize(context), mimeType: 'application/json')],
        fileNameOverrides: ['$name.proscholy'],
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
      ),
    );
  }

  static Future<Playlist?> acceptPlaylistWithDialog(
    BuildContext context,
    Map<String, dynamic> playlistJson,
  ) async {
    final results = await showTextInputDialog(
      context: context,
      title: 'Přidat sdílený playlist',
      okLabel: 'Přidat',
      cancelLabel: 'Zrušit',
      textFields: [
        DialogTextField(
          hintText: 'Název',
          initialText: playlistJson['name'],
          validator: _playlistNameValidator(context.read(playlistsProvider)),
        ),
      ],
    );

    if (results != null && context.mounted) {
      final playlist = _PlaylistSerialization.deserialize(context, results.first, playlistJson);

      context.push('/playlist', arguments: playlist);

      return playlist;
    }

    return null;
  }
}

extension _PlaylistSerialization on Playlist {
  static Playlist deserialize(BuildContext context, String name, Map<String, dynamic> json) {
    final playlist = context.read(playlistsProvider.notifier).addPlaylist(Playlist.empty(name));
    final playlistNotifier = context.read(playlistProvider(playlist).notifier);

    for (final recordJson in json['records']) {
      final rank = recordJson['rank'];

      if (recordJson['bible_verse'] case final biblePassageJson?) {
        final biblePassage = BiblePassage(
          book: biblePassageJson['book'],
          chapter: biblePassageJson['chapter'],
          startVerse: biblePassageJson['start_verse'],
          endVerse: biblePassageJson['end_verse'],
          text: biblePassageJson['text'],
        );

        playlistNotifier.addBiblePassage(biblePassage, atRank: rank);
      } else if (recordJson['song_lyric'] case final songLyricJson?) {
        final songLyric = context.read(songLyricProvider(songLyricJson['id']));

        if (songLyric == null) {
          // TODO: log this somewhere, maybe also inform user?
          continue;
        }

        playlistNotifier.addSongLyric(songLyric, atRank: rank);
      } else if (recordJson['custom_text'] case final userTextJson?) {
        final userText = UserText(
          name: userTextJson['name'],
          content: userTextJson['content'],
        );

        playlistNotifier.addUserText(userText, atRank: rank);
      }
    }

    return playlist;
  }

  Uint8List serialize(BuildContext context) {
    final playlistAsMap = {
      'name': name,
      'records': [
        for (final record in records)
          {
            'rank': record.rank,
            if (context.read(biblePassageProvider(record.biblePassage.targetId)) case final biblePassage?)
              'bible_verse': {
                'book': biblePassage.book,
                'chapter': biblePassage.chapter,
                'start_verse': biblePassage.startVerse,
                'end_verse': biblePassage.endVerse,
                'text': biblePassage.text,
              }
            else if (record.songLyric.targetId != 0)
              'song_lyric': {
                'id': record.songLyric.targetId,
                // TODO: add also settings
              }
            else if (context.read(userTextProvider(record.userText.targetId)) case final userText?)
              'custom_text': {
                'name': userText.name,
                'content': userText.content,
              },
          },
      ],
    };

    return utf8.encode(jsonEncode(playlistAsMap));
  }
}

String? Function(String?) _playlistNameValidator(List<Playlist> playlists, {Playlist? originalPlaylist}) {
  return (text) => (text?.isEmpty ?? true)
      ? _emptyPlaylistNameMessage
      : (playlists.any((playlist) => playlist.name == text && playlist != originalPlaylist)
            ? _playlistWithSameNameMessage
            : null);
}
