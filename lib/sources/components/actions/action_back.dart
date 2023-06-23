import 'package:dynamic_tools/dynamic_tools.dart';

/// [ActionBack] is used on top of the screen tree to capture the back button
/// and perform an action before.
/// It can also be used to block the back action.
///
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
        context.focusScope?.unfocus();
        onBack?.call();
        return canBack;
      },
      child: child,
    );
  }
}
