import 'package:collection/collection.dart';
import 'package:proscholy_common/providers/song_lyrics_search.dart';
import 'package:proscholy_common/utils/extensions/store.dart';
import 'package:proscholy_common/views/song_lyric.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:proscholy_common/models/generated/objectbox.g.dart';
import 'package:proscholy_common/models/tag.dart';
import 'package:proscholy_common/providers/app_dependencies.dart';
import 'package:proscholy_common/providers/playlists.dart';
import 'package:proscholy_common/providers/song_lyrics.dart';
import 'package:proscholy_common/providers/songbooks.dart';

part 'generated/tags.g.dart';

@riverpod
Tag? tag(Ref ref, int id) {
  if (id == 0) return null;

  return ref.read(appDependenciesProvider).store.box<Tag>().get(id);
}

// provides tags for given `tagType`
// for songbooks, playlists and languages it creates corresponding tags,
// remaining tags are queried from objectbox store
@riverpod
List<Tag> tags(Ref ref, TagType tagType) {
  switch (tagType) {
    case TagType.songbook:
      final songbooks = ref.watch(songbooksProvider);

      return songbooks.map((songbook) => Tag.fromSongbook(songbook)).toList();
    case TagType.playlist:
      final playlists = [ref.read(favoritePlaylistProvider)] + ref.watch(playlistsProvider);

      return playlists.map((playlist) => Tag.fromPlaylist(playlist)).toList();
    case TagType.language:
      final languageCounts = <String, int>{};

      for (final songLyric in ref.watch(songLyricsProvider)) {
        languageCounts[songLyric.langDescription] = (languageCounts[songLyric.langDescription] ?? 0) + 1;
      }

      final languages = languageCounts.keys.sorted((a, b) => languageCounts[b]!.compareTo(languageCounts[a]!));

      return [for (final (i, language) in languages.indexed) Tag.fromLanguage(i, language, languageCounts[language]!)];
    default:
      final tags = ref
          .watch(appDependenciesProvider)
          .store
          .query(
            condition: Tag_.dbType.equals(tagType.rawValue).and(Tag_.songLyricsCount.greaterThan(0)),
          );

      return tags;
  }
}

