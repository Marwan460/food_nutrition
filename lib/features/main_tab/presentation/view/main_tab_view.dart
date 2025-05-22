import 'package:flutter/material.dart';
import 'package:food_nutrition/core/utils/app_colors.dart';
import 'package:food_nutrition/features/meals/presentation/view/meal_view.dart';

import '../../../../core/widgets/nav_bar_item.dart';
import '../../../../res/assets_res.dart';
import '../../../home/presentation/views/home_view.dart';


class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectedIndex = 0;
  final PageStorageBucket pageStorageBucket = PageStorageBucket();
  Widget currentScreen = const HomeView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: PageStorage(bucket: pageStorageBucket, child: currentScreen),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.white,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white,
            boxShadow: const [BoxShadow(color: AppColors.lightGrey, blurRadius: 2, offset: Offset(0, -2))],
          ),
          height: kToolbarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavBarItem(
                icon: AssetsRes.HOME,
                selectIcon: AssetsRes.HOME_SELECTED,
                isActive: selectedIndex == 0,
                onTap: () {
                  selectedIndex = 0;
                  currentScreen = const HomeView();
                  if (mounted) {
                    setState(() {});
                  }
                },
              ),
              NavBarItem(
                icon: AssetsRes.MEAL_ICON,
                selectIcon: AssetsRes.SELECTED_MEAL_ICON,
                isActive: selectedIndex == 1,
                onTap: () {
                  selectedIndex = 1;
                  currentScreen = const MealView();
                  if (mounted) {
                    setState(() {});
                  }
                },
              ),     NavBarItem(
                icon: AssetsRes.PROFILE,
                selectIcon: AssetsRes.PROFILE_SELECTED,
                isActive: selectedIndex == 2,
                onTap: () {
                  selectedIndex = 2;
                  if (mounted) {
                    setState(() {});
                  }
                },
              ),     NavBarItem(
                icon: AssetsRes.PROFILE,
                selectIcon: AssetsRes.PROFILE_SELECTED,
                isActive: selectedIndex == 3,
                onTap: () {
                  selectedIndex = 3;
                  if (mounted) {
                    setState(() {});
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
