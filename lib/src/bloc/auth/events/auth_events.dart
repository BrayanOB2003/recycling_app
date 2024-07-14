abstract class AuthEvent {}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final String address;

  RegisterEvent({required this.email, required this.password, required this.address});
}