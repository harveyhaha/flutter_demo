import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<Splash> {
  final String launchImage =
      "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1093264713,2279663012&fm=26&gp=0.jpg";
  int _countdown = 5;
  late Timer _countdownTimer;

  @override
  void initState() {
    super.initState();
    _startRecodeTime();
    print('初始化启动页面');
  }

  @override
  void dispose() {
    super.dispose();
    print('启动页面结束');
    if (_countdownTimer.isActive) _countdownTimer.cancel();
  }

  void _startRecodeTime() {
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        print('倒计时 $_countdown');
        if (_countdown <= 1) {
          print('启动主页');
          // Navigator.of(context).pop();
          // Navigator.of(context).pushNamed(app_routes.homeRoute);
          _countdownTimer.cancel();
        } else {
          _countdown -= 1;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            Image.network(launchImage, fit: BoxFit.contain),
            Positioned(
                right: 10,
                top: 10,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  alignment: AlignmentDirectional.topEnd,
                  child: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: '$_countdown ',
                          style: const TextStyle(color: Colors.red)),
                      const TextSpan(
                          text: '跳过', style: TextStyle(color: Colors.blue))
                    ]),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
