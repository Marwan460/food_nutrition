import 'package:flutter/material.dart';
import 'package:health_tracker/features/on_boarding/views/widgets/on_boarding_page.dart';
import 'package:health_tracker/res/assets_res.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(itemBuilder: (context, index) {
            return OnBoardingPage(
              image: AssetsRes.ON_1,
              title: 'Track Your Goal',
              description:
                  'Don\'t worry if you have trouble determining your goals,'
                      ' We can help you determine your goals and track your goals',
            );
          })
        ],
      ),
    );
  }
}
