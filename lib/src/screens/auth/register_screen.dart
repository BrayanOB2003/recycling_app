import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recycling_app/src/bloc/auth/auth_bloc.dart';
import 'package:recycling_app/src/bloc/auth/events/auth_events.dart';
import 'package:recycling_app/src/model/create_user_model.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("tapped");
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        const Text(
                          "Registro",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const Text("Crea una cuenta con tu correo."),
                        textFields(),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(RegisterEvent(
                                  createUserModel: CreateUserModel(
                                      null,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      address: addressController.text)));
                            }
                          },
                          child: const Text('Registrarse'),
                        ),
                      ],
                    )
                  )
                )
              )
          ),
        );
  }

  Widget textFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Correo electronico"),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'correo@gmail.com',
          ),
          controller: emailController,
          validator: emailValidator,
        ),
        const SizedBox(
          height: 10,
        ),
        Text("Dirección"),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Dirección',
          ),
          controller: addressController,
          validator: generalValidator,
        ),
        const SizedBox(
          height: 10,
        ),
        Text("Contraseña"),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Ejemplo123456',
          ),
          controller: passwordController,
          validator: generalValidator,
        ),
      ],
    );
  }

  String? generalValidator(String? value) {
    if (value == null) {
      return null;
    }

    if (value.trim().isEmpty) {
      return 'Este campo es obligatorio';
    }

    return null;
  }

  String? emailValidator(String? value) {
    if (value == null) {
      return null;
    }

    if (value.trim().isEmpty) {
      return 'Este campo es obligatorio';
    }

    if (!value.trim().contains('@')) {
      return 'Correo inválido';
    }

    return null;
  }
}
