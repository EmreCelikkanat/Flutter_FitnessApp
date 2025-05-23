import 'package:fitness_app/class/workout.dart';
import 'package:fitness_app/view/activity_view.dart/add_workout.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/common/colo_extension.dart';

class ActivityView extends StatefulWidget {
   ActivityView({super.key, required this.workouts});
   List<Workout> workouts;

  @override
  State<ActivityView> createState() => _ActivityViewState();
}

class _ActivityViewState extends State<ActivityView> {
  

  void onDeleteWorkout(int index) {
    setState(() {
      widget.workouts.removeAt(index);
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
        itemCount: widget.workouts.length + 1,
        separatorBuilder: (_, __) => SizedBox(height: 16),
        itemBuilder: (context, index) {
          if (index == widget.workouts.length) {
            return ElevatedButton.icon(
              onPressed: () async {
                final newWorkout = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddWorkout()),
                );
                if (newWorkout != null) {
                  setState(() {
                    widget.workouts.add(newWorkout);
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
                        "Antrenman ${index + 1} : ${widget.workouts[index].title}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: TColor.primaryColor1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.workouts[index].description,
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
                        children: widget.workouts[index]
                            .moves
                            .map((m) => Text("- $m"))
                            .toList(),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(Icons.timer, color: TColor.primaryColor2),
                          const SizedBox(width: 8),
                          Text("Toplam Süre: ${widget.workouts[index].duration} dk"),
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
