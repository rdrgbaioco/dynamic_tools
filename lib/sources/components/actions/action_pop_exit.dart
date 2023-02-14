import 'package:dynamic_tools/dynamic_tools.dart';

class ActionPopExit extends StatelessWidget {
  const ActionPopExit({
    required this.dialog,
    required this.child,
    this.beforeExit,
    super.key,
  });

  final Widget child;
  final void Function()? beforeExit;
  final Future<bool?> Function(BuildContext context) dialog;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.focusScope.unfocus();
        final confirm = await dialog(context);

        if (confirm == null) {
          return false;
        }

        if (confirm == true) {
          beforeExit?.call();
          return exit(0);
        } else {
          return false;
        }
      },
      child: child,
    );
  }
}
