import 'package:proscholy_common/models/song_lyric.dart';
import 'package:proscholy_common/models/playlist.dart';

extension PlaylistView on Playlist {
  bool get isEZ => id == 58;
  bool get isEK => id == 63;

  List<SongLyric> get songLyrics {
    records.sort((a, b) => a.rank.compareTo(b.rank));

    return records.where((record) => record.songLyric.targetId != 0).map((record) => record.songLyric.target!).toList();
  }
}
