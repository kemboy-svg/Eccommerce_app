import 'dart:typed_data';

import 'package:eccommerce_app/controllers/auth_conroller.dart';
import 'package:eccommerce_app/utils/show_SnackBar.dart';
import 'package:eccommerce_app/views/buyers/auth/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kenya_county_picker/kenya_county_picker.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthController _authController = AuthController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String email;

  late String fullname;

  late String phone;

  late String password;

  bool _isLoading = false;

  Uint8List? image;

  String? fileName;

  _signupUser() async {
        print(countySelected);

    setState(() {
      _isLoading = true;
    });
    if (_formKey.currentState!.validate()) {
      await _authController.SignupUsers(email, fullname, phone, password)
          .whenComplete(() {
        setState(() {
          _formKey.currentState!.reset();
          _isLoading = false;
        });
      });

      return showSnack(context, 'Account was created successfully');
    } else {
      setState(() {
        _isLoading = false;
      });
      return displaySnack(context, 'All fields must be filled correctly');
    }
  }

  String countySelected = "";
  _onSelected(String county) {
    setState(() {
      countySelected = county;
    });
  }

  PickImage() async {
    Uint8List im = await _authController.pickImage(ImageSource.gallery);

    setState(() {
      image = im;
    });
  }

  // PickImage() async {
  //   FilePickerResult? result =
  //       await FilePicker.platform.pickFiles(type: FileType.image);

  //   if (result != null) {
  //     setState(() {
  //       image = result.files.first.bytes;
  //       fileName = result.files.first.name;
  //     });
  //   } else {
  //     // The user did not pick  the image
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Text('Create a customer"s account'),
              Stack(
                children: [
                  image != null
                      ? CircleAvatar(
                          radius: 54,
                          backgroundColor: Colors.orange.shade900,
                          backgroundImage: MemoryImage(image!))
                      : CircleAvatar(
                          radius: 54,
                          backgroundColor: Colors.orange.shade900,
                          backgroundImage: NetworkImage('https:AAdAAAAABAE'),
                        ),
                  Positioned(
                    bottom: -10,
                    left: 70,
                    child: IconButton(
                      onPressed: () {
                        PickImage();
                      },
                      icon: Icon(CupertinoIcons.photo_camera),
                    ),
                  ),
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
                    labelText: 'Enter email',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your full name';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    fullname = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter full name',
                  ),
                ),
              ),
              KenyaCountyPicker(
                onCountySelected: _onSelected,
              ),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    } else {
                      return null;
                    }
                  },
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
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    } else {
                      return null;
                    }
                  },
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
                      child: _isLoading
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
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
      ),
    );
  }
}
