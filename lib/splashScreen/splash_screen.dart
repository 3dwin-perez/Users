import 'dart:async';
import 'package:flutter/material.dart';
import 'package:raidereats_users_app/global/global.dart';

import '../authentication/auth_screen.dart';
import '../mainScreens/home_screen.dart';


class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}



class _MySplashScreenState extends State<MySplashScreen>
{

  startTime()
  {

    Timer(const Duration(seconds: 3),() async {
      if(firebaseAuth.currentUser != null)
        {
          // if seller is logged in already
          Navigator.push(context, MaterialPageRoute(builder: (c) => HomeScreen()));
        }
      else
        {
          // if seller is NOT logged in already
          Navigator.push(context, MaterialPageRoute(builder: (c) => AuthScreen()));
        }
    });
  }

  @override
  void initState() {
    super.initState();

    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Colors.black,
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0,1.0],
            tileMode: TileMode.clamp,
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/User.png"),

              const SizedBox(height: 10,),

              const Padding(
                padding:EdgeInsets.all(18.0),
                child: Text(
                  "Save time, order online",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                    fontFamily: "Bebas",
                    letterSpacing: 2,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
