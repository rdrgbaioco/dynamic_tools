import 'package:dynamic_tools/dynamic_tools.dart';

extension ContextExtensions on BuildContext {
  /// Returns if the theme is actually in dark mode.
  bool get isDarkMode {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }
  
  /// Allow to get the [NavigatorState] from the current [BuildContext].
  NavigatorState get navigator {
    return Navigator.of(this);
  }

  /// Returns the height size of the current [MediaQuery].
  double get screenHeight {
    final screen = MediaQuery.of(this);
    return screen.size.height;
  }

  /// Returns the width size of the current [MediaQuery].
  double get screenWidth {
    final screen = MediaQuery.of(this);
    return screen.size.width;
  }

  double get keyboardHeight {
    final screen = MediaQuery.of(this);
    return screen.viewInsets.bottom;
  }

  /// Returns the current [ThemeData].
  ThemeData get theme {
    return Theme.of(this);
  }

  /// Returns the current [TextTheme].
  TextTheme get textTheme {
    return Theme.of(this).textTheme;
  }

  /// Returns the current [ColorScheme].
  ColorScheme get colorScheme {
    return Theme.of(this).colorScheme;
  }

  /// Returns [ScaffoldMessengerState].
  ScaffoldMessengerState get scaffoldMessenger {
    return ScaffoldMessenger.of(this);
  }

  /// Returns [FocusScopeNode].
  FocusScopeNode get focusScope {
    return FocusScope.of(this);
  }
}
