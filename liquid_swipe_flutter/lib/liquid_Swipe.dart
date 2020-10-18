import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class LiquidSwipeDemo extends StatefulWidget {
  static final styke = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold
  );
  @override
  _LiquidSwipeDemoState createState() => _LiquidSwipeDemoState();
}

class _LiquidSwipeDemoState extends State<LiquidSwipeDemo> {

  int page = 0;
  LiquidController liquidController;
  UpdateType updateType;

  @override
  void initState() {
    // TODO: implement initState
    liquidController = LiquidController();
    super.initState();
  }

  final pages = [
    Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage("assets/images/onboarding1.png"), fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
          ),
          Text(
            "Quick Update",
            style: LiquidSwipeDemo.styke,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40,right: 40,top: 10),
            child: Text(
              "Stay informed with the fastest and most effective way, wherever you are",
              textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
            ),
          )
        ],
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage("assets/images/onBoarding2.png"), fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
          ),
          Text(
              "Quick Update",
            style: LiquidSwipeDemo.styke,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40,right: 40,top: 10),
            child: Text(
              "Stay informed with the fastest and most effective way, wherever you are",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                fontWeight: FontWeight.bold
              ),
            ),
          )
        ],
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage("assets/images/onBoarding3.png"), fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
          ),
          Text(
              "Quick Update",
            style: LiquidSwipeDemo.styke,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40,right: 40,top: 10),
            child: Text(
              "Stay informed with the fastest and most effective way, wherever you are",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                fontWeight: FontWeight.bold
              ),
            ),
          )
        ],
      ),
    ),
  ];

  Widget _buildDots(int index){
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page ?? 0) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return Container(
      width: 20,
        child: Center(
          child: Material(
            color: Colors.black,
            type: MaterialType.card,
            child: Container(
              width: 6.0 * zoom,
              height: 6.0 * zoom,
            ),
          ),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            LiquidSwipe(
                pages: pages,
              liquidController: liquidController,
              enableLoop: true,
              waveType: WaveType.liquidReveal,
              ignoreUserGestureWhileAnimating: true,
              onPageChangeCallback: pageChangeCallback,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(pages.length, _buildDots),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: FlatButton(
                  onPressed: (){
                    liquidController.jumpToPage(
                      page: liquidController.currentPage + 1
                    );
                  },
                  child: Text("Next"),
                  color: Colors.white.withOpacity(0.01),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: FlatButton(
                  onPressed: (){
                    liquidController.animateToPage(
                      page: pages.length - 1, duration: 500
                    );
                  },
                  child: Text("Skip to End"),
                  color: Colors.white.withOpacity(0.01),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  pageChangeCallback(int lpage){
    setState(() {
      page = lpage;
    });
  }
}
