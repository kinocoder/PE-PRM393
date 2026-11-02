import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/model/work.dart';
import '../../../data/repository/work_repository.dart';

part 'work_view_model.g.dart';

@riverpod
class WorkViewModel extends _$WorkViewModel {
  @override
  Future<List<Work>> build() async {
    final repo = ref.read(workRepositoryProvider);
    return repo.getWorks();
  }

  Future<void> updateWork(Work user) async {
    final repo = ref.read(workRepositoryProvider);
    await repo.updateWork(user);
    ref.invalidateSelf();
  }
}
