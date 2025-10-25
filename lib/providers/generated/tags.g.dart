// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../tags.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tag)
const tagProvider = TagFamily._();

final class TagProvider extends $FunctionalProvider<Tag?, Tag?, Tag?>
    with $Provider<Tag?> {
  const TagProvider._({
    required TagFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'tagProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tagHash();

  @override
  String toString() {
    return r'tagProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Tag?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Tag? create(Ref ref) {
    final argument = this.argument as int;
    return tag(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Tag? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Tag?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TagProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tagHash() => r'd818ea9728dac6f8c24cf4751fa59a04602c9b90';

final class TagFamily extends $Family
    with $FunctionalFamilyOverride<Tag?, int> {
  const TagFamily._()
    : super(
        retry: null,
        name: r'tagProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TagProvider call(int id) => TagProvider._(argument: id, from: this);

  @override
  String toString() => r'tagProvider';
}

@ProviderFor(tags)
const tagsProvider = TagsFamily._();

final class TagsProvider
    extends $FunctionalProvider<List<Tag>, List<Tag>, List<Tag>>
    with $Provider<List<Tag>> {
  const TagsProvider._({
    required TagsFamily super.from,
    required TagType super.argument,
  }) : super(
         retry: null,
         name: r'tagsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tagsHash();

  @override
  String toString() {
    return r'tagsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<Tag>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Tag> create(Ref ref) {
    final argument = this.argument as TagType;
    return tags(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Tag> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Tag>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TagsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tagsHash() => r'0a54d613bce4da7533fd567af019aef21bd00640';

final class TagsFamily extends $Family
    with $FunctionalFamilyOverride<List<Tag>, TagType> {
  const TagsFamily._()
    : super(
        retry: null,
        name: r'tagsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TagsProvider call(TagType tagType) =>
      TagsProvider._(argument: tagType, from: this);

  @override
  String toString() => r'tagsProvider';
}
