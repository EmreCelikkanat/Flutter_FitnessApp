import 'package:fitness_app/common/colo_extension.dart';
import 'package:fitness_app/common_widget/on_boarding_page.dart';
import 'package:fitness_app/view/login/login_page.dart';
import 'package:flutter/material.dart';

class OnBoradingView extends StatefulWidget {
  const OnBoradingView({super.key});

  @override
  State<OnBoradingView> createState() => _OnBoradingViewState();
}

class _OnBoradingViewState extends State<OnBoradingView> {
  int selectedIndex = 0;
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      selectedIndex = controller.page?.round() ?? 0;
      setState(() {});
    });
  }

  List pageList = [
    {
      "title": "Trakya Fitness Uygulamasına Hoşgeldiniz!",
      "desc": "Uygulama Kaslı bir Emir Öztürk Görmek Adına Yapılmıştır.",
      "img": "assets/img/on_1.png",
    },
    {
      "title": "Kaslı Emir Öztürk",
      "desc": "Kaslı Emir Öztürk Görmek Adına Yapılmıştır.",
      "img": "assets/img/on_2.png",
    },
    {
      "title": "Kaslı Emir Öztürk",
      "desc": "Kaslı Emir Öztürk Görmek Adına Yapılmıştır.",
      "img": "assets/img/on_3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
            controller: controller,
            itemCount: pageList.length,
            itemBuilder: (context, index) {
              var pObj = pageList[index] as Map? ?? {};
              return OnBoardingPage(pObj: pObj);
            },
          ),
          
          SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(
                    value : (selectedIndex + 1)/ 3,
                    color: TColor.primaryColor1,
                    strokeWidth: 2,
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  decoration: BoxDecoration(color: TColor.primaryColor1, borderRadius: BorderRadius.circular(35)),
                  child: IconButton(onPressed: () {
                    if(selectedIndex < 2) {
                     selectedIndex = selectedIndex + 1;
                      controller.jumpToPage(selectedIndex);
                    }
                    else {
                       Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoginPage()));
                    }
                  }, icon: Icon(Icons.navigate_next, color: TColor.white, size: 35,), color: TColor.primaryColor1,),
                ),
                
              ],
            ),
          )
        ],
      ),
    );
  }
}
