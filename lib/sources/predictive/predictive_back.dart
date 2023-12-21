import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PredictiveBack extends StatelessWidget {
  const PredictiveBack({
    required this.child,
    this.title = 'Deseja cancelar?',
    this.leaveApp = false,
    super.key,
  });

  final String title;
  final bool leaveApp;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }

        await showAdaptiveDialog<void>(
          context: context,
          builder: (context) {
            return AlertDialog.adaptive(
              title: Text(title),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Não'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();

                    if (leaveApp) {
                      SystemNavigator.pop(animated: true);
                    }
                    Navigator.of(context).pop();
                  },
                  child: const Text('Sim'),
                ),
              ],
            );
          },
        );
      },
      child: child,
    );
  }
}
