import 'dart:math';

class UuidUtils {
  static String generate() {
    final random = Random();
    const chars = 'abcdef0123456789';
    return List.generate(16, (index) => chars[random.nextInt(chars.length)]).join();
  }
}
