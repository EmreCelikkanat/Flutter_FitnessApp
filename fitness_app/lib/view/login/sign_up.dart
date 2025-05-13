import 'package:flutter/material.dart';
import 'package:fitness_app/common/colo_extension.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size; // Ekran boyutlarını almak için tanımlandı

    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0), // Kenarlardan boşluk
          child: Column(
            children: [
              Text(
                "Hesap Oluştur",
                style: TextStyle(
                  color: TColor.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: TColor.lightGray,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Container(
                      alignment: Alignment.center,
                      width: 15,
                      height: 15,
                      child: Image.asset("assets/img/user_text.png", width: 15, height: 15),
                    ),
                    hintText: "Adınız",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: TColor.lightGray,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Container(
                      alignment: Alignment.center,
                      width: 15,
                      height: 15,
                      child: Image.asset("assets/img/user_text.png", width: 15, height: 15),
                    ),
                    hintText: "Soyadınız",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: TColor.lightGray,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Container(
                      alignment: Alignment.center,
                      width: 15,
                      height: 15,
                      child: Image.asset("assets/img/email.png", width: 15, height: 15),
                    ),
                    hintText: "Mail Adresiniz",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: TColor.lightGray,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Container(
                      alignment: Alignment.center,
                      width: 15,
                      height: 15,
                      child: Image.asset("assets/img/lock.png", width: 15, height: 15),
                    ),
                    hintText: "Şifre",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Kayıt olma işlemi
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColor.primaryColor1, // Buton rengi
                  minimumSize: const Size(double.infinity, 50), // Buton genişliği ve yüksekliği
                  padding: const EdgeInsets.symmetric(horizontal: 16), // Kenarlardan mesafe
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // Dairesel kenarlar
                  ),
                ),
                child: const Text(
                  "Kayıt Ol",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Yazı rengi
                  ),
                ),
              ),
              SizedBox(height: mediaQuery.height * 0.04), // Dikey boşluk
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Ortala
                children: [
                  const Text("Zaten bir hesabınız var mı?"),
                  SizedBox(width: 8), // Text ve TextButton arasında boşluk
                  TextButton(
                    onPressed: () {
                      // Giriş yapma işlemi
                    },
                    child: Text(
                      "Giriş Yap",
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
