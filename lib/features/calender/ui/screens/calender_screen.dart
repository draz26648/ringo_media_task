import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_dev_task/core/theme/colors.dart';
import 'package:ringo_dev_task/core/theme/text_styles.dart';
import 'package:ringo_dev_task/core/utils/spacing.dart';
import 'package:ringo_dev_task/core/widgets/my_svg.dart';
import 'package:ringo_dev_task/features/calender/logic/cubit/calender_cubit.dart';
import 'package:ringo_dev_task/features/calender/ui/widgets/tab_item.dart';
import 'package:ringo_dev_task/features/calender/ui/widgets/taskItem.dart';
import 'package:ringo_dev_task/features/calender/ui/widgets/task_list.dart';
import 'package:ringo_dev_task/features/calender/ui/widgets/time_list.dart';
import 'package:ringo_dev_task/features/project/ui/widgets/project_app_bar.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  final DatePickerController _controller = DatePickerController();
  int _selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalenderCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                color: ColorsManager.gray100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProjectAppBar(
                      title: 'Calendar',
                    ),
                    verticalSpace(24),
                    const Divider(
                      color: ColorsManager.gray200,
                      thickness: 1.5,
                    ),
                    verticalSpace(24),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        children: [
                          const Text(
                            'January 2023',
                            style: TextStyles.font18Weight700Black,
                          ),
                          horizontalSpace(8),
                          const MySvg(image: 'arrow_down'),
                          const Spacer(),
                          InkWell(
                              onTap: () {
                                _controller.animateToSelection();
                              },
                              child: const MySvg(image: 'rounded_arrow_left')),
                          horizontalSpace(8),
                          InkWell(
                            onTap: () {
                              _controller.animateToSelection();
                            },
                            child: const MySvg(image: 'rounded_arrow_right'),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(24),
                    DatePicker(
                      DateTime.now(),
                      controller: _controller,
                      initialSelectedDate: DateTime.now(),
                      selectionColor: ColorsManager.black,
                      deactivatedColor: Colors.white,
                      selectedTextColor: Colors.white,
                      width: 48.w,
                      height: 93.h,
                      dateTextStyle: TextStyles.font16Black700Weight,
                      onDateChange: (date) {},
                    ),
                    verticalSpace(24),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        children: [
                          Expanded(
                            child: TabItem(
                              onTap: () {
                                setState(() {
                                  _selectedTabIndex = 0;
                                });
                              },
                              isSelected: _selectedTabIndex == 0,
                              title: 'Schedule',
                            ),
                          ),
                          Expanded(
                            child: TabItem(
                              onTap: () {
                                setState(() {
                                  _selectedTabIndex = 1;
                                });
                              },
                              isSelected: _selectedTabIndex == 1,
                              title: 'Task',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(24),
              Expanded(
                child: setupTabContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget setupTabContent() {
    if (_selectedTabIndex == 0) {
      return const TimeList();
    } else {
      return const TaskList();
    }
  }
}
