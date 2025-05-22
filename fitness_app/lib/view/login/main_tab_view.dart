import 'package:fitness_app/class/user_profile.dart';
import 'package:fitness_app/class/workout.dart';
import 'package:fitness_app/common/colo_extension.dart';
import 'package:fitness_app/common_widget/tab_button.dart';
import 'package:fitness_app/view/home/home_view.dart';
import 'package:fitness_app/view/activity_view.dart/activity.dart';
import 'package:fitness_app/view/camera_view/camera_view_page.dart';
import 'package:fitness_app/view/profile_view.dart/profile_view_page.dart';
import 'package:flutter/material.dart';

class MainTabView extends StatefulWidget {
  final UserProfile user;
   MainTabView({super.key, required this.user});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectedIndex = 0;

  void _goToActivityTab() {
    setState(() {
      selectedIndex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.user;

    
    final List<Widget> pages = [
      HomeView(user: user,onShowAllActivities: _goToActivityTab,),
      const ActivityView(),
      const CameraViewPage(),
      ProfileViewPage(user: user),
    ];

    return Scaffold(
      backgroundColor: TColor.white,
      body: pages[selectedIndex],
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: kToolbarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TabButton(
                icon: "assets/img/home_tab.png",
                selectIcon: "assets/img/home_tab_select.png",
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
                isActive: selectedIndex == 0,
              ),
              TabButton(
                icon: "assets/img/activity_tab.png",
                selectIcon: "assets/img/activity_tab_select.png",
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                isActive: selectedIndex == 1,
              ),
              TabButton(
                icon: "assets/img/camera_tab.png",
                selectIcon: "assets/img/camera_tab_select.png",
                onTap: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                },
                isActive: selectedIndex == 2,
              ),
              TabButton(
                icon: "assets/img/profile_tab.png",
                selectIcon: "assets/img/profile_tab_select.png",
                onTap: () {
                  setState(() {
                    selectedIndex = 3;
                  });
                },
                isActive: selectedIndex == 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
