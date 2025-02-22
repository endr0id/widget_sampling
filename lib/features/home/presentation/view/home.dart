import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Contents Lists'),
            ElevatedButton(onPressed: () => context.push('/counter'), child: const Text('Counter')),
            ElevatedButton(onPressed: () => context.push('/dialog'), child: const Text('Dialog')),
            ElevatedButton(onPressed: () => context.push('/user'), child: const Text('User'))
          ],
        ),
      ),
    );
  }
}