import 'package:fitness_app/class/user_profile.dart';
import 'package:fitness_app/common/colo_extension.dart';
import 'package:fitness_app/view/activity_view.dart/activity.dart';
import 'package:fitness_app/view/home/calorie_page.dart';
import 'package:fitness_app/view/home/execise/plank_page.dart';
import 'package:fitness_app/view/home/execise/squat_page.dart';
import 'package:fitness_app/view/home/water_page.dart';
import 'package:fitness_app/widgets/exercise_card.dart';
import 'package:fitness_app/widgets/stat_column.dart';
import 'package:fitness_app/widgets/workout_card.dart';
import 'package:flutter/material.dart';
import 'sleep_page.dart';

class HomeView extends StatefulWidget {
  final UserProfile? user;
  final VoidCallback? onShowAllActivities;
  const HomeView({super.key, this.user, this.onShowAllActivities});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    double boyMetre = widget.user!.heightCm / 100;
    double bmi = widget.user!.weightKg / (boyMetre * boyMetre);

    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Hoş geldin, ${widget.user!.name}!",
                    style: TextStyle(
                      color: TColor.gray,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: TColor.primaryColor1,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      StatColumn(
                        icon: Icons.directions_walk,
                        label: "Adım",
                        value: "6.500",
                        color: Colors.limeAccent,
                      ),
                      StatColumn(
                        icon: Icons.local_fire_department,
                        label: "Kalori",
                        value: "320",
                        color: Colors.orangeAccent,
                      ),
                      StatColumn(
                        icon: Icons.timer,
                        label: "Süre",
                        value: "45 dk",
                        color: Colors.deepPurple,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " Antrenmanlar",
                          style: TextStyle(
                            color: TColor.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            if (widget.onShowAllActivities != null) {
                              widget.onShowAllActivities!();
                            }
                          },
                          child: Text(
                            "Tümü",
                            style: TextStyle(color: TColor.primaryColor1),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          WorkoutCard(
                            icon: Icons.fitness_center,
                            color: TColor.primaryColor1,
                            title: "Göğüs",
                            subtitle: "3 hareket",
                          ),
                          WorkoutCard(
                            icon: Icons.directions_run,
                            color: TColor.secondaryColor1,
                            title: "Koşu",
                            subtitle: "30 dk",
                          ),
                          WorkoutCard(
                            icon: Icons.accessibility_new,
                            color: TColor.primaryColor2,
                            title: "Squat",
                            subtitle: "3 set",
                          ),
                          WorkoutCard(
                            icon: Icons.sixty_fps_select,
                            color: TColor.secondaryColor2,
                            title: "Plank",
                            subtitle: "1 dk",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WaterPage(),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 2,
                        color: TColor.lightGray,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 16,
                          ),
                          child: Column(
                            children: [
                              Icon(
                                Icons.local_drink,
                                color: TColor.primaryColor1,
                                size: 32,
                              ),
                              const SizedBox(height: 4),
                              Text("Su", style: TextStyle(color: TColor.gray)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SleepPage(),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 2,
                        color: TColor.lightGray,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 16,
                          ),
                          child: Column(
                            children: [
                              Icon(
                                Icons.hotel,
                                color: TColor.secondaryColor1,
                                size: 32,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Uyku",
                                style: TextStyle(color: TColor.gray),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CaloriePage(),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 2,
                        color: TColor.lightGray,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 16,
                          ),
                          child: Column(
                            children: [
                              Icon(
                                Icons.local_fire_department,
                                color: TColor.primaryColor2,
                                size: 32,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Kalori",
                                style: TextStyle(color: TColor.gray),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: TColor.lightGray,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Vücut Kitle İndeksi (BMI)",
                        style: TextStyle(
                          color: TColor.primaryColor1,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        bmi.toStringAsFixed(1),
                        style: TextStyle(
                          color: TColor.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        bmiDescription(bmi),
                        style: TextStyle(color: TColor.gray, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Popüler Egzersizler",
                      style: TextStyle(
                        color: TColor.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 120,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SquatPage(),
                                ),
                              );
                            },
                            child: ExerciseCard(
                              icon: Icons.accessibility_new,
                              color: TColor.primaryColor1,
                              title: "Squat",
                              subtitle: "Alt vücut",
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PlankPage(),
                                ),
                              );
                            },
                            child: ExerciseCard(
                              icon: Icons.accessibility_new,
                              color: TColor.primaryColor1,
                              title: "Squat",
                              subtitle: "Alt vücut",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String bmiDescription(double bmi) {
    if (bmi < 18.5) return "Zayıf";
    if (bmi < 25) return "Normal";
    if (bmi < 30) return "Fazla kilolu";
    return "Obez";
  }
}
