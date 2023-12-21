import 'package:flutter/material.dart';

@Deprecated('Use [PredictiveBack] instead.')
class ActionCancel extends StatelessWidget {
  const ActionCancel({
    required this.dialog,
    required this.child,
    this.onCancel,
    super.key,
  });

  final Widget child;
  final void Function()? onCancel;
  final Future<bool?> Function(BuildContext context) dialog;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Focus.maybeOf(context)?.unfocus();
        final confirm = await dialog(context);

        if (confirm == null) {
          return false;
        }

        if (confirm == true) {
          onCancel?.call();
          return true;
        } else {
          return false;
        }
      },
      child: child,
    );
  }
}
