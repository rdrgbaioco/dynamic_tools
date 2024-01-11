import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PredictiveCallback extends StatelessWidget {
  const PredictiveCallback({
    required this.onPop,
    required this.child,
    this.canPop = false,
    this.leaveApp = false,
    super.key,
  });

  final bool leaveApp;
  final bool canPop;
  final void Function(bool didPop) onPop;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      onPopInvoked: (didPop) {
        Focus.maybeOf(context)?.unfocus();

        onPop(didPop);

        if (leaveApp) {
          SystemNavigator.pop(animated: true);
        }

      },
      child: child,
    );
  }
}
