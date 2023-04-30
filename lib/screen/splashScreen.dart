import 'dart:async';

import 'package:covid_tracker/screen/WorldPage.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class SplasScreen extends StatefulWidget {
  const SplasScreen({super.key});

  @override
  State<SplasScreen> createState() => _SplasScreenState();
}

class _SplasScreenState extends State<SplasScreen> with TickerProviderStateMixin{

  late final AnimationController _controller=AnimationController(
    duration: Duration(seconds: 3),
    vsync: this)..repeat();
@override
    void dispose(){
      super.dispose();
      _controller.dispose();
    }
@override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return WorldPage();
      },));
     });
  }


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
                AnimatedBuilder(
                  animation:_controller,
                  child: Center(child: Container(
                    height: size.height/4,
                    width: size.width/3,
                    child: Image.asset('assets/images/virus2.jpg'),
                  ),),
                   builder: (BuildContext context,Widget ?child){
                    return  Transform.rotate(
                      angle:_controller.value * 3,
                     child: child,);
                   }
                   ),
                   
                   SizedBox(height: 30,),
                   Text('Covid Tracker App',style: TextStyle(fontSize: 20,color: const Color.fromARGB(255, 36, 98, 205)),)
        ],
      ) ),

    );
  }
}