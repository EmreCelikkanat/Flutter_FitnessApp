import 'package:fitness_app/view/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/common/colo_extension.dart';
import 'package:fitness_app/class/user_profile.dart';


class ProfileViewPage extends StatelessWidget {
   UserProfile user;
   ProfileViewPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      appBar: AppBar(
        title: Text("Profilim"),
        backgroundColor: TColor.primaryColor1,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(user.profileImagePath ?? "assets/img/u1.png"),
              backgroundColor: TColor.lightGray,
            ),
            const SizedBox(height: 16),
            Text(
              "${user.name} ${user.surname}",
              style: TextStyle(
                color: TColor.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              user.email,
              style: TextStyle(
                color: TColor.gray,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 24),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text("Yaş", style: TextStyle(color: TColor.gray)),
                        const SizedBox(height: 4),
                        Text("${user.age}", style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Boy", style: TextStyle(color: TColor.gray)),
                        const SizedBox(height: 4),
                        Text("${user.heightCm} cm", style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Kilo", style: TextStyle(color: TColor.gray)),
                        const SizedBox(height: 4),
                        Text("${user.weightKg} kg", style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                   Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColor.primaryColor1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  "Çıkış Yap",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}