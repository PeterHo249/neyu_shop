enum WindowSizeType {
  small,
  medium,
  large,
}

WindowSizeType getWindowSizeType(double width) {
  if (width < 640.0) return WindowSizeType.small;
  if (width > 1008.0) return WindowSizeType.large;
  return WindowSizeType.medium;
}
