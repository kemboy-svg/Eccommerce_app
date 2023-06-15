import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';


class AuthController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

        await _firestore.collection('Users').doc(cred.user!.uid).set({
          'email': email,
          'fullname': fullname,
          'phone': phone,
          'uid': cred.user!.uid,
        });

        res = 'Registration success';
      } else {
        res = "All details is required";
      }
    } catch (e) {}

    return res;
  }

  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);

    if (_file != null) {
      return await _file.readAsBytes();
      
    } else {
      return "No image picked";
    }
  }

  Future<String> LoginUsers(String email, String password) async {
    String res = '';
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        res = 'success';
      } else {
        res = 'something went wrong';
      }
    } catch (e) {
      return e.toString();
    }
    return res;
  }
}
