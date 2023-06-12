import 'package:eccommerce_app/views/buyers/auth/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text('Login into your Account', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
        
        
            CircleAvatar(
              radius: 54,
              backgroundColor: Colors.orange.shade900,
            ),
        
        
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter your Email',
                        hintText: 'eliaskemboy@gmail.com',
                      )
                    ),
                  ),
        
        
                   Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter your password',
                        hintText: '********',
                      )
                    ),
                  ),
        
                  Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.orange.shade900,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4,
                ),
              )),
            ),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not yet Registered?'),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return RegisterScreen();
                      },
                    ),);
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
      )
      );
      }
      }