import 'package:flutter/material.dart';
import 'package:fluttertabbar/tab_Screen/screen1.dart';
import 'package:fluttertabbar/tab_Screen/screen2.dart';
import 'package:fluttertabbar/tab_Screen/screen3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 3, vsync: this);  //https://api.flutter.dev/flutter/material/Scaffold-class.html watch nested scaffold() part. it is bad habit to add scaffold for all screens. use addlistener
	
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APPBAR"),
        bottom: TabBar(
          controller: controller,
          indicatorColor: Colors.white,
          labelColor: Color(0xFFFCD581),
          unselectedLabelColor:
              Colors.white.withOpacity(0.7), //this is by default color
          labelPadding: EdgeInsets.only(bottom: 5.0),
          tabs: [
            Column(
              children: [
                Icon(
                  Icons.forward,
                ),
                Text("forward"),
              ],
            ),
            Column(
              children: [
                Icon(Icons.arrow_downward),
                Text("down"),
              ],
            ),
            Column(
              children: [
                Icon(Icons.skip_previous),
                Text("previous"),
              ],
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [Screen1(), Screen2(), Screen3()],
      ),
    );
  }
}
