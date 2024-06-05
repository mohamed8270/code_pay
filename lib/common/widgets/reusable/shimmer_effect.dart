import 'package:code_pay/common/styles/color.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class LinearProgressShimmer extends StatefulWidget {
  const LinearProgressShimmer({super.key});

  @override
  State<LinearProgressShimmer> createState() => _LinearProgressShimmerState();
}

class _LinearProgressShimmerState extends State<LinearProgressShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animations = List.generate(
      1,
      (index) => Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(
            0.25 * index,
            0.25 * (index + 1),
            curve: Curves.easeInOut,
          ),
        ),
      ),
    );

    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: cGrey.withOpacity(0.4),
      highlightColor: cVoilet,
      direction: ShimmerDirection.ltr,
      period: const Duration(seconds: 2), // Keep overall shimmer duration
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          1,
          (index) => AnimatedBuilder(
            animation: _animations[index],
            builder: (context, child) {
              return FadeTransition(opacity: _animations[index], child: child);
            },
            child: Container(
              height: screenSize.height * 0.009,
              width: screenSize.width,
              decoration: const BoxDecoration(color: cGrey),
            ),
          ),
        ),
      ),
    );
  }
}
