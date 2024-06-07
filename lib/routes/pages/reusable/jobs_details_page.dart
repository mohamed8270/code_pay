import 'package:code_pay/common/styles/color.dart';
import 'package:flutter/material.dart';

class JobsDetailsPage extends StatelessWidget {
  const JobsDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    String url =
        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1200px-Google_%22G%22_logo.svg.png';
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: screenSize.height * 0.3,
            width: screenSize.width,
            decoration: BoxDecoration(
              color: cVoilet,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Positioned(
                      child: Container(
                        height: screenSize.height * 0.2,
                        width: screenSize.width * 0.2,
                        decoration: BoxDecoration(
                          color: cWhite,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(url),
                            fit: BoxFit.contain,
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
