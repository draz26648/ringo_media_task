import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_dev_task/core/theme/text_styles.dart';
import 'package:ringo_dev_task/core/utils/spacing.dart';
import 'package:ringo_dev_task/core/widgets/my_svg.dart';

class ProjectsTypesCounter extends StatelessWidget {
  final List<Color> gradientColors;
  final String projectsCount;
  final String description;
  final String icon;
  const ProjectsTypesCounter({
    super.key,
    required this.gradientColors,
    required this.projectsCount,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.bottomRight,
              end: Alignment.topLeft),
          boxShadow: [
            BoxShadow(
              color: gradientColors.last.withOpacity(0.3),
              offset: const Offset(0, 20),
              blurRadius: 20,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                projectsCount,
                style: TextStyles.font24White700Weight,
              ),
              horizontalSpace(34),
              MySvg(image: icon),
            ],
          ),
          verticalSpace(8),
          SizedBox(
            width: 56.w,
            child: Text(
              description,
              style: TextStyles.font12Weight500White,
            ),
          )
        ],
      ),
    );
  }
}
