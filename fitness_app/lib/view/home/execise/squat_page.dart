import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SquatPage extends StatefulWidget {
  const SquatPage({super.key});

  @override
  State<SquatPage> createState() => _SquatPageState();
}

class _SquatPageState extends State<SquatPage> {
  int squatCount = 0;

  void incrementSquat() {
    setState(() {
      squatCount++;
    });
  }

  void resetSquat() {
    setState(() {
      squatCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Squat Egzersizi")),
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              child: Lottie.asset(
                "assets/anim/squat.json",
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "Squat Nedir?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Squat, bacak ve kalça kaslarını güçlendiren temel bir egzersizdir. "
              "Dik dur, dizlerini bükerek çömel ve tekrar kalk.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            Text(
              "Yaptığın Squat: $squatCount",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: incrementSquat,
                  child: Text("+1 Squat"),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: resetSquat,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text("Sıfırla"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
