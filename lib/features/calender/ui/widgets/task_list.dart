
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_dev_task/features/calender/ui/widgets/taskItem.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      itemBuilder: (context, index) {
        return const TaskItem();
      },
    );
  }
}