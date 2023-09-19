import 'package:encrypt/encrypt.dart' as encrypt;

class MyEncryptionDecryption {


  //for AES Encryption/Decryption
  static final key = encrypt.Key.fromLength(32);
  static final iv = encrypt.IV.fromLength(16);
  static final encrypter = encrypt.Encrypter(encrypt.AES(key));

  static encryptAES(text) {
    final encrypted = encrypter.encrypt(text, iv: iv);
    print(encrypted.bytes);
    print(encrypted.base16);
    print(encrypted.base64);
    return encrypted;
  }

  static decryptAES(text) {
    return encrypter.decrypt(text, iv: iv);
  }


//for FERNET Encryption/Decryption (Decryption always changed)
  static final keyFernet = encrypt.Key.fromUtf8(
      "thisismykeythisismykeythisismyky"); // key must be 32 character
  static final fernet = encrypt.Fernet(keyFernet);
  static final encrypterFernet = encrypt.Encrypter(fernet);

  static encryptFernet(text) {
    final encrypted = encrypterFernet.encrypt(text);
    return encrypted;
  }

  static decryptFernet(text) {
    return encrypterFernet.decrypt(text);
  }


//for Salsa20 Encryption/Decryption
  static final keySalsa20 = encrypt.Key.fromLength(32);
  static final ivSalsa20 = encrypt.IV.fromLength(8);
  static final encrypterSalsa20 = encrypt.Encrypter(encrypt.Salsa20(keySalsa20));

  static encryptSalsa20(text){
    return encrypterSalsa20.encrypt(text ,iv: ivSalsa20);
  }
  static decryptSalsa20(text){
    return encrypterSalsa20.decrypt(text ,iv: ivSalsa20);
  }
}