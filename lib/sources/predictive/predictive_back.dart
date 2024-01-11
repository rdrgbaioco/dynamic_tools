import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PredictiveBack extends StatelessWidget {
  const PredictiveBack({
    required this.child,
    this.title = const Text('Are you sure?'),
    this.content = const SizedBox.shrink(),
    this.confirmActionLabel = 'Yes',
    this.cancelActionLabel = 'No',
    this.canPop = false,
    this.leaveApp = false,
    super.key,
  });

  final Widget title;
  final Widget content;
  final String cancelActionLabel;
  final String confirmActionLabel;
  final bool canPop;
  final bool leaveApp;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }

        Focus.maybeOf(context)?.unfocus();

        await showAdaptiveDialog<void>(
          context: context,
          builder: (context) {
            return AlertDialog.adaptive(
              title: title,
              content: content,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(cancelActionLabel),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.maybeOf(context)?.pop();

                    if (leaveApp) {
                      SystemNavigator.pop(animated: true);
                    }

                    Navigator.maybeOf(context)?.pop();
                  },
                  child: Text(confirmActionLabel),
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
