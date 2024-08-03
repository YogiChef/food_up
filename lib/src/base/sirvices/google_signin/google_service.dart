import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:move_on/src/base/api_sevices/errors/api_error.dart';
import 'package:move_on/src/base/sirvices/realtime_database_service/interfaces.dart';
import 'package:move_on/src/base/sirvices/realtime_database_service/services/realtime_datbase_service.dart';

import 'google_signin_user_entity.dart';

abstract class GoogleSignInService {
  Future<GoogleSignInUserEntity> signInWithGoogle();
  Future<bool> isUserInDatabase({required String uid});
}

class DefaultGoogleSignInService extends GoogleSignInService {
  final String _path = 'users/';

  final RealtimeDatabaseService _realTimeDatabaseService;

  DefaultGoogleSignInService({RealtimeDatabaseService? realTimeDatabaseService})
      : _realTimeDatabaseService =
            realTimeDatabaseService ?? DefaultRealtimeDatabaseService();
  @override
  Future<bool> isUserInDatabase({required String uid}) async {
    final fullPath = _path + uid;
    try {
      final result = await _realTimeDatabaseService.getData(path: fullPath);
      return result.isNotEmpty;
    } on Failure {
      return false;
    }
  }

  @override
  Future<GoogleSignInUserEntity> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    return GoogleSignInMapper.mapUserCredential(
        userCredential, googleAuth?.idToken ?? '');
  }
}

class GoogleSignInMapper {
  static GoogleSignInUserEntity mapUserCredential(
      UserCredential credential, String idToken) {
    return GoogleSignInUserEntity(credential.user, idToken);
  }
}
