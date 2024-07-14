import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recycling_app/src/bloc/auth/events/auth_events.dart';
import 'package:recycling_app/src/bloc/auth/states/auth_states.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  AuthBloc() : super(AuthInitial()) {
    on<RegisterEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await firebaseAuth.createUserWithEmailAndPassword(email: event.email, password: event.password).then(
          (value) {
            emit(AuthSuccess());
          },
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          emit(AuthError('The password provided is too weak.'));
        } else if (e.code == 'email-already-in-use') {
          emit(AuthError('The account already exists for that email.'));
        }
      } catch (e) {
        AuthError(e.toString());
      }
    });
  }
}
