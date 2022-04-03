import 'package:flutter/material.dart';
import 'package:heipi_test_b/src/utils/constants.dart';
import 'package:heipi_test_b/src/pages/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.green.shade100.withOpacity(0.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.80,
            child: Column(
              children: [
                Image.asset(
                  pathIcon,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      welcomeTo,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      treeWo,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.green.shade400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  sowingHope,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 26, color: Colors.black26),
                ),
              ],
            ),
          ),
          Image.asset(
            welcome,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(
                color: Colors.green.shade500,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const LoginScreen()));
              },
              child: Text(
                getStarted,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                alreadyAccount,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                signIn,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.green.shade400,
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
