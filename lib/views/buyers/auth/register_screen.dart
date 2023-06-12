import 'package:eccommerce_app/controllers/auth_conroller.dart';
import 'package:eccommerce_app/views/buyers/auth/login_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthController _authController = AuthController();

  late String email;

  late String fullname;

  late String phone;

  late String password;

  _signupUser() async {
    String res =
        await _authController.SignupUsers(email, fullname, phone, password);

    if (res != 'success') {
      return res;
    } else {
      return 'Something went Wrong';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Create a customer"s account'),
            CircleAvatar(
              radius: 54,
              backgroundColor: Colors.orange.shade900,
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: TextFormField(
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                  labelText: 'Enter email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: TextFormField(
                onChanged: (value) {
                  fullname = value;
                },
                decoration: InputDecoration(
                  labelText: 'Enter full name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: TextFormField(
                onChanged: (value) {
                  phone = value;
                },
                decoration: InputDecoration(
                  labelText: 'Enter phone number',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: TextFormField(
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                  labelText: 'Enter password',
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _signupUser();
              },
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.orange.shade900,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4,
                  ),
                )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?'),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  },
                  child: Text('Login'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
