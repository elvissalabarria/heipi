import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heipi_test_b/src/blocs/timer/timer_bloc.dart';
import 'package:heipi_test_b/src/pages/home_screen.dart';
import 'package:heipi_test_b/src/utils/constants.dart';
import 'package:heipi_test_b/src/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  late TextEditingController userController;
  late TextEditingController passwordController;
  final formKeyLogin = GlobalKey<FormState>();
  final loading = ValueNotifier(false);
  double height = 60;
  double width = 250;
  @override
  void initState() {
    super.initState();
    userController = TextEditingController();
    passwordController = TextEditingController();
    userController.text = userValid;
    passwordController.text = passwordValid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.green.shade100.withOpacity(0.5),
          child: Form(
            key: formKeyLogin,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(imageLogin),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          signInTo,
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
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
                      height: 20,
                    ),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: const EdgeInsets.all(1.0),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: TextFormField(
                          style:
                              TextStyle(color: Colors.grey[400], fontSize: 18),
                          controller: userController,
                          cursorColor: Colors.black26,
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: userName,
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.black38,
                                size: 25,
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return emptyFild;
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: const EdgeInsets.all(1.0),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: TextFormField(
                          style:
                              TextStyle(color: Colors.grey[400], fontSize: 18),
                          controller: passwordController,
                          cursorColor: Colors.black26,
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: password,
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              prefixIcon: const Icon(
                                Icons.key,
                                color: Colors.black38,
                                size: 25,
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return emptyFild;
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 3),
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.green.shade500,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: TextButton(
                    onPressed: () {
                      if (formKeyLogin.currentState!.validate()) {
                        loading.value = true;
                        setState(() {
                          height = 50;
                          width = 60;
                        });
                        emulateRequest();
                      } else {
                        showError(context, fieldEmpty);
                      }
                    },
                    child: ValueListenableBuilder(
                      valueListenable: loading,
                      builder: (context, value, child) {
                        return (loading.value)
                            ? buildLoadingWidget()
                            : Text(
                                signIn,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                                textAlign: TextAlign.center,
                              );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void emulateRequest() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (userController.text != userValid &&
            passwordController.text != passwordValid) {
          showError(context, errorUser);
        } else {
          showError(context, "Exito");

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider(
                        create: (_) => TimerBloc(),
                        child: const HomeScreen(),
                      )));
        }

        height = 60;
        width = 250;
        loading.value = false;
      },
    );
  }
}
