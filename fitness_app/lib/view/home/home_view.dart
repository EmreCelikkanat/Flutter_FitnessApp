import 'package:fitness_app/class/user.dart';
import 'package:fitness_app/common/colo_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeView extends StatefulWidget {
  final UserProfile? user;
  const HomeView({super.key, this.user});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    // Eğer user null ise örnek veri kullan
    final user =
        widget.user ??
        UserProfile(
          name: "Ahmet",
          surname: "Yılmaz",
          email: "ahmet@mail.com",
          password: "",
          age: 25,
          heightCm: 178,
          weightKg: 74,
          gender: "Erkek",
        );

    final double boyCm = user.heightCm;
    final double kilo = user.weightKg;
    final double boyMetre = boyCm / 100;
    final double bmi = kilo / (boyMetre * boyMetre);

    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Fitness App",
                              style: TextStyle(
                                color: TColor.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/img/notification_active.png",
                            width: 25,
                            height: 25,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Hoş geldin, ${user.name}!",
                        style: TextStyle(
                          color: TColor.gray,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: TColor.primaryColor1,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.directions_walk,
                                color: TColor.gray,
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Adım",
                                style: TextStyle(color: TColor.gray),
                              ),
                              Text(
                                "6.500",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.local_fire_department,
                                color: TColor.secondaryColor1,
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Kalori",
                                style: TextStyle(color: TColor.gray),
                              ),
                              Text(
                                "320",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.timer, color: TColor.primaryColor2),
                              SizedBox(height: 4),
                              Text(
                                "Süre",
                                style: TextStyle(color: TColor.gray),
                              ),
                              Text(
                                "45 dk",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Bugünkü Antrenmanlar",
                          style: TextStyle(
                            color: TColor.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Tümü",
                            style: TextStyle(color: TColor.primaryColor1),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            width: 120,
                            margin: EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                              color: TColor.lightGray,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.fitness_center,
                                  color: TColor.primaryColor1,
                                  size: 32,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Göğüs",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text("3 hareket"),
                              ],
                            ),
                          ),
                          Container(
                            width: 120,
                            margin: EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                              color: TColor.lightGray,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.directions_run,
                                  color: TColor.secondaryColor1,
                                  size: 32,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Koşu",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text("30 dk"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.local_drink,
                              color: TColor.primaryColor1,
                            ),
                            SizedBox(height: 4),
                            Text("Su", style: TextStyle(color: TColor.gray)),
                            Text(
                              "1.5L",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.hotel, color: TColor.secondaryColor1),
                            SizedBox(height: 4),
                            Text("Uyku", style: TextStyle(color: TColor.gray)),
                            Text(
                              "7s",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.local_fire_department,
                              color: TColor.primaryColor2,
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Kalori",
                              style: TextStyle(color: TColor.gray),
                            ),
                            Text(
                              "1800",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
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
                            _bmiDescription(bmi),
                            style: TextStyle(color: TColor.gray, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: TColor.primaryColor1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text(
                          "Antrenmana Başla",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Popüler Egzersizler",
                        style: TextStyle(
                          color: TColor.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      height: 120,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            width: 140,
                            margin: EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                              color: TColor.lightGray,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.accessibility_new,
                                  color: TColor.primaryColor1,
                                  size: 36,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Squat",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text("Alt vücut"),
                              ],
                            ),
                          ),
                          Container(
                            width: 140,
                            margin: EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                              color: TColor.lightGray,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.push_pin,
                                  color: TColor.secondaryColor1,
                                  size: 36,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Plank",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text("Karın"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _bmiDescription(double bmi) {
    if (bmi < 18.5) return "Zayıf";
    if (bmi < 25) return "Normal";
    if (bmi < 30) return "Fazla kilolu";
    return "Obez";
  }
}
