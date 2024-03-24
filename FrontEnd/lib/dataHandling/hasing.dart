import 'dart:convert';
import 'package:crypto/crypto.dart';

class HashingService {

  static String hashString(String input) {

    List<int> bytes = utf8.encode(input);
    Digest digest = sha256.convert(bytes);
    return digest.toString();

  }

  static bool verifyHash(String input, String hashedString) {

    String inputHash = hashString(input);
    return inputHash == hashedString;
  }
}
