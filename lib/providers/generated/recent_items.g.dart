// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../recent_items.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RecentItems)
const recentItemsProvider = RecentItemsProvider._();

final class RecentItemsProvider
    extends $NotifierProvider<RecentItems, List<RecentItem>> {
  const RecentItemsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'recentItemsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$recentItemsHash();

  @$internal
  @override
  RecentItems create() => RecentItems();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<RecentItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<RecentItem>>(value),
    );
  }
}

String _$recentItemsHash() => r'938a0c49fb84534d4970888dcce8ff544c149100';

abstract class _$RecentItems extends $Notifier<List<RecentItem>> {
  List<RecentItem> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<RecentItem>, List<RecentItem>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<RecentItem>, List<RecentItem>>,
        List<RecentItem>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
