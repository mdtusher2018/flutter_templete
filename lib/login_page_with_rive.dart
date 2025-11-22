import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoginPageWithRive extends StatefulWidget {
  const LoginPageWithRive({super.key});

  @override
  State<LoginPageWithRive> createState() => _LoginPageWithRiveState();
}

class _LoginPageWithRiveState extends State<LoginPageWithRive> {
  late RiveAnimation anim;
  late StateMachineController ctrl;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  SMIBool? lookingDown;
  SMIBool? handsUp;
  SMINumber? lookLeftRight;

  @override
  void initState() {
    super.initState();

    anim = RiveAnimation.asset(
      "assest/3469-7899-login-screen-character.riv",
      artboard: "Artboard",
      fit: BoxFit.cover,
      onInit: onRiveInit,
    );
  }

  void onRiveInit(Artboard artboard) {
    ctrl = StateMachineController.fromArtboard(artboard, 'State Machine 1')!;
    artboard.addController(ctrl);

    lookingDown = ctrl.findSMI("Check");
    handsUp = ctrl.findSMI("hands_up");
    lookLeftRight = ctrl.findSMI("Look");
  }

  void _login() {
    // Implement login logic here
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      // Handle successful login
      print("Email: $email, Password: $password");
    } else {
      // Handle error
      print("Please enter both email and password");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: Column(
        children: [
          SizedBox(
            height: 450,

            child: anim, // Rive animation
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                TextField(
                  controller: _emailController,
                  onTap: () {
                    handsUp!.value = false;
                    setState(() {});
                  },
                  onChanged: (value) {
                    lookingDown!.value = true;
                    handsUp!.value = false;
                    if (value.isEmpty) {
                      lookingDown!.value = false;
                    }
                    lookLeftRight!.value = double.parse(
                      (value.length * 2).toString(),
                    );
                    setState(() {});
                  },
                  onSubmitted: (value) {
                    lookingDown!.value = false;
                    handsUp!.value = false;

                    setState(() {});
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  onTap: () {
                    lookingDown!.value = false;
                    setState(() {});
                  },
                  onChanged: (value) {
                    handsUp!.value = true;
                    if (value.isEmpty) {
                      handsUp!.value = false;
                    }
                    setState(() {});
                  },
                  onSubmitted: (value) {
                    handsUp!.value = false;

                    setState(() {});
                  },
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),

                    backgroundColor: Colors.blue,
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
