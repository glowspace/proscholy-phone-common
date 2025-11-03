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

// models that have content
mixin ContentItem on Model {}

// models that can be in recent items view
mixin RecentItem on Model {}

// models that can be highlighted as selected in lists
mixin SelectedItem on Model {}
