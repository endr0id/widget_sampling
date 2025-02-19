import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Dialog extends StatelessWidget {
  const Dialog({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {

    Future<void> alertDialog() async {
      final result = await showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Alert Dialog'),
            content: const Text('この操作を続行しますか？'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('キャンセル'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('OK'),
              ),
            ],
          );
        }
      );

      // TODO: 非同期処理後にcontextがマウントされているか確認
      if (context.mounted) {
        if (result == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: const Text('操作を続行します'))
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: const Text('操作をキャンセルしました'))
          );
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: const Text('Call dialog'),
              onPressed: () => alertDialog(),
            ),
            ElevatedButton(onPressed: () => context.pop(), child: const Text('back')),
          ],
        ),
      ),
    );
  }
}