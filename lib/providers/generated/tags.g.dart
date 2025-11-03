// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../tags.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
