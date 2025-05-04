import 'package:flutter/material.dart';
import 'package:food_nutrition/core/widgets/custom_button.dart';
import 'package:food_nutrition/features/on_boarding/views/widgets/custom_icon.dart';
import 'package:food_nutrition/features/on_boarding/views/widgets/on_boarding_page.dart';

import '../../../core/utils/app_colors.dart';
import '../../../res/assets_res.dart';
import '../../Auth/presentation/views/signup_view.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController controller = PageController();
  int selectedPage = 0;
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      selectedPage = controller.page?.round() ?? 0;
      if (controller.page!.round() == 2) {
        isLastPage = true;
      } else {
        isLastPage = false;
      }
      setState(() {});
    });
  }

  List pageArr = [
    {
      'image': AssetsRes.ON_1,
      'title': 'Eat Healthy',
      'description':
          'Maintaining good health should be the primary focus of everyone.'
    },
    {
      'image': AssetsRes.ON_2,
      'title': 'Healthy Recipes',
      'description':
          'Browse thousands of healthy recipes from all over the world.'
    },
    {
      'image': AssetsRes.ON_3,
      'title': 'Track Your Health',
      'description': 'With amazing inbuilt tools you can track your progress.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
              controller: controller,
              itemCount: pageArr.length,
              itemBuilder: (context, index) {
                var map = pageArr[index] as Map;
                return OnBoardingPage(
                  map: map,
                );
              }),
          Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 30),
            child: SizedBox(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  isLastPage ? const SizedBox() : SizedBox(
                    width: 70,
                    height: 70,
                    child: CircularProgressIndicator(
                      value: (selectedPage + 1) / 3,
                      color: AppColors.primary1,
                      strokeWidth: 2,
                    ),
                  ),
                  isLastPage
                      ? Padding(
                        padding: const EdgeInsets.only(left: 20,bottom: 20),
                        child: CustomButton(onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupView(),
                            ));
                        }, title: 'Get Started'),
                      )
                      : CustomIcon(onPressed: () {
                          if (selectedPage < 2) {
                            selectedPage = selectedPage + 1;
                            controller.animateToPage(
                              selectedPage,
                              duration: const Duration(milliseconds: 600),
                              curve: Curves.easeIn,
                            );
                          }
                        }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
