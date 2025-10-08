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
