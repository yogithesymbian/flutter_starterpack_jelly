import 'package:flutter_starterpack_jelly/services/networking.dart';
import 'package:flutter_starterpack_jelly/services/storage/storage.dart';
import 'package:flutter_starterpack_jelly/utils/anim/duratioin.dart';
import 'package:flutter_starterpack_jelly/utils/value.dart';

// TODO : api_route
const signUpPath = '/api/auth/signup';
const signInPath = '/api/auth/signin';
const testGet = '/api/test/all';
const testGet1 = '/api/test/admin';
const testGet2 = '/api/test/user';

class AuthService {
  NetworkingHelper? _networkingHelper;

  Future<String?> message(message) {
    return Future.delayed(duration2Sec).then((_) {
      if (message.toString().contains('signIn0')) {
        return 'SignIn Successfully';
      }
      if (message.toString().contains('signIn1')) {
        return 'SignIn UnSuccessfully';
      }
      if (message.toString().contains('signUp0')) {
        return 'SignUp Successfully';
      }
      if (message.toString().contains('signUp1')) {
        return 'SignUp UnSuccessfully';
      }
      return null;
    });
  }

  Future<dynamic> signUp(body) async {
    print('uri : $kApiUri$signUpPath');
    _networkingHelper = NetworkingHelper(
      url: '$kApiUri$signUpPath',
    );
    return await _networkingHelper?.postData(body);
  }

  Future<dynamic> signIn(body) async {
    print('uri : $kApiUri$signInPath');
    _networkingHelper = NetworkingHelper(
      url: '$kApiUri$signInPath',
    );
    return await _networkingHelper?.postData(body);
  }

  Future<dynamic> testGetData() async {
    print('uri : $kApiUri$testGet');
    _networkingHelper = NetworkingHelper(
      url: '$kApiUri$testGet2',
    );
    return await _networkingHelper?.getData();
  }

  Future<void> store(response) async {
    final secureStorage = SecureStorage();
    await secureStorage.writeSecureData(
      kEmail,
      response['user']['email'],
    );
    await secureStorage.writeSecureData(
      kBearer,
      response['accessToken'],
    );
  }
}
