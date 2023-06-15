import 'package:eccommerce_app/controllers/auth_conroller.dart';
import 'package:eccommerce_app/utils/show_SnackBar.dart';
import 'package:eccommerce_app/views/buyers/auth/register_screen.dart';
import 'package:eccommerce_app/views/buyers/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController _controller = AuthController();

  late String email;

  late String password;

  bool _isLoading = false;

  _loginUser() async {
    setState(() {
      _isLoading = true;
    });
    if (_formKey.currentState!.validate()) {
      String res = await _controller.LoginUsers(email, password);

      if (res == 'success') {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainScreen()));
      } else {
        setState(() {
          _isLoading = false;
        });
        return displaySnack(context, 'User does not exist');
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      return displaySnack(context, 'All fields must be filled correctly');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'Login into your Account',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                 Stack(
                  children: [
                     CircleAvatar(
                    radius: 54,
                    backgroundColor: Colors.orange.shade900,
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.photo),),),
                  
                  
                  ],
                 ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: InputDecoration(
                          labelText: 'Enter your Email',
                          hintText: 'eliaskemboy@gmail.com',
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'The password field is empty!';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: InputDecoration(
                          labelText: 'Enter your password',
                          hintText: '********',
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      _loginUser();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade900,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: _isLoading
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'Login',
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
                      Text('Not yet Registered?'),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return RegisterScreen();
                              },
                            ),
                          );
                        },
                        child: Text('Register here'),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
