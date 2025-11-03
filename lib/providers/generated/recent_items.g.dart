// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../recent_items.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RecentItemsNotifier)
const recentItemsProvider = RecentItemsNotifierProvider._();

final class RecentItemsNotifierProvider
    extends $NotifierProvider<RecentItemsNotifier, List<RecentItem>> {
  const RecentItemsNotifierProvider._()
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
  String debugGetCreateSourceHash() => _$recentItemsNotifierHash();

  @$internal
  @override
  RecentItemsNotifier create() => RecentItemsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<RecentItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<RecentItem>>(value),
    );
  }
}

String _$recentItemsNotifierHash() =>
    r'fc0ed59d933ea89b48a4142a3ac6f37b691b2728';

abstract class _$RecentItemsNotifier extends $Notifier<List<RecentItem>> {
  List<RecentItem> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<RecentItem>, List<RecentItem>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<RecentItem>, List<RecentItem>>,
              List<RecentItem>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
