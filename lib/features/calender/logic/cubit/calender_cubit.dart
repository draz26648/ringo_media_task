import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ringo_dev_task/core/theme/colors.dart';
import 'package:ringo_dev_task/features/calender/data/models/calender_model.dart';

part 'calender_state.dart';
part 'calender_cubit.freezed.dart';

class CalenderCubit extends Cubit<CalenderState> {
  CalenderCubit() : super(const CalenderState.initial());


  Map<String,CalenderModel?> tasks = {
    '12:00 AM':CalenderModel(
      startTime: '12:00 AM',
      endTime: '01:00 AM',
      title: 'Meeting with client',
      backgroundColor: ColorsManager.greenLight,
      constrastColor: ColorsManager.green,
    ), 
    '01:00 AM': null,
     '02:00 AM': CalenderModel(
      startTime: '02:00 AM',
      endTime: '03:00 AM',
      title: 'Meeting with team',
      backgroundColor: ColorsManager.orangeLight,
      constrastColor: ColorsManager.orange,
    ),
    '03:00 AM' : null,
    '04:00 AM' : null,
    '05:00 AM' : null,
    '06:00 AM' :  CalenderModel(
      startTime: '06:00 AM',
      endTime: '07:00 AM',
      title: 'Meeting with manager',
      backgroundColor: ColorsManager.purpleLight,
      constrastColor: ColorsManager.purple,
    ),
    '07:00 AM' : null,

  };
}
