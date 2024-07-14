import 'package:recycling_app/src/model/create_user_model.dart';

abstract class AuthEvent {}

class RegisterEvent extends AuthEvent {
  final CreateUserModel createUserModel;
  
  RegisterEvent({required this.createUserModel});
}