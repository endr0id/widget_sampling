import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User extends StatelessWidget {
  const User({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {

    Future<void> fetch() async {
      final res = await http.Client().get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

      if (res.statusCode == 200) {
        print(res.body);
      } else {
        throw Exception('Failed to lead user');
      }
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => fetch()),
    );
  }
}