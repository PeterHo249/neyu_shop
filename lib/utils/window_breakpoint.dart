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
