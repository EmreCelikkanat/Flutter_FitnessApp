import 'package:flutter/material.dart';
import 'package:fitness_app/common/colo_extension.dart';
import 'package:fitness_app/class/user.dart';

class ProfileViewPage extends StatelessWidget {
  final UserProfile user;
  const ProfileViewPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      appBar: AppBar(
        title: const Text("Profilim"),
        backgroundColor: TColor.primaryColor1,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Profil Fotoğrafı
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(user.profileImagePath ?? "assets/img/user_text.png"),
              backgroundColor: TColor.lightGray,
            ),
            const SizedBox(height: 16),
            // Kullanıcı Adı
            Text(
              "${user.name} ${user.surname}",
              style: TextStyle(
                color: TColor.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            // E-posta
            Text(
              user.email,
              style: TextStyle(
                color: TColor.gray,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 24),
            // Profil Bilgileri Kartı
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
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
            // Çıkış Yap Butonu
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/login");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColor.primaryColor1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
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