import 'package:fitness_app/common/colo_extension.dart';
import 'package:fitness_app/view/login/main_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/class/user.dart';

class SetProfile extends StatefulWidget {
  const SetProfile({super.key});

  @override
  State<SetProfile> createState() => _SetProfileState();
}

class _SetProfileState extends State<SetProfile> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  String gender = "Erkek";

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/img/complete_profile.png",
                  width: mediaQuery.width,
                  height: mediaQuery.height * 0.25,
                  fit: BoxFit.fitWidth,
                ),
                const SizedBox(height: 10),
                Text(
                  "Profilinizi Oluşturun",
                  style: TextStyle(
                    color: TColor.black,
                    fontSize: 27,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 20),
                // Ad
                _profileField(
                  controller: nameController,
                  hint: "Adınız",
                  icon: "assets/img/user_text.png",
                ),
                const SizedBox(height: 14),
                // Soyad
                _profileField(
                  controller: surnameController,
                  hint: "Soyadınız",
                  icon: "assets/img/user_text.png",
                ),
                const SizedBox(height: 14),
                // E-posta
                _profileField(
                  controller: emailController,
                  hint: "E-posta",
                  icon: "assets/img/email.png",
                ),
                const SizedBox(height: 14),
                // Şifre
                _profileField(
                  controller: passwordController,
                  hint: "Şifre",
                  icon: "assets/img/lock.png",
                  obscure: true,
                ),
                const SizedBox(height: 14),
                // Yaş
                _profileField(
                  controller: ageController,
                  hint: "Yaşınız",
                  icon: "assets/img/date.png",
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 14),
                // Kilo
                _profileField(
                  controller: weightController,
                  hint: "Kilonuz (kg)",
                  icon: "assets/img/weight.png",
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 14),
                // Boy
                _profileField(
                  controller: heightController,
                  hint: "Boyunuz (cm)",
                  icon: "assets/img/hight.png",
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 14),
                // Cinsiyet seçimi
                Row(
                  children: [
                    const Text(
                      "Cinsiyet:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: DropdownButton<String>(
                        value: gender,
                        isExpanded: true,
                        items:
                            ["Erkek", "Kadın"].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                        onChanged: (value) {
                          setState(() {
                            gender = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Bilgileri UserProfile nesnesine aktar
                    final user = UserProfile(
                      name: nameController.text,
                      surname: surnameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      age: int.tryParse(ageController.text) ?? 0,
                      heightCm: double.tryParse(heightController.text) ?? 0,
                      weightKg: double.tryParse(weightController.text) ?? 0,
                      gender: gender,
                    );
                    // MainTabView'a user gönder
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainTabView(user: user),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: TColor.primaryColor1,
                    minimumSize: const Size(double.infinity, 50),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    "İlerle",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _profileField({
    required TextEditingController controller,
    required String hint,
    required String icon,
    bool obscure = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: TColor.lightGray,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: Container(
            alignment: Alignment.center,
            width: 15,
            height: 15,
            child: Image.asset(icon, width: 15, height: 15),
          ),
          hintText: hint,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
        ),
      ),
    );
  }
}
