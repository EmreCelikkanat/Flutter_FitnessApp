import 'package:flutter/material.dart';

class WaterPage extends StatefulWidget {
  const WaterPage({super.key});

  @override
  State<WaterPage> createState() => _WaterPageState();
}

class _WaterPageState extends State<WaterPage> {
   int waterMl = 0;
   int goalMl = 2000;
   var customController = TextEditingController();

  void addWater(int ml) {
    setState(() {
      waterMl += ml;
    });
  }

  String feedback() {
    if (waterMl < goalMl * 0.5) {
      return "Daha fazla su içmelisin!";
    } else if (waterMl < goalMl) {
      return "Hedefine az kaldı, devam et!";
    } else if (waterMl <= goalMl + 500) {
      return "Tebrikler, hedefini tamamladın!";
    } else {
      return "Çok fazla su içtin, dikkatli ol!";
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
      appBar: AppBar(title: Text("Su Takibi")),
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Bugün İçilen Su",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Text(
              "${(waterMl / 1000).toStringAsFixed(2)} L",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: (waterMl / goalMl).clamp(0, 1),
              minHeight: 12,
              backgroundColor: Colors.blue[100],
              color: Colors.blue,
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
                  onPressed: () => addWater(200),
                  child:  Text("+200 ml"),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => addWater(500),
                  child: Text("+500 ml"),
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
                      hintText: "ml",
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
                      addWater(value);
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
                  waterMl = 0;
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
