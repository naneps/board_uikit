import 'dart:math';

class Generator {
  static final Random _secureRandom = Random.secure();

  /// Generates a random color with customizable darkness/lightness.
  ///
  /// The [minDarkness] and [maxLightness] parameters control the darkness/lightness range.
  /// Both values should be between 0 and 255, where 0 is the darkest (black) and 255 is the lightest (white).
  static String generateRandomColor({
    int minDarkness = 0,
    int maxLightness = 255,
  }) {
    int red = _secureRandom.nextInt(256); // Random red component (0-255)
    int green = _secureRandom.nextInt(256); // Random green component (0-255)
    int blue = _secureRandom.nextInt(256); // Random blue component (0-255)
    // Adjust color components based on darkness/lightness range
    red = _adjustColorComponent(red, minDarkness, maxLightness);
    green = _adjustColorComponent(green, minDarkness, maxLightness);
    blue = _adjustColorComponent(blue, minDarkness, maxLightness);

    return '0xFF${red.toRadixString(16).padLeft(2, '0')}'
        '${green.toRadixString(16).padLeft(2, '0')}'
        '${blue.toRadixString(16).padLeft(2, '0')}';
  }

  static String generateRandomName() {
    const names = [
      'John Doe',
      'Jane Doe',
      'Alice',
      'Bob',
      'Charlie',
      'David',
      'Eve',
      'Frank',
      'Grace',
      'Hank',
      'Ivy',
      'Jack',
      'Kate',
      'Liam',
      'Mia',
      'Noah',
      'Olivia',
      'Peter',
      'Quinn',
      'Ryan',
      'Sara',
      'Tom',
      'Uma',
      'Vince',
      'Wendy',
      'Xander',
      'Yara',
      'Zack',
    ];
    return names[_secureRandom.nextInt(names.length)];
  }

  /// Generates a random string of alphanumeric characters with the specified [length].
  static String generateRandomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    return String.fromCharCodes(
      Iterable.generate(
          length, (_) => chars.codeUnitAt(_secureRandom.nextInt(chars.length))),
    );
  }

  /// Generates a unique ID based on the current milliseconds since epoch.
  static String generateUniqueId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  /// Adjusts a color component (red, green, or blue) based on darkness/lightness range.
  ///
  /// The [value] is the original color component value (0-255).
  /// The [minDarkness] and [maxLightness] control the darkness/lightness range (0-255).
  static int _adjustColorComponent(
      int value, int minDarkness, int maxLightness) {
    int adjustedValue = value;
    if (minDarkness > 0) {
      // Increase darkness by subtracting from the color component
      adjustedValue -= _secureRandom.nextInt(minDarkness + 1);
      adjustedValue = max(0, adjustedValue); // Ensure the value is not negative
    }
    if (maxLightness < 255) {
      // Increase lightness by adding to the color component
      adjustedValue += _secureRandom.nextInt(255 - maxLightness + 1);
      adjustedValue =
          min(255, adjustedValue); // Ensure the value does not exceed 255
    }
    return adjustedValue;
  }
}
