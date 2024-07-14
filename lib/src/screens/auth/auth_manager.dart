import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recycling_app/src/bloc/auth/auth_bloc.dart';
import 'package:recycling_app/src/bloc/auth/states/auth_states.dart';
import 'package:recycling_app/src/screens/auth/register_screen.dart';

class AuthManager extends StatelessWidget{
  const AuthManager({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => AuthBloc(),
      child: Scaffold(body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthInitial) {
            return RegisterScreen();
          } else if(state is AuthRegister){
            return RegisterScreen();
          } else if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AuthSuccess) {
            return Container();
          } else {
            return RegisterScreen();
          }
        },
      ),)
    );
  }

}