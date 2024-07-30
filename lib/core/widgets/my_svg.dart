import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MySvg extends StatelessWidget {
  final String image;
  final ColorFilter? colorFilter;
  final Color? color;
  final bool rotate;
  final int rotationValue;
  final double? width;
  final double? height;
  final bool isImage;
  final BoxFit fit;

  const MySvg({
    super.key,
    required this.image,
    this.colorFilter,
    this.color,
    this.rotate = false,
    this.rotationValue = 2,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.isImage = false,
  });

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: rotate
          ? Directionality.of(context) == TextDirection.rtl
              ? rotationValue
              : 0
          : 0,
      child: SvgPicture.asset(
        isImage ? 'assets/images/$image.svg' : 'assets/icons/$image.svg',
        width: width?.w,
        height: height?.h,
        color: color,
        colorFilter: colorFilter,
        fit: fit,
      ),
    );
  }
}
