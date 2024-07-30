import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_dev_task/core/theme/text_styles.dart';
import 'package:ringo_dev_task/core/utils/spacing.dart';
import 'package:ringo_dev_task/core/widgets/my_svg.dart';

class ProjectAppBar extends StatelessWidget {
  final String title;
  const ProjectAppBar({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: const MySvg(image: 'menu'),
          ),
          horizontalSpace(24),
           Text(
          title  ,
            style: TextStyles.font16Black700Weight,
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: const MySvg(image: 'notifications'),
          ),
        ],
      ),
    );
  }
}
