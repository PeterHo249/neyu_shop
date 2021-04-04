import 'package:flutter/cupertino.dart';

enum WindowType {
  small,
  medium,
  large,
}

WindowType getWindowType(double width) {
  if (width < 640.0) return WindowType.small;
  if (width > 1008.0) return WindowType.large;
  return WindowType.medium;
}

int getTileCountOnRow(BuildContext context) {
  WindowType windowType = getWindowType(MediaQuery.of(context).size.width);

  switch (windowType) {
    case WindowType.large:
      return 4;
    case WindowType.medium:
      return 3;
    case WindowType.small:
      return 2;
  }
}
