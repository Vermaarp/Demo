import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:circular_menu/circular_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController animationController1;

  late Animation degOneTranslationAnimation;
  late Animation animation;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    degOneTranslationAnimation =
        Tween(begin: 0.0, end: 0.1).animate(animationController);
    animationController.addListener(() {
      setState(() {});
    });

    animationController1 =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animationController1.repeat(reverse: true);
    animation = Tween(begin: 2.0, end: 15.0).animate(animationController1)
      ..addListener(() {
        setState(() {});
      });
  }

  int _counter = 0;
  bool _flag = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          // Colors.red,
          _flag == true ? Colors.white : Color.fromARGB(255, 170, 168, 168),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Positioned(
            right: 20,
            bottom: 20,
            child: Stack(alignment: Alignment.bottomRight, children: [
              IgnorePointer(
                child: Container(
                  color: Colors.transparent,
                  height: 250.0,
                  width: 250.0,
                ),
              ),
              Transform.translate(
                offset: Offset.fromDirection(getRadiansFromDegree(260),
                    degOneTranslationAnimation.value * 1500),
                child: CircularButton(
                  color: _flag == true ? Colors.transparent : Colors.white,
                  width: 60,
                  height: 60,
                  icon: Icon(
                    Icons.account_balance_wallet,
                    color: Colors.black,
                  ),
                  onClick: () {
                    print("Hiiiii1111");
                  },
                ),
              ),
              Transform.translate(
                offset: Offset.fromDirection(getRadiansFromDegree(255),
                    degOneTranslationAnimation.value * 800),
                child: CircularButton(
                  color: _flag == true ? Colors.transparent : Colors.white,
                  width: 60,
                  height: 60,
                  icon: Icon(
                    Icons.access_alarm,
                    color: Colors.black,
                  ),
                  onClick: () {
                    print("Hiiiii2222");
                  },
                ),
              ),
              Transform.translate(
                offset: Offset.fromDirection(getRadiansFromDegree(225),
                    degOneTranslationAnimation.value * 1500),
                child: CircularButton(
                  color: _flag == true ? Colors.transparent : Colors.white,
                  width: 60,
                  height: 60,
                  icon: Icon(
                    Icons.notification_add,
                    color: Colors.black,
                  ),
                  onClick: () {
                    print("Hiiiii333");
                  },
                ),
              ),
              Transform.translate(
                offset: Offset.fromDirection(getRadiansFromDegree(195),
                    degOneTranslationAnimation.value * 800),
                child: CircularButton(
                  color: _flag == true ? Colors.transparent : Colors.white,
                  width: 60,
                  height: 60,
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.black,
                  ),
                  onClick: () {
                    print("Hiiiii444");
                  },
                ),
              ),
              Transform.translate(
                offset: Offset.fromDirection(getRadiansFromDegree(190),
                    degOneTranslationAnimation.value * 1500),
                child: CircularButton(
                  color: _flag == true ? Colors.transparent : Colors.white,
                  width: 60,
                  height: 60,
                  icon: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  onClick: () {
                    print("Hiiiii555");
                  },
                ),
              ),

              // CircularButton(
              //   color: Colors.red,
              //   width: 50,
              //   height: 50,
              //   icon: Icon(
              //     Icons.menu,
              //     color: Colors.white,
              //   ),
              //   onClick: () {
              //     if (animationController.isCompleted) {
              //       animationController.reverse();
              //     } else {
              //       animationController.forward();
              //     }
              //     setState(() {
              //       _flag = !_flag;
              //     });
              //   },
              // )
              Container(
                decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: _flag == true
                            ? Color.fromARGB(255, 40, 127, 199)
                            : Colors.transparent,
                        blurRadius: animation.value,
                        spreadRadius: animation.value,
                      ),
                    ]),
                width: 50,
                height: 50,
                child: IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    enableFeedback: true,
                    onPressed: () {
                      if (animationController.isCompleted) {
                        animationController.reverse();
                      } else {
                        animationController.forward();
                      }
                      setState(() {
                        _flag = !_flag;
                      });
                    }),
              ),
            ]),
          ),
          Center(
            child: Text("Hello Everyone"),
          )
        ],
      ),

      // floatingActionButton: FabCircularMenu(
      //   ringWidth: 200.0,
      //   // fabMargin: const EdgeInsets.all(5.0),
      //   // ringColor: Colors.transparent,
      //   ringDiameter: 500,
      //   children: [
      //     Transform.translate(
      //       offset: Offset(-20, -10),
      //       child: IconButton(
      //           icon: Icon(Icons.transform_sharp),
      //           onPressed: () {
      //             print('Home1');
      //           }),
      //     ),
      //     Transform.translate(
      //       offset: Offset(50, 30),
      //       child: IconButton(
      //           icon: Icon(Icons.access_alarm),
      //           onPressed: () {
      //             print('Home12222222');
      //           }),
      //     ),
      //     IconButton(
      //         icon: Icon(Icons.abc),
      //         onPressed: () {
      //           print('Home2');
      //         }),
      //     Transform.translate(
      //       offset: Offset(30, 50),
      //       child: IconButton(
      //           icon: Icon(Icons.access_alarm),
      //           onPressed: () {
      //             print('Home12222222');
      //           }),
      //     ),
      //     IconButton(
      //         icon: Icon(Icons.favorite),
      //         onPressed: () {
      //           print('Favorite');
      //         })
      //   ],
      // ),
      // FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  FAB(BuildContext context) {
    return CircularMenu(
      // startingAngleInRadian: 0.5,
      // endingAngleInRadian: 0.5,
      alignment: Alignment.bottomRight,
      backgroundWidget: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      curve: Curves.bounceOut,
      toggleButtonColor: Colors.blue,
      items: [
        CircularMenuItem(
            icon: Icons.home,
            margin: 70,
            color: Colors.green,
            onTap: () {
              _incrementCounter();
              setState(() {
                // _color = Colors.green;
                // _colorName = 'Green';
              });
            }),
        CircularMenuItem(
            icon: Icons.search,
            margin: 70,
            color: Colors.blue,
            onTap: () {
              _incrementCounter();

              setState(() {
                // _color = Colors.blue;
                // _colorName = 'Blue';
              });
            }),
        CircularMenuItem(
            icon: Icons.settings,
            margin: 70,
            color: Colors.orange,
            onTap: () {
              _incrementCounter();

              setState(() {
                // _color = Colors.orange;
                // _colorName = 'Orange';
              });
            }),
        // CircularMenuItem(
        //     // margin: 50,
        //     icon: Icons.chat,
        //     color: Colors.purple,
        //     onTap: () {
        //       _incrementCounter();

        //       setState(() {
        //         // _color = Colors.purple;
        //         // _colorName = 'Purple';
        //       });
        //     }),
        // CircularMenuItem(
        //     // margin: 50,
        //     icon: Icons.notifications,
        //     color: Colors.brown,
        //     onTap: () {
        //       _incrementCounter();

        //       setState(() {
        //         // _color = Colors.brown;
        //         // _colorName = 'Brown';
        //       });
        //     })
      ],
    );
  }
}

class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final VoidCallback onClick;

  CircularButton(
      {required this.color,
      required this.width,
      required this.height,
      required this.icon,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      width: width,
      height: height,
      child: IconButton(icon: icon, enableFeedback: true, onPressed: onClick),
    );
  }
}
