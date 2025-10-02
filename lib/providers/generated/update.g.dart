// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../update.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(update)
const updateProvider = UpdateProvider._();

final class UpdateProvider extends $FunctionalProvider<AsyncValue<UpdateStatus>,
        UpdateStatus, Stream<UpdateStatus>>
    with $FutureModifier<UpdateStatus>, $StreamProvider<UpdateStatus> {
  const UpdateProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'updateProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$updateHash();

  @$internal
  @override
  $StreamProviderElement<UpdateStatus> $createElement(
          $ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<UpdateStatus> create(Ref ref) {
    return update(ref);
  }
}

String _$updateHash() => r'83dd3f007e8017e976060f7c511ac8794496cfc1';
