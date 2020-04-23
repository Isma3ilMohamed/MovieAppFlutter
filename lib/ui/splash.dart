import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movieapp/ui/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashState();
}

class SplashState extends State<SplashScreen> with TickerProviderStateMixin {
  AnimationController _controller;

  Future<bool> _mockConditions() async {
    await Future.delayed(Duration(milliseconds: 3000));
    return true;
  }

  void _navigateToMain() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    _controller.addStatusListener((status) {
      if(status==AnimationStatus.completed){
        this._navigateToMain();
      }
    });
    //_mockConditions().then((value) => this._navigateToMain());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
          child: Lottie.network(
              'https://assets10.lottiefiles.com/packages/lf20_SQNCQN.json',
              repeat: false,
              controller: _controller,
              onLoaded: (composition) {
                _controller
                  ..duration = composition.duration
                  ..forward();

              })),
    );
  }
}
