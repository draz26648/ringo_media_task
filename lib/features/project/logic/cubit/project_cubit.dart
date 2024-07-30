import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_state.dart';
part 'project_cubit.freezed.dart';

class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit() : super(const ProjectState.initial());

  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  double maxStatisticalValue = 110;

  double minStatisticalValue = 0;

  double getRandomeValueBasedOnIndex(int index) {
    List<double> randomValues = [5, 6, 2, 8, 9, 1, 6, 7, 8, 9, 10, 3];
    double randomValue = minStatisticalValue +
        (maxStatisticalValue - minStatisticalValue) * randomValues[index] / 11;

    return randomValue;
  }

  String getPercetageValue(int index) {
    double currentValue = getRandomeValueBasedOnIndex(index);
    double percentage = (currentValue / maxStatisticalValue) * 100;
    return '${percentage.toInt()} %';
  }

  int selectedIndex = 3;

  void changeSelectedIndex(int index) {
    emit(const ProjectState.selectedIndexChangeLoading());
    selectedIndex = index;
    emit(const ProjectState.selectedIndexChanged());
  }
}
