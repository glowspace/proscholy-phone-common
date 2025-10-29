import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:proscholy_common/models/model.dart';
import 'package:proscholy_common/models/playlist_record.dart';

part 'generated/playlist.freezed.dart';

const favoritesPlaylistId = 1;
const _favoritesName = 'Písně s hvězdičkou';

@freezed
sealed class Playlist extends Model with _$Playlist, RecentItem {
  const Playlist._();

  @Entity(realClass: Playlist)
  const factory Playlist({
    @Id(assignable: true) required int id,
    @Unique(onConflict: ConflictStrategy.fail) required String name,
    required int rank,
    @Backlink() required ToMany<PlaylistRecord> records,
  }) = _Playlist;

  factory Playlist.empty(String name) => Playlist(id: 0, name: name, rank: 0, records: ToMany());

  factory Playlist.favorites() => Playlist(
    id: favoritesPlaylistId,
    name: _favoritesName,
    rank: 0,
    records: ToMany(),
  );

  bool get isFavorites => id == favoritesPlaylistId;

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other is Playlist && id == other.id && name == other.name);
  }
}
