import 'package:fitness_app/class/workout.dart';
import 'package:fitness_app/view/activity_view.dart/add_workout.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/common/colo_extension.dart';

class ActivityView extends StatefulWidget {
  const ActivityView({super.key});

  @override
  State<ActivityView> createState() => _ActivityViewState();
}

class _ActivityViewState extends State<ActivityView> {
  List<Workout> workouts = [
    Workout(
      title: " Göğüs ve Kol",
      description: "Bu antrenmanda göğüs ve kol kaslarını çalıştıracaksın.",
      moves: [
        "Bench Press: 3 set x 12 tekrar",
        "Dumbbell Curl: 3 set x 10 tekrar",
        "Push Up: 3 set x 15 tekrar",
        "Triceps Dips: 3 set x 12 tekrar",
      ],
      duration: "45 ",
    ),
    Workout(
      title: " Kardiyo",
      description: "Dayanıklılığını artırmak için kardiyo egzersizleri.",
      moves: ["Koşu: 20 dk", "İp Atlama: 10 dk", "Bisiklet: 15 dk"],
      duration: "45 ",
    ),
  ];

  void _showAddWorkoutDialog() {
    final titleController = TextEditingController();
    final descController = TextEditingController();
    final movesController = TextEditingController();
    final durationController = TextEditingController();

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Yeni Antrenman Ekle"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(labelText: "Başlık"),
                  ),
                  TextField(
                    controller: descController,
                    decoration: InputDecoration(labelText: "Açıklama"),
                  ),
                  TextField(
                    controller: movesController,
                    decoration: InputDecoration(
                      labelText: "Hareketler (virgülle ayır)",
                    ),
                  ),
                  TextField(
                    controller: durationController,
                    decoration: const InputDecoration(
                      labelText: "Süre (örn: 45 dk)",
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("İptal"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    workouts.add(
                      Workout(
                        title: titleController.text,
                        description: descController.text,
                        moves:
                            movesController.text
                                .split(',')
                                .map((e) => e.trim())
                                .toList(),
                        duration: durationController.text,
                      ),
                    );
                  });
                  Navigator.pop(context);
                },
                child: const Text("Ekle"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      appBar: AppBar(
        title: const Text("Antrenman Kayıtları"),
        backgroundColor: TColor.primaryColor1,
        automaticallyImplyLeading: false,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: workouts.length + 1,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          if (index == workouts.length) {
            return ElevatedButton.icon(
              onPressed: () async {
                final newWorkout = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddWorkout()),
                );
                if (newWorkout != null && newWorkout is Workout) {
                  setState(() {
                    workouts.add(newWorkout);
                  });
                }
              },
              icon: const Icon(Icons.add),
              label: const Text("Yeni Antrenman Ekle"),
              style: ElevatedButton.styleFrom(
                backgroundColor: TColor.primaryColor1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            );
          }
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Antrenman ${index+1} :${workouts[index].title}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: TColor.primaryColor1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    workouts[index].description,
                    style: TextStyle(color: TColor.gray),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Hareketler:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                        workouts[index].moves.map((m) => Text("- $m")).toList(),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.timer, color: TColor.primaryColor2),
                      const SizedBox(width: 8),
                      Text("Toplam Süre: ${workouts[index].duration} dk"),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
