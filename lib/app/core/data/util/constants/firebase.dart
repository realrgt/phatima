import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

final _auth = Modular.get<FirebaseAuth>();

final userId = _auth.currentUser!.uid;
