import 'package:flutter/material.dart';
import 'package:ringo_dev_task/core/utils/constants.dart';


class CrossFade extends StatelessWidget {
  final bool animationStatus;
  final Widget shownIfFalse;
  final Widget shownIfTrue;
  final VoidCallback? onPressed;
  final Duration? duration;
  final Curve firstCurve;
  final Curve sizeCurve;
  const CrossFade({
    super.key,
    required this.animationStatus,
    required this.shownIfFalse,
    required this.shownIfTrue,
    this.onPressed,
    this.duration,
    this.firstCurve = Curves.easeIn,
    this.sizeCurve = Curves.easeInOut,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      child: AnimatedCrossFade(
        firstChild: shownIfFalse,
        secondChild: shownIfTrue,
        crossFadeState: animationStatus
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: duration ?? duration300,
        reverseDuration: duration ?? duration300,
        alignment: Alignment.center,
        firstCurve: firstCurve,
        sizeCurve: sizeCurve,
        secondCurve: firstCurve,
      ),
    );
  }
}
