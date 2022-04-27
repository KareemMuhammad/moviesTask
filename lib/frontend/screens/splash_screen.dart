import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:movies_task/frontend/screens/popular_movies_screen.dart';
import 'package:movies_task/helpers/my_constants.dart';
import 'package:movies_task/helpers/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
     Future.delayed(
        const Duration(seconds: 3),
            () =>  Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const PopularMoviesScreen()))
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: MyConstants.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DelayedDisplay(
              fadeIn: true,
              delay: const Duration(seconds: 1),
              child: Image.asset('assets/logo.jpg',fit: BoxFit.cover,),
            ),
            const SizedBox(height: 10,),
          ],
        ),
    );
  }
}
