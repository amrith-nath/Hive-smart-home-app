part of "auth_bloc.dart";

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object> get props => [];
}

class EmailChanged extends AuthEvent {
  const EmailChanged({required this.email});

  final String email;
  @override
  List<Object> get props => [email];
}

class EmailUnfocused extends AuthEvent {}

class NameChanged extends AuthEvent {
  const NameChanged({required this.name});

  final String name;
  @override
  List<Object> get props => [name];
}

class NameUnfocused extends AuthEvent {}

class PasswordChanged extends AuthEvent {
  const PasswordChanged({required this.password});

  final String password;
  @override
  List<Object> get props => [password];
}

class PasswordUnfocused extends AuthEvent {}

class SignInButtonClick extends AuthEvent {}

class RegisterButtonClick extends AuthEvent {}
