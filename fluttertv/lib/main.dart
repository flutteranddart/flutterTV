/*
 * @Author: Tan Dong 
 * @Date: 2019-03-16 12:39:05 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-03-16 12:39:05 
 */
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TV Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blueGrey,
        backgroundColor: Colors.teal,
      ),
      routes: {
        // '/home': (context) =>` VideoPlay(),
      },
      home: MyHomePage(title: 'TV Page'),
    );
  }
}

const double radius = 30;
const double padding = 2;
const double borderWidth = 2;
double itemWidth = 0;
FocusNode focusNode = null;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  FocusNode focusNodeB0 = FocusNode();
  FocusNode focusNodeB1 = FocusNode();
  FocusNode focusNodeB2 = FocusNode();
  FocusNode focusNodeB3 = FocusNode();
  FocusNode focusNodeB4 = FocusNode();
  Color colorB0 = Colors.transparent;
  Color colorB1 = Colors.transparent;
  Color colorB2 = Colors.transparent;
  Color colorB3 = Colors.transparent;
  Color colorB4 = Colors.transparent;
  bool init = false;

  _changeColorB0() {
    setState(() {
      if (focusNodeB0.hasFocus) {
        colorB0 = Colors.orange;
      } else {
        colorB0 = Colors.transparent;
      }
    });
  }

  _changeColorB1() {
    setState(() {
      if (focusNodeB1.hasFocus) {
        colorB1 = Colors.orange;
      } else {
        colorB1 = Colors.transparent;
      }
    });
  }

  _changeColorB2() {
    setState(() {
      if (focusNodeB2.hasFocus) {
        colorB2 = Colors.orange;
      } else {
        colorB2 = Colors.transparent;
      }
    });
  }

  _changeColorB3() {
    setState(() {
      if (focusNodeB3.hasFocus) {
        colorB3 = Colors.orange;
      } else {
        colorB3 = Colors.transparent;
      }
    });
  }

  _changeColorB4() {
    setState(() {
      if (focusNodeB4.hasFocus) {
        colorB4 = Colors.orange;
      } else {
        colorB4 = Colors.transparent;
      }
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    // SystemChrome.setEnabledSystemUIOverlays([]);
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.initState();
    focusNodeB0.addListener(_changeColorB0);
    focusNodeB1.addListener(_changeColorB1);
    focusNodeB2.addListener(_changeColorB2);
    focusNodeB3.addListener(_changeColorB3);
    focusNodeB4.addListener(_changeColorB4);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    focusNodeB0.removeListener(_changeColorB0);
    focusNodeB0.dispose();
    focusNodeB1.removeListener(_changeColorB1);
    focusNodeB1.dispose();
    focusNodeB2.removeListener(_changeColorB2);
    focusNodeB2.dispose();
    focusNodeB3.removeListener(_changeColorB3);
    focusNodeB3.dispose();
    focusNodeB4.removeListener(_changeColorB4);
    focusNodeB4.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    itemWidth = MediaQuery.of(context).size.width / 3;
    return Scaffold(
      backgroundColor: Color(0xff277188),
      body:
          view1(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget view1() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        TopWidget(),
        body1(),
        SizedBox(
          height: 20,
        ),
        BottomWidget(focusNodeB0),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback(_onAfterRendering);
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    WidgetsBinding.instance.addPostFrameCallback(_onAfterRendering);
    super.didUpdateWidget(oldWidget);
  }

  void _onAfterRendering(Duration timeStamp) {
    //这里编写获取元素大小和位置的方法
    RenderObject renderObject = context.findRenderObject();
    Size size = renderObject.paintBounds.size;
    print('onAfterRendering:');
    print(size.height);
    RenderObject _renderObject = _bodyKey.currentContext.findRenderObject();
    Size _size = _renderObject.paintBounds.size;
    print('_onAfterRendering:');
    print(_size.height);
    bodyHeight = _size.height;
    setState(() {});
    // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
    //   return PermissionSamples();
    // }));
  }

  GlobalKey _bodyKey = new GlobalKey();
  double bodyHeight = 600;
  Widget image1() {
    return RawKeyboardListener(
      focusNode: focusNodeB0,
      onKey: (event) {
        if (event is RawKeyDownEvent && event.data is RawKeyEventDataAndroid) {
          RawKeyDownEvent rawKeyDownEvent = event;
          RawKeyEventDataAndroid rawKeyEventDataAndroid = rawKeyDownEvent.data;
          print("keyCode: ${rawKeyEventDataAndroid.keyCode}");
          switch (rawKeyEventDataAndroid.keyCode) {
            case 19: //KEY_UP
              break;
            case 20: //KEY_DOWN
              FocusScope.of(context).requestFocus(focusNode);
              break;
            case 21: //KEY_LEFT
              FocusScope.of(context).requestFocus(focusNodeB4);
              break;
            case 22: //KEY_RIGHT
              FocusScope.of(context).requestFocus(focusNodeB1);
              break;
            case 23: //KEY_CENTER
              break;
            default:
              break;
          }
        }
      },
      child: Expanded(
          child: Container(
        height: bodyHeight,
        decoration: getRectangleDecoration(colorB0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          elevation: 10,
          child: ClipRRect(
            child: Image.asset(
              'assets/hmjz.jpg',
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      )),
    );
  }

  Widget body1() {
    return Expanded(
      key: _bodyKey,
      child: Container(
        margin: EdgeInsets.all(5),
        child: Row(
          children: <Widget>[
            image1(),
            Expanded(
              child: Column(
                children: <Widget>[
                  RawKeyboardListener(
                    focusNode: focusNodeB1,
                    onKey: (event) {
                      if (event is RawKeyDownEvent &&
                          event.data is RawKeyEventDataAndroid) {
                        RawKeyDownEvent rawKeyDownEvent = event;
                        RawKeyEventDataAndroid rawKeyEventDataAndroid =
                            rawKeyDownEvent.data;
                        print("keyCode: ${rawKeyEventDataAndroid.keyCode}");
                        switch (rawKeyEventDataAndroid.keyCode) {
                          case 19: //KEY_UP
                            break;
                          case 20: //KEY_DOWN
                            FocusScope.of(context).requestFocus(focusNodeB2);
                            break;
                          case 21: //KEY_LEFT
                            FocusScope.of(context).requestFocus(focusNodeB0);
                            break;
                          case 22: //KEY_RIGHT
                            FocusScope.of(context).requestFocus(focusNodeB3);
                            break;
                          case 23: //KEY_CENTER
                            break;
                          default:
                            break;
                        }
                      }
                    },
                    child: Expanded(
                        child: Container(
                      width: itemWidth,
                      decoration: getRectangleDecoration(colorB1),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        elevation: 10,
                        child: ClipRRect(
                          child: Image.asset(
                            'assets/zqc.jpg',
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    )),
                  ),
                  RawKeyboardListener(
                    focusNode: focusNodeB2,
                    onKey: (event) {
                      if (event is RawKeyDownEvent &&
                          event.data is RawKeyEventDataAndroid) {
                        RawKeyDownEvent rawKeyDownEvent = event;
                        RawKeyEventDataAndroid rawKeyEventDataAndroid =
                            rawKeyDownEvent.data;
                        print("keyCode: ${rawKeyEventDataAndroid.keyCode}");
                        switch (rawKeyEventDataAndroid.keyCode) {
                          case 19: //KEY_UP
                            FocusScope.of(context).requestFocus(focusNodeB1);
                            break;
                          case 20: //KEY_DOWN
                            FocusScope.of(context).requestFocus(focusNode);
                            break;
                          case 21: //KEY_LEFT
                            FocusScope.of(context).requestFocus(focusNodeB0);
                            break;
                          case 22: //KEY_RIGHT
                            FocusScope.of(context).requestFocus(focusNodeB4);
                            break;
                          case 23: //KEY_CENTER
                            break;
                          default:
                            break;
                        }
                      }
                    },
                    child: Expanded(
                        child: Container(
                      decoration: getRectangleDecoration(colorB2),
                      width: itemWidth,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        elevation: 10,
                        child: ClipRRect(
                          child: Image.asset(
                            'assets/lifeandpi.jpg',
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    )),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  RawKeyboardListener(
                    focusNode: focusNodeB3,
                    onKey: (event) {
                      if (event is RawKeyDownEvent &&
                          event.data is RawKeyEventDataAndroid) {
                        RawKeyDownEvent rawKeyDownEvent = event;
                        RawKeyEventDataAndroid rawKeyEventDataAndroid =
                            rawKeyDownEvent.data;
                        print("keyCode: ${rawKeyEventDataAndroid.keyCode}");
                        switch (rawKeyEventDataAndroid.keyCode) {
                          case 19: //KEY_UP
                            break;
                          case 20: //KEY_DOWN
                            FocusScope.of(context).requestFocus(focusNodeB4);
                            break;
                          case 21: //KEY_LEFT
                            FocusScope.of(context).requestFocus(focusNodeB1);
                            break;
                          case 22: //KEY_RIGHT
                            FocusScope.of(context).requestFocus(focusNodeB0);
                            break;
                          case 23: //KEY_CENTER
                            break;
                          default:
                            break;
                        }
                      }
                    },
                    child: Expanded(
                        child: Container(
                      width: itemWidth,
                      decoration: getRectangleDecoration(colorB3),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        elevation: 10,
                        child: ClipRRect(
                          child: Image.asset(
                            'assets/zzx.jpg',
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    )),
                  ),
                  RawKeyboardListener(
                    focusNode: focusNodeB4,
                    onKey: (event) {
                      if (event is RawKeyDownEvent &&
                          event.data is RawKeyEventDataAndroid) {
                        RawKeyDownEvent rawKeyDownEvent = event;
                        RawKeyEventDataAndroid rawKeyEventDataAndroid =
                            rawKeyDownEvent.data;
                        print("keyCode: ${rawKeyEventDataAndroid.keyCode}");
                        switch (rawKeyEventDataAndroid.keyCode) {
                          case 19: //KEY_UP
                            FocusScope.of(context).requestFocus(focusNodeB3);
                            break;
                          case 20: //KEY_DOWN
                            FocusScope.of(context).requestFocus(focusNode);
                            break;
                          case 21: //KEY_LEFT
                            FocusScope.of(context).requestFocus(focusNodeB2);
                            break;
                          case 22: //KEY_RIGHT
                            FocusScope.of(context).requestFocus(focusNodeB0);
                            break;
                          case 23: //KEY_CENTER
                            break;
                          default:
                            break;
                        }
                      }
                    },
                    child: Expanded(
                        child: Container(
                      width: itemWidth,
                      decoration: getRectangleDecoration(colorB4),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        elevation: 10,
                        child: ClipRRect(
                          child: Image.asset(
                            'assets/mgdz.jpg',
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TopWidgetState();
  }
}

class TopWidgetState extends State<TopWidget> {
  String time = '';
  Timer timer;
  @override
  void initState() {
    super.initState();
    var now = DateTime.now();
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      now = DateTime.now();
      setState(() {
        time = now.year.toString() +
            "-" +
            now.month.toString() +
            "-" +
            now.day.toString() +
            "  " +
            now.hour.toString() +
            ":" +
            now.minute.toString() +
            ":" +
            now.second.toString() +
            "  " +
            weekFormat(now.weekday);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Row(
        children: <Widget>[
          Text(
            'Page',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Container(),
          ),
          Text(
            time,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      padding: EdgeInsets.all(10),
    );
  }
}

class BottomWidget extends StatefulWidget {
  FocusNode _focusNode;

  BottomWidget(this._focusNode);

  @override
  State<StatefulWidget> createState() {
    return BottomWidgetState(_focusNode);
  }
}

class BottomWidgetState extends State<BottomWidget>
    with WidgetsBindingObserver {
  FocusNode _focusNode;
  BottomWidgetState(this._focusNode);
  FocusNode focusNode0 = FocusNode();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();

  Color color0 = Colors.transparent;
  Color color1 = Colors.transparent;
  Color color2 = Colors.transparent;
  Color color3 = Colors.transparent;
  Color color4 = Colors.transparent;
  bool init = false;

  _changeColor0() {
    setState(() {
      if (focusNode0.hasFocus) {
        color0 = Colors.orange;
      } else {
        color0 = Colors.transparent;
      }
    });
  }

  _changeColor1() {
    setState(() {
      if (focusNode1.hasFocus) {
        color1 = Colors.orange;
      } else {
        color1 = Colors.transparent;
      }
    });
  }

  _changeColor2() {
    setState(() {
      if (focusNode2.hasFocus) {
        color2 = Colors.orange;
      } else {
        color2 = Colors.transparent;
      }
    });
  }

  _changeColor3() {
    setState(() {
      if (focusNode3.hasFocus) {
        color3 = Colors.orange;
      } else {
        color3 = Colors.transparent;
      }
    });
  }

  _changeColor4() {
    setState(() {
      if (focusNode4.hasFocus) {
        color4 = Colors.orange;
      } else {
        color4 = Colors.transparent;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    focusNode0.addListener(_changeColor0);
    focusNode1.addListener(_changeColor1);
    focusNode2.addListener(_changeColor2);
    focusNode3.addListener(_changeColor3);
    focusNode4.addListener(_changeColor4);
    focusNode = focusNode0;
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    focusNode0.removeListener(_changeColor0);
    focusNode0.dispose();
    focusNode1.removeListener(_changeColor1);
    focusNode1.dispose();
    focusNode2.removeListener(_changeColor2);
    focusNode2.dispose();
    focusNode3.removeListener(_changeColor3);
    focusNode3.dispose();
    focusNode4.removeListener(_changeColor4);
    focusNode4.dispose();
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback(_onAfterRendering);
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    WidgetsBinding.instance.addPostFrameCallback(_onAfterRendering);
    super.didUpdateWidget(oldWidget);
  }

  void _onAfterRendering(Duration timeStamp) {
    //这里编写获取元素大小和位置的方法
    RenderObject renderObject = context.findRenderObject();
    Size size = renderObject.paintBounds.size;
    print(size.height);
  }

  GlobalKey _myKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    if (!init) {
      FocusScope.of(context).requestFocus(focusNode0);
      init = true;
    }
    final sizeM = MediaQuery.of(context).size;
    print(sizeM.width);
    print(sizeM.height);
    return Row(
      key: _myKey,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SizedBox(
          width: 10,
          height: 2,
        ),
        Column(
          children: <Widget>[
            RawKeyboardListener(
              focusNode: focusNode0,
              child: Container(
                decoration: getCircleDecoration(color0),
                child: Padding(
                  child: Card(
                    elevation: 5,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      child: Text(''),
                      backgroundImage: AssetImage("assets/icon_tv.png"),
                      radius: radius,
                    ),
                  ),
                  padding: EdgeInsets.all(padding),
                ),
              ),
              onKey: (RawKeyEvent event) {
                print('监听');
                if (event is RawKeyDownEvent &&
                    event.data is RawKeyEventDataAndroid) {
                  RawKeyDownEvent rawKeyDownEvent = event;
                  RawKeyEventDataAndroid rawKeyEventDataAndroid =
                      rawKeyDownEvent.data;
                  print("keyCode: ${rawKeyEventDataAndroid.keyCode}");
                  switch (rawKeyEventDataAndroid.keyCode) {
                    case 19: //KEY_UP
                      FocusScope.of(context).requestFocus(_focusNode);
                      break;
                    case 20: //KEY_DOWN
                      break;
                    case 21: //KEY_LEFT
                      FocusScope.of(context).requestFocus(focusNode4);
                      break;
                    case 22: //KEY_RIGHT
                      FocusScope.of(context).requestFocus(focusNode1);
                      break;
                    case 23: //KEY_CENTER
                      break;
                    default:
                      break;
                  }
                }
              },
            ),
            Text(
              'TV',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            RawKeyboardListener(
              focusNode: focusNode1,
              child: Container(
                decoration: getCircleDecoration(color1),
                child: Padding(
                  child: Card(
                    elevation: 5,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      child: Text(''),
                      backgroundImage: AssetImage("assets/icon_voice.png"),
                      radius: radius,
                    ),
                  ),
                  padding: EdgeInsets.all(padding),
                ),
              ),
              onKey: (RawKeyEvent event) {
                if (event is RawKeyDownEvent &&
                    event.data is RawKeyEventDataAndroid) {
                  RawKeyDownEvent rawKeyDownEvent = event;
                  RawKeyEventDataAndroid rawKeyEventDataAndroid =
                      rawKeyDownEvent.data;
                  print("keyCode: ${rawKeyEventDataAndroid.keyCode}");
                  switch (rawKeyEventDataAndroid.keyCode) {
                    case 19: //KEY_UP
                      FocusScope.of(context).requestFocus(_focusNode);
                      break;
                    case 20: //KEY_DOWN
                      break;
                    case 21: //KEY_LEFT
                      FocusScope.of(context).requestFocus(focusNode0);
                      break;
                    case 22: //KEY_RIGHT
                      FocusScope.of(context).requestFocus(focusNode2);
                      break;
                    case 23: //KEY_CENTER
                      break;
                    default:
                      break;
                  }
                }
              },
            ),
            Text(
              'Voice',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            RawKeyboardListener(
              focusNode: focusNode2,
              child: Container(
                decoration: getCircleDecoration(color2),
                child: Padding(
                  child: Card(
                    elevation: 5,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      child: Text(''),
                      backgroundImage: AssetImage("assets/icon_video.png"),
                      radius: radius,
                    ),
                  ),
                  padding: EdgeInsets.all(padding),
                ),
              ),
              onKey: (RawKeyEvent event) {
                if (event is RawKeyDownEvent &&
                    event.data is RawKeyEventDataAndroid) {
                  RawKeyDownEvent rawKeyDownEvent = event;
                  RawKeyEventDataAndroid rawKeyEventDataAndroid =
                      rawKeyDownEvent.data;
                  print("keyCode: ${rawKeyEventDataAndroid.keyCode}");
                  switch (rawKeyEventDataAndroid.keyCode) {
                    case 19: //KEY_UP
                      FocusScope.of(context).requestFocus(_focusNode);
                      break;
                    case 20: //KEY_DOWN
                      break;
                    case 21: //KEY_LEFT
                      FocusScope.of(context).requestFocus(focusNode1);
                      break;
                    case 22: //KEY_RIGHT
                      FocusScope.of(context).requestFocus(focusNode3);
                      break;
                    case 23: //KEY_CENTER
                      break;
                    default:
                      break;
                  }
                }
              },
            ),
            Text(
              'Video',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            RawKeyboardListener(
              focusNode: focusNode3,
              child: Container(
                decoration: getCircleDecoration(color3),
                child: Padding(
                  child: Card(
                    elevation: 5,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      child: Text(''),
                      backgroundImage: AssetImage("assets/icon_phone.png"),
                      radius: radius,
                    ),
                  ),
                  padding: EdgeInsets.all(padding),
                ),
              ),
              onKey: (RawKeyEvent event) {
                if (event is RawKeyDownEvent &&
                    event.data is RawKeyEventDataAndroid) {
                  RawKeyDownEvent rawKeyDownEvent = event;
                  RawKeyEventDataAndroid rawKeyEventDataAndroid =
                      rawKeyDownEvent.data;
                  print("keyCode: ${rawKeyEventDataAndroid.keyCode}");
                  switch (rawKeyEventDataAndroid.keyCode) {
                    case 19: //KEY_UP
                      FocusScope.of(context).requestFocus(_focusNode);
                      break;
                    case 20: //
                      break;
                    case 21: //KEY_LEFT
                      FocusScope.of(context).requestFocus(focusNode2);
                      break;
                    case 22: //KEY_RIGHT
                      FocusScope.of(context).requestFocus(focusNode4);
                      break;
                    case 23: //KEY_CENTER
                      Navigator.of(context).pushNamed('/home');
                      break;
                    default:
                      break;
                  }
                }
              },
            ),
            Text(
              'Phone',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            RawKeyboardListener(
              focusNode: focusNode4,
              child: Container(
                decoration: getCircleDecoration(color4),
                child: Padding(
                  child: Card(
                    elevation: 5,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      child: Text(''),
                      backgroundImage: AssetImage("assets/icon_pad.png"),
                      radius: radius,
                    ),
                  ),
                  padding: EdgeInsets.all(padding),
                ),
              ),
              onKey: (RawKeyEvent event) {
                if (event is RawKeyDownEvent &&
                    event.data is RawKeyEventDataAndroid) {
                  RawKeyDownEvent rawKeyDownEvent = event;
                  RawKeyEventDataAndroid rawKeyEventDataAndroid =
                      rawKeyDownEvent.data;
                  print("keyCode: ${rawKeyEventDataAndroid.keyCode}");
                  switch (rawKeyEventDataAndroid.keyCode) {
                    case 19: //KEY_UP
                      FocusScope.of(context).requestFocus(_focusNode);
                      break;
                    case 20: //KEY_DOWN
                      break;
                    case 21: //KEY_LEFT
                      FocusScope.of(context).requestFocus(focusNode3);
                      break;
                    case 22: //KEY_RIGHT
                      FocusScope.of(context).requestFocus(focusNode0);
                      break;
                    case 23: //KEY_CENTER
                      break;
                    default:
                      break;
                  }
                }
              },
            ),
            Text(
              'Pad',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          width: 10,
          height: 2,
        ),
      ],
    );
  }
}

Decoration getCircleDecoration(Color colors) {
  return BoxDecoration(
      border: Border.all(width: borderWidth, color: colors),
      shape: BoxShape.circle);
}

Decoration getRectangleDecoration(Color colors) {
  List<BoxShadow> boxShadows = List();
  boxShadows.add(BoxShadow(color: Colors.orange[200]));
  boxShadows.add(BoxShadow(color: Colors.yellow[100]));
  boxShadows.add(BoxShadow(color: Colors.yellow[300]));
  List<Color> colorsGradient = List();
  colorsGradient.add(Colors.teal);
  colorsGradient.add(Colors.teal[200]);

  return BoxDecoration(
    border: Border.all(width: borderWidth, color: colors),
    borderRadius: BorderRadius.all(Radius.circular(10)),
    shape: BoxShape.rectangle,
  );
}

String weekFormat(int week) {
  switch (week) {
    case 1:
      return '星期一';
      break;
    case 2:
      return '星期二';
      break;
    case 3:
      return '星期三';
      break;
    case 4:
      return '星期四';
      break;
    case 5:
      return '星期五';
      break;
    case 6:
      return '星期六';
      break;
    case 7:
      return '星期日';
      break;
  }
}
