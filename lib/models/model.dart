import 'package:objectbox/objectbox.dart';
import 'package:proscholy_common/models/song_lyric.dart';

abstract class Record {
  ToOne<SongLyric> get songLyric;
}

abstract class SongsList {
  String get name;

  List<Record> get records;
}

abstract class Model {
  int get id;

  const Model();

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other is Model && runtimeType == other.runtimeType && id == other.id);
  }
}

mixin ContentItem on Model {}

mixin RecentItem on Model {}
