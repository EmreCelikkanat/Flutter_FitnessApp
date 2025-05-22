import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class PlankPage extends StatefulWidget {
  const PlankPage({super.key});

  @override
  State<PlankPage> createState() => _PlankPageState();
}

class _PlankPageState extends State<PlankPage> {
  int targetSeconds = 30;
  int plankSeconds = 0;
  bool isPlanking = false;
  late final Ticker _ticker;
  String motivation = "Hazır mısın?";

  @override
  void initState() {
    super.initState();
    _ticker = Ticker(_onTick);
  }

  void _onTick(Duration elapsed) {
    if (isPlanking) {
      setState(() {
        plankSeconds = elapsed.inSeconds;
        if (plankSeconds >= targetSeconds) {
          isPlanking = false;
          _ticker.stop();
          motivation = "Harika! Hedefe ulaştın 🎉";
        } else if (plankSeconds > 0 && plankSeconds < targetSeconds ~/ 2) {
          motivation = "Devam et, güçlüsün!";
        } else if (plankSeconds >= targetSeconds ~/ 2) {
          motivation = "Az kaldı, bırakma!";
        }
      });
    }
  }

  void startPlank() {
    setState(() {
      isPlanking = true;
      plankSeconds = 0;
      motivation = "Başladın, bırakma!";
    });
    _ticker.start();
  }

  void stopPlank() {
    setState(() {
      isPlanking = false;
      motivation = "Durdurdun, tekrar dene!";
    });
    _ticker.stop();
  }

  void resetPlank() {
    setState(() {
      plankSeconds = 0;
      isPlanking = false;
      motivation = "Hazır mısın?";
    });
    _ticker.stop();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double progress = plankSeconds / targetSeconds;
    if (progress > 1) progress = 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Plank Challenge"),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/img/plank.png", 
                height: 180,
              ),
              const SizedBox(height: 24),
              Text(
                "Hedef Süreyi Seç:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Slider(
                value: targetSeconds.toDouble(),
                min: 10,
                max: 120,
                divisions: 11,
                label: "$targetSeconds sn",
                onChanged: isPlanking
                    ? null
                    : (value) {
                        setState(() {
                          targetSeconds = value.round();
                        });
                      },
              ),
              const SizedBox(height: 16),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 140,
                    height: 140,
                    child: CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 10,
                      backgroundColor: Colors.grey[300],
                      color: Colors.deepPurple,
                    ),
                  ),
                  Text(
                    "${plankSeconds}s",
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                motivation,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.orange,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: isPlanking ? null : startPlank,
                    icon: const Icon(Icons.play_arrow),
                    label: const Text("Başla"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton.icon(
                    onPressed: isPlanking ? stopPlank : null,
                    icon: const Icon(Icons.pause),
                    label: const Text("Durdur"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton.icon(
                    onPressed: resetPlank,
                    icon: const Icon(Icons.refresh),
                    label: const Text("Sıfırla"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
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
