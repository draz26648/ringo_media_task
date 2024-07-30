import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_dev_task/core/theme/colors.dart';
import 'package:ringo_dev_task/core/theme/text_styles.dart';
import 'package:ringo_dev_task/core/utils/spacing.dart';
import 'package:ringo_dev_task/core/widgets/my_svg.dart';
import 'package:ringo_dev_task/core/widgets/primary/primary_button.dart';
import 'package:ringo_dev_task/core/widgets/primary/primary_form_field.dart';
import 'package:ringo_dev_task/features/project/logic/cubit/project_cubit.dart';
import 'package:ringo_dev_task/features/project/ui/widgets/productivity_widget.dart';
import 'package:ringo_dev_task/features/project/ui/widgets/project_app_bar.dart';
import 'package:ringo_dev_task/features/project/ui/widgets/projects_type_counter.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProjectCubit(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: ColorsManager.gray100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProjectAppBar(
                      title: 'Project Summary',
                    ),
                    verticalSpace(24),
                    const Divider(
                      color: ColorsManager.gray200,
                      thickness: 1.5,
                    ),
                    verticalSpace(24),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Search',
                            style: TextStyles.font14Black600Weight,
                          ),
                          verticalSpace(8),
                          const PrimaryTextFormField(
                            validationError: '',
                            hint: 'Search project here',
                            suffixIcon: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                MySvg(image: 'search'),
                              ],
                            ),
                          ),
                          verticalSpace(24),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ProjectsTypesCounter(
                                gradientColors: ColorsManager.blueGradient,
                                projectsCount: '10',
                                icon: 'clock',
                                description: 'Project In Progress',
                              ),
                              ProjectsTypesCounter(
                                gradientColors: ColorsManager.greenGradient,
                                projectsCount: '24',
                                icon: 'verify',
                                description: 'Project In Progress',
                              ),
                              ProjectsTypesCounter(
                                gradientColors: ColorsManager.redGradient,
                                projectsCount: '5',
                                icon: 'close_circle',
                                description: 'Project In Progress',
                              ),
                            ],
                          ),
                          verticalSpace(24),
                          PrimaryButton(
                            text: 'View All Project',
                            borderColor: ColorsManager.black,
                            isWithBorder: true,
                            textColor: ColorsManager.black,
                            backgroundColor: ColorsManager.gray100,
                            borderWidth: 1.5.w,
                            onPressed: () {},
                          ),
                          verticalSpace(24),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Productivity',
                          style: TextStyles.font18Weight700Black,
                        ),
                        InkWell(
                          onTap: () {},
                          child: const MySvg(image: 'more'),
                        ),
                      ],
                    ),
                    verticalSpace(36),
                    BlocBuilder<ProjectCubit, ProjectState>(
                      builder: (context, state) {
                        return SizedBox(
                          height: 180.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                context.read<ProjectCubit>().months.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(right: 8.w),
                                child: ProductivityWidget(
                                  index: index,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
