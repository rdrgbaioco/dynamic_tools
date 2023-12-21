import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  /// Returns if the theme is actually in dark mode.
  bool get isDarkMode {
    final brightness = MediaQuery.maybePlatformBrightnessOf(this);
    if (brightness == null) return false;
    return brightness == Brightness.dark;
  }

  /// Allow to get the [NavigatorState] from the current [BuildContext].
  NavigatorState get navigator {
    return Navigator.of(this);
  }

  /// Returns the height size of the current [MediaQuery].
  double get currentHeight {
    return MediaQuery.sizeOf(this).height;
  }

  /// Returns the width size of the current [MediaQuery].
  double get currentWidth {
    return MediaQuery.sizeOf(this).width;
  }

  /// Returns the current size calculated by [MediaQuery].
  Size get currentSize {
    return MediaQuery.sizeOf(this);
  }

  double get keyboardHeight {
    return MediaQuery.viewInsetsOf(this).bottom;
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
  ScaffoldMessengerState? get scaffoldMessenger {
    return ScaffoldMessenger.maybeOf(this);
  }

  /// Returns [FocusNode].
  FocusNode? get focusScope {
    return Focus.maybeOf(this);
  }
}
