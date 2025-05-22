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

  void onDeleteWorkout(int index) {
    setState(() {
      workouts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      appBar: AppBar(
        title: Text("Antrenman Kayıtları"),
        backgroundColor: TColor.primaryColor1,
        automaticallyImplyLeading: false,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: workouts.length + 1,
        separatorBuilder: (_, __) => SizedBox(height: 16),
        itemBuilder: (context, index) {
          if (index == workouts.length) {
            return ElevatedButton.icon(
              onPressed: () async {
                final newWorkout = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddWorkout()),
                );
                if (newWorkout != null) {
                  setState(() {
                    workouts.add(newWorkout);
                  });
                }
              },
              icon: Icon(Icons.add),
              label: Text("Yeni Antrenman Ekle"),
              style: ElevatedButton.styleFrom(
                backgroundColor: TColor.primaryColor1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            );
          }
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Antrenman ${index + 1} : ${workouts[index].title}",
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
                        children: workouts[index]
                            .moves
                            .map((m) => Text("- $m"))
                            .toList(),
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
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.red),
                    onPressed: () async {
                       var result = await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Silmek istediğine emin misin?"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: Text("Vazgeç"),
                            ),
                            ElevatedButton(
                              onPressed: () => Navigator.pop(context, true),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: TColor.primaryColor1,
                              ),
                              child: Text("Tamam"),
                            ),
                          ],
                        ),
                      );
                      if (result == true) {
                        onDeleteWorkout(index);
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
