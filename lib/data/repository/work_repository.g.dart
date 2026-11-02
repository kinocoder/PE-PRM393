// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(workRepository)
final workRepositoryProvider = WorkRepositoryProvider._();

final class WorkRepositoryProvider
    extends $FunctionalProvider<WorkRepository, WorkRepository, WorkRepository>
    with $Provider<WorkRepository> {
  WorkRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'workRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$workRepositoryHash();

  @$internal
  @override
  $ProviderElement<WorkRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WorkRepository create(Ref ref) {
    return workRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WorkRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WorkRepository>(value),
    );
  }
}

String _$workRepositoryHash() => r'2dd2b0d788cf7ff2c7acac849b5d0a0ef2f37952';
