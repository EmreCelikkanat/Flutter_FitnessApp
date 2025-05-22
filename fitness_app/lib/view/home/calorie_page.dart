import 'package:flutter/material.dart';

class CaloriePage extends StatefulWidget {
  const CaloriePage({super.key});

  @override
  State<CaloriePage> createState() => _CaloriePageState();
}

class _CaloriePageState extends State<CaloriePage> {
  int calorie = 0;
  int goalCalorie = 2000;
  var customController = TextEditingController();

  void addCalorie(int cal) {
    setState(() {
      calorie += cal;
    });
  }

  String feedback() {
    if (calorie < goalCalorie * 0.5) {
      return "Daha fazla kalori alabilirsin!";
    } else if (calorie < goalCalorie) {
      return "Hedefine az kaldı, devam et!";
    } else if (calorie <= goalCalorie + 500) {
      return "Tebrikler, hedefini tamamladın!";
    } else {
      return "Çok fazla kalori aldın, dikkatli ol!";
    }
  }

  @override
  void dispose() {
    customController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kalori Takibi")),
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Bugün Alınan Kalori",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Text(
              "$calorie kcal",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: (calorie / goalCalorie).clamp(0, 1),
              minHeight: 12,
              backgroundColor: Colors.orange[100],
              color: Colors.orange,
            ),
            const SizedBox(height: 24),
            Text(
              feedback(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => addCalorie(100),
                  child: Text("+100 kcal"),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => addCalorie(250),
                  child: Text("+250 kcal"),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 80,
                  child: TextField(
                    controller: customController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "kcal",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    final value = int.tryParse(customController.text);
                    if (value != null && value > 0) {
                      addCalorie(value);
                      customController.clear();
                    }
                  },
                  child: Text("Ekle"),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  calorie = 0;
                });
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text("Sıfırla"),
            ),
          ],
        ),
      ),
    );
  }
}
