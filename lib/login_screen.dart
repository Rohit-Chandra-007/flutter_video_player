import 'package:flutter/material.dart';
import 'package:flutter_video_player/home_screen.dart';
import 'package:magic_sdk/magic_sdk.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controller = TextEditingController();

  _authenticate(BuildContext context) async {
    var phoneNumber = '+91${_controller.text}';
    final token =
        await Magic.instance.auth.loginWithSMS(phoneNumber: phoneNumber);
    debugPrint('token, $token');
    if (token.isNotEmpty) {
      /// Navigate to your home page
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Phone Numder",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintText: 'Enter a Phone Numder with +91',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => _authenticate(context),
            child: const Text("Login with OTP"),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
