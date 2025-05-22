import 'package:fitness_app/common/colo_extension.dart';
import 'package:fitness_app/view/onboarding/on_borading_view.dart';
import 'package:flutter/material.dart';

class StartedView extends StatefulWidget {
  const StartedView({super.key});

  @override
  State<StartedView> createState() => _StartedViewState();
}

class _StartedViewState extends State<StartedView> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: Container(
        width: mediaQuery.width,
        height: mediaQuery.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: TColor.primaryG,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Text(
                  "Fitness App",
                  style: TextStyle(
                    color: TColor.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  "Herkes Emir Öztürk Gibi Olabilir",
                  style: TextStyle(
                    color: TColor.gray,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const OnBoradingView()),
                        );
                      },
                      color: TColor.white,
                      minWidth: double.infinity,
                      textColor: TColor.primaryColor1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Uygulamaya Başla",
                        style: TextStyle(
                          color: TColor.primaryColor1,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
