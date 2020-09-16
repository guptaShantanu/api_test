import 'package:apitest/Screens/vehicleList_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(WelcomeScreen());
}

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage()
    );
  }
}

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  void initState() {
    startSplash();
    super.initState();
  }

  void startSplash(){
    Future.delayed(Duration(seconds: 2),(){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return VehicleList();
      }));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child:Text('Welcome Screen')
      ),
    );
  }
}

