import 'package:fitness_app/class/user_profile.dart';
import 'package:fitness_app/view/login/main_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/common/colo_extension.dart';
import 'package:fitness_app/view/login/set_profile.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var user = UserProfile(
    name: "Emre",
    surname: "Çelikkanat",
    email: "emre@gmail.com",
    password: "123",
    age: 22,
    heightCm: 181,
    weightKg: 83,
    gender: "Erkek",
  );

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 60),
              Text(
                "Giriş Yap",
                style: TextStyle(
                  color: TColor.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 40),
              Container(
                decoration: BoxDecoration(
                  color: TColor.lightGray,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: Container(
                      alignment: Alignment.center,
                      width: 15,
                      height: 15,
                      child: Image.asset(
                        "assets/img/email.png",
                        width: 15,
                        height: 15,
                      ),
                    ),
                    hintText: "Mail Adresiniz",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: TColor.lightGray,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Container(
                      alignment: Alignment.center,
                      width: 15,
                      height: 15,
                      child: Image.asset(
                        "assets/img/lock.png",
                        width: 15,
                        height: 15,
                      ),
                    ),
                    hintText: "Şifre",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainTabView(user: user),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColor.primaryColor1,
                  minimumSize: Size(double.infinity, 50),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  "Giriş Yap",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: mediaQuery.height * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Hesabınız yok mu?"),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SetProfile(),
                        ),
                      );
                    },
                    child: Text(
                      "Kayıt Ol",
                      style: TextStyle(
                        color: TColor.primaryColor1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
