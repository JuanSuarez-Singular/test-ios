import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class InstallLogicFirebaseUser {
  InstallLogicFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

InstallLogicFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<InstallLogicFirebaseUser> installLogicFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<InstallLogicFirebaseUser>(
      (user) {
        currentUser = InstallLogicFirebaseUser(user);
        return currentUser!;
      },
    );
