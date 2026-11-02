// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WorkViewModel)
final workViewModelProvider = WorkViewModelProvider._();

final class WorkViewModelProvider
    extends $AsyncNotifierProvider<WorkViewModel, List<Work>> {
  WorkViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'workViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$workViewModelHash();

  @$internal
  @override
  WorkViewModel create() => WorkViewModel();
}

String _$workViewModelHash() => r'17f85b5fad2bfa3d9d72f41e92c7373a484536d9';

abstract class _$WorkViewModel extends $AsyncNotifier<List<Work>> {
  FutureOr<List<Work>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Work>>, List<Work>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Work>>, List<Work>>,
              AsyncValue<List<Work>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
