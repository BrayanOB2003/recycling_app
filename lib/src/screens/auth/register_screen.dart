import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
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
                          style: ButtonStyle(
                            minimumSize: WidgetStateProperty.all(const Size(400, 50)),
                          ),
                          onPressed: () {
                            validateForm()? registerUser(context): null;
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
        const Text("Correo electronico"),
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.email),
            labelText: 'correo@gmail.com',
            border: OutlineInputBorder(),
          ),
          controller: emailController,
          validator: emailValidator,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text("Dirección"),
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.location_on),
            labelText: 'Cr 5 # 10-20',
            border: OutlineInputBorder(),
          ),
          controller: addressController,
          validator: generalValidator,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text("Contraseña"),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            icon: Icon(Icons.lock),
            labelText: 'Ejemplo123456',
            border: OutlineInputBorder(),
          ),
          controller: passwordController,
          validator: generalValidator,
        ),
      ],
    );
  }

  bool validateForm() {
    return _formKey.currentState!.validate();
  }

  void registerUser(BuildContext context){
      final CreateUserModel newUser = CreateUserModel(
          email: emailController.text,
          password: passwordController.text,
          address: addressController.text);

      context.read<AuthBloc>().add(
        RegisterEvent(
          createUserModel: newUser));
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
