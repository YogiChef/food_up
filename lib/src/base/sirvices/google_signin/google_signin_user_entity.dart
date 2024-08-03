import 'package:firebase_auth/firebase_auth.dart';

class GoogleSignInUserEntity {
  String? displayName;
  String? email;
  bool? emailVerified;
  bool? isAnonymous;
  String? phoneNumber;
  String? photoUrl;
  String? refreshToken;
  String? tenantId;
  String? uid;
  String? idToken;

  GoogleSignInUserEntity(User? user, String? token) {
    displayName = user?.displayName;
    email = user?.email;
    emailVerified = user?.emailVerified;
    isAnonymous = user?.isAnonymous;
    phoneNumber = user?.phoneNumber;
    photoUrl = user?.photoURL;
    refreshToken = user?.refreshToken;
    tenantId = user?.tenantId;
    uid = user?.uid;
    idToken = idToken;
  }
}
