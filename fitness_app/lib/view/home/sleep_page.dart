import 'package:flutter/material.dart';
import 'dart:async';
import 'package:lottie/lottie.dart'; // Lottie paketi eklendi

class SleepPage extends StatefulWidget {
  const SleepPage({super.key});

  @override
  State<SleepPage> createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  static Stopwatch stopwatch = Stopwatch();
  Timer? timer;
  String elapsed = "00:00:00";
  bool isRunning = false;

  @override
  void initState() {
    super.initState();
    isRunning = stopwatch.isRunning;
    elapsed = _formatDuration(stopwatch.elapsed);
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (stopwatch.isRunning) {
        setState(() {
          elapsed = _formatDuration(stopwatch.elapsed);
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(d.inHours)}:${twoDigits(d.inMinutes % 60)}:${twoDigits(d.inSeconds % 60)}";
  }

  void startStop() {
    setState(() {
      if (stopwatch.isRunning) {
        stopwatch.stop();
        isRunning = false;
      } else {
        stopwatch.start();
        isRunning = true;
      }
    });
  }

  void reset() {
    setState(() {
      stopwatch.reset();
      elapsed = "00:00:00";
      isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Uyku Takibi")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 180,
              child: Lottie.asset(
                "assets/anim/sleep.json",
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 24),
             Text(
              "Uyku Süresi",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            Text(
              elapsed,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: startStop,
                  child: Text(isRunning ? "Durdur" : "Başlat"),
                ),
                const SizedBox(width: 16),
                ElevatedButton(onPressed: reset, child: Text("Sıfırla")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
