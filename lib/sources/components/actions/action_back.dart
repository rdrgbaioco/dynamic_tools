import 'package:flutter/material.dart';

/// [ActionBack] is used on top of the screen tree to capture the back button
/// and perform an action before.
/// It can also be used to block the back action.

@Deprecated('Use [PredictiveBack] instead.')
class ActionBack extends StatelessWidget {
  const ActionBack({
    required this.child,
    this.canBack = true,
    this.onBack,
    super.key,
  });

  /// If true, the back action will be blocked.
  final bool canBack;

  /// The action to be performed before the back action.
  final void Function()? onBack;

  /// The child widget, usually a page.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Focus.maybeOf(context)?.unfocus();
        onBack?.call();
        return canBack;
      },
      child: child,
    );
  }
}
