import 'package:fitness_app/class/workout.dart';
import 'package:fitness_app/common/colo_extension.dart';
import 'package:flutter/material.dart';

class AddWorkout extends StatefulWidget {
  const AddWorkout({super.key});

  @override
  State<AddWorkout> createState() => _AddWorkoutState();
}

class _AddWorkoutState extends State<AddWorkout> {
  var titleController = TextEditingController();
  var descController = TextEditingController();
  var durationController = TextEditingController();
  var moveController = TextEditingController();
  List<String> moves = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      appBar: AppBar(
        title: Text(
          "Yeni Antrenman Ekle",
          style: TextStyle(color: TColor.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: TColor.primaryColor1,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: "Başlık",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: descController,
                decoration: InputDecoration(
                  labelText: "Açıklama",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: moveController,
                      decoration: InputDecoration(
                        labelText: "Hareket",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      if (moveController.text.isNotEmpty) {
                        setState(() {
                          moves.add(moveController.text);
                          moveController.clear();
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TColor.primaryColor1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text("Hareket Ekle"),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              if (moves.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Eklenen Hareketler:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    ...moves.map(
                      (m) => Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: TColor.lightGray,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ListTile(
                            title: Text(m),
                            trailing: IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  moves.remove(m);
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 12),
              TextField(
                controller: durationController,
                decoration: InputDecoration(
                  labelText: "Süre (örn: 45 dk)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TColor.primaryColor1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      "Geri Dön",
                      style: TextStyle(
                        color: TColor.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      var workout = Workout(
                        title: titleController.text,
                        description: descController.text,
                        moves: List<String>.from(moves),
                        duration: durationController.text,
                      );
                      Navigator.pop(context, workout);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TColor.primaryColor1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      "Ekle",
                      style: TextStyle(
                        color: TColor.white,
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
