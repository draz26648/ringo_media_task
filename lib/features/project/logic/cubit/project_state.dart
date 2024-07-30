part of 'project_cubit.dart';

@freezed
class ProjectState with _$ProjectState {
  const factory ProjectState.initial() = _Initial;

  const factory ProjectState.selectedIndexChangeLoading() = SelectedIndexChangeLoading;

  const factory ProjectState.selectedIndexChanged() = SelectedIndexChanged;
}
