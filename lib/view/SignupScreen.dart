import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:post_cemera/view/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/SignupModel.dart';
import '../service/SignupService.dart';
import 'LoginScreen.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key: key);
  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final passWord = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLodding = false;
  File? image;
  ImagePicker picker = ImagePicker();
  void getImageFromCamera() async {
    final file = await picker.pickImage(source: ImageSource.camera);
    if (file != null) {
      setState(() {
        image = File(file.path);
      });
    }
  }

  void getImageFromGallery() async {
    final file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        image = File(file.path);
      });
    }
  }

  Future uploadUserImage() async {
    dio.FormData formData = dio.FormData.fromMap(
        {'avatar': await dio.MultipartFile.fromFile(image!.path)});
    dio.Response response = await dio.Dio().post(
      'https://codelineinfotech.com/student_api/User/user_avatar_upload.php',
      data: formData,
    );
    if (response.data['url'] != null) {
      return response.data['url'];
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            "assets/images/14.jpg",
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "CREATE YOUR\nACCOUNT",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            MaterialButton(
                              onPressed: () {
                                getImageFromCamera();
                                Navigator.pop(context);
                              },
                              color: Colors.yellow,
                              child: Text(
                                "Camera",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                                getImageFromGallery();
                                Navigator.pop(context);
                              },
                              color: Colors.black,
                              child: Text(
                                "Gallery",
                                style: TextStyle(
                                    color: Colors.yellow,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 170,
                    width: 170,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200, shape: BoxShape.circle),
                    child: ClipOval(
                      child: image == null
                          ? Icon(Icons.camera)
                          : Image.file(
                              image!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  style: TextStyle(
                      color: Colors.white, decoration: TextDecoration.none),
                  controller: firstName,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'user name cant be empty';
                    }
                  },
                  onTap: () {},
                  decoration: InputDecoration(
                    //fillColor: Colors.white,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: 'First Name',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  style: TextStyle(
                      color: Colors.white, decoration: TextDecoration.none),
                  controller: lastName,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'lrist name cant be empty';
                    }
                  },
                  onTap: () {},
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: 'Last Name',
                    labelStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  style: TextStyle(
                      color: Colors.white, decoration: TextDecoration.none),
                  controller: userName,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'user name cant be empty';
                    }
                  },
                  onTap: () {},
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: 'User Name',
                    labelStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  style: TextStyle(
                      color: Colors.white, decoration: TextDecoration.none),
                  controller: passWord,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'password cant be empty';
                    }
                  },
                  onTap: () {},
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  minWidth: 150,
                  elevation: 0,
                  color: Colors.white60,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString("username", userName.text).then(
                            (value) => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            ),
                          );
                      setState(() {
                        isLodding = true;
                      });
                      final imageUrl = await uploadUserImage();
                      signupmodel model = signupmodel();
                      model.firstName = firstName.text;
                      model.lastName = lastName.text;
                      model.username = userName.text;
                      model.password = passWord.text;
                      model.avatar = imageUrl;

                      SignupSercive.Signup(model.toJson()).then(
                        (value) => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        ),
                      );
                    }
                  },
                  child: isLodding == true
                      ? Center(
                          child: CircularProgressIndicator(color: Colors.black),
                        )
                      : Text(
                          "SIGN IN",
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
