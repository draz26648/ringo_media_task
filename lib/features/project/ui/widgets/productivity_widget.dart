import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_dev_task/core/theme/colors.dart';
import 'package:ringo_dev_task/core/theme/text_styles.dart';
import 'package:ringo_dev_task/core/utils/spacing.dart';
import 'package:ringo_dev_task/features/project/logic/cubit/project_cubit.dart';

class ProductivityWidget extends StatelessWidget {
  final int index;
  const ProductivityWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (context
                .read<ProjectCubit>()
                .selectedIndex ==
            index) ...{
          Tooltip(
            message: 'Text',
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 4.h,
              ),
              decoration: BoxDecoration(
                color: ColorsManager.black,
                borderRadius:
                    BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: ColorsManager.black
                        .withOpacity(0.5),
                    blurRadius: 2,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Text(
                context
                    .read<ProjectCubit>()
                    .getPercetageValue(index),
                style:
                    TextStyles.font16White700Weight,
              ),
            ),
          ),
          verticalSpace(14),
        },
        InkWell(
          onTap: () {
            context
                .read<ProjectCubit>()
                .changeSelectedIndex(index);
          },
          child: Container(
            width: 48.w,
            decoration: BoxDecoration(
              color: context
                          .read<ProjectCubit>()
                          .selectedIndex ==
                      index
                  ? ColorsManager.black
                  : null,
              gradient: context
                          .read<ProjectCubit>()
                          .selectedIndex ==
                      index
                  ? null
                  : LinearGradient(
                      colors: ColorsManager
                          .grayGradient,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                topRight: Radius.circular(8.r),
              ),
            ),
            child: verticalSpace(context
                .read<ProjectCubit>()
                .getRandomeValueBasedOnIndex(
                    index)),
          ),
        ),
        verticalSpace(12),
        Text(
          context
              .read<ProjectCubit>()
              .months[index],
          style: context
                      .read<ProjectCubit>()
                      .selectedIndex ==
                  index
              ? TextStyles.font14Black500Weight
              : TextStyles.font14gray500Weight,
        )
      ],
    );
  }
}
