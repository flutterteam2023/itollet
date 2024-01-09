import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String?> getUserIPAddress() async {
  try {
    final response = await http.get(Uri.parse('https://api64.ipify.org'));
    return response.body;
  } catch (error) {
    // Handle the exception, e.g., show an error message
    print('Error getting IP address: $error');
    return null;
  }
}
