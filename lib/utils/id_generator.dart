import 'dart:math';

String generateId() {
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final random = Random();
  final stringBuffer = StringBuffer();
  
  for (var i = 0; i < 16; i++) {
    stringBuffer.write(chars[random.nextInt(chars.length)]);
  }
  
  return stringBuffer.toString();
}