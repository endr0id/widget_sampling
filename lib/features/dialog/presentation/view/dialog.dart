import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Dialog extends StatelessWidget {
  const Dialog({super.key, required this.title});

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
            TextButton(
              child: const Text('Call dialog'),
              onPressed: () async {
                final result = await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Simple Dialog'),
                      content: const Text('この操作を続行しますか？'),
                      actions: [
                        TextButton(
                          child: const Text('キャンセル'),
                          onPressed: () => Navigator.of(context).pop(false),
                        ),
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () => Navigator.of(context).pop(true),
                        ),
                      ],
                    );
                  },
                );

                // ダイアログの結果に基づいて処理
                if (result) {
                  // OKの場合
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: const Text('操作を続行します')),
                  );
                } else {
                  // NGの場合
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: const Text('操作をキャンセルしました')),
                  );
                }
              },
            ),
            ElevatedButton(onPressed: () => context.pop(), child: const Text('back')),
          ],
        ),
      ),
    );
  }
}