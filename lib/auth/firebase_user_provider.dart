import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class FlutterProjectFirebaseUser {
  FlutterProjectFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

FlutterProjectFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<FlutterProjectFirebaseUser> flutterProjectFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<FlutterProjectFirebaseUser>(
            (user) => currentUser = FlutterProjectFirebaseUser(user));
