import 'dart:convert';

import 'package:http/http.dart' as http;

class SignupSercive {
  static Future Signup(Map<String, dynamic> reqBody) async {
    http.Response response = await http.post(
      Uri.parse('https://codelineinfotech.com/student_api/User/signup.php'),
      body: reqBody,
    );
    var result = jsonDecode(response.body);
    print('-->>${response.body}');
    return result;
  }
}
