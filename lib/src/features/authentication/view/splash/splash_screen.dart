import 'package:flutter/material.dart';

import '../../../../constant/image_strings.dart';
import '../../controller/splash_controller.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final _controller = SplashScreenController();

  @override
  void initState() {
    super.initState();
    _controller.start(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(image: AssetImage(splashIcon)),
      ),
    );
  }
}
