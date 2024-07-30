import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_dev_task/core/theme/colors.dart';
import 'package:ringo_dev_task/features/calender/logic/cubit/calender_cubit.dart';
import 'package:ringo_dev_task/features/calender/ui/widgets/schedule_task_item.dart';

class TimeList extends StatelessWidget {
  const TimeList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalenderCubit, CalenderState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount:
              context.read<CalenderCubit>().tasks.keys.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: 8.h, left: 24.w, right: 24.w),
              child: ScheduleTaskItem(
                time: context
                    .read<CalenderCubit>()
                    .tasks
                    .keys
                    .toList()[index],
                title: context
                        .read<CalenderCubit>()
                        .tasks
                        .values
                        .toList()[index]
                        ?.title ??
                    '',
                constrastColor: context
                        .read<CalenderCubit>()
                        .tasks
                        .values
                        .toList()[index]
                        ?.constrastColor ??
                    ColorsManager.black,
                backgroundColor: context
                        .read<CalenderCubit>()
                        .tasks
                        .values
                        .toList()[index]
                        ?.backgroundColor ??
                    ColorsManager.black,
                startTime: context
                        .read<CalenderCubit>()
                        .tasks
                        .values
                        .toList()[index]
                        ?.startTime ??
                    '',
                endTime: context
                        .read<CalenderCubit>()
                        .tasks
                        .values
                        .toList()[index]
                        ?.endTime ??
                    '',
                isHasTask: context
                        .read<CalenderCubit>()
                        .tasks
                        .values
                        .toList()[index] !=
                    null,
              ),
            );
          },
        );
      },
    );
  }
}
