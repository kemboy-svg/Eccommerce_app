import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<String> SignupUsers(
      String email, String fullname, String phone, String password) async {
    String res = "not success";
    try {
      if (email.isNotEmpty &&
          fullname.isNotEmpty &&
          phone.isNotEmpty &&
          password.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        res = 'Registration success';
      } else {
        res = "All details is required";
      }
    } catch (e) {}

    return res;
  }
}
