// import 'package:http/http.dart' as http;
// import 'dart:convert';

// Future<void> postData() async {
//   final String apiUrl =
//       "http://127.0.0.1:8000/api/"; // Replace with your API URL

//   final Map<String, dynamic> requestBody = {
//     "email": "value1",
//     "phone_number": "value2",
//     "password":"",
//     "password2":""
//   };

//   final response = await http.post(
//     Uri.parse("$apiUrl/user/register/"),
//     headers: {
//       "Content-Type": "application/json",
//     },
//     body: jsonEncode(requestBody),
//   );

//   if (response.statusCode == 200) {
//     // Request was successful
//     print("Response: ${response.body}");
//   } else {
//     // Handle errors
//     print("Error: ${response.statusCode}, ${response.reasonPhrase}");
//   }
// }
