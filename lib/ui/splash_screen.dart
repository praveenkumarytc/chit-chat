import 'package:chit_chat/ui/home/home_page.dart';
import 'package:chit_chat/utils/app_constants.dart';
import 'package:chit_chat/utils/app_images.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void routFunction() async {
    await Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    routFunction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //   Center(
              //     child: Container(
              //       height: 200,
              //       width: 200,
              //       decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           color: Colors.red,
              //           image: DecorationImage(image: AssetImage(Images.appLogo))),
              //     ),
              //   )

              Center(
                child: CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage(Images.appLogo),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                AppConstants.appName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Positioned(
              left: MediaQuery.of(context).size.width * 0.45,
              bottom: 10,
              child: SizedBox(child: CircularProgressIndicator())),
        ],
      ),
    );
  }
}
