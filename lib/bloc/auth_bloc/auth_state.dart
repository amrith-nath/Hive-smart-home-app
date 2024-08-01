part of "auth_bloc.dart";

class AuthState extends Equatable {
  const AuthState({
    this.email = '',
    this.password = '',
    this.name = '',
  });

  final String email;
  final String password;
  final String name;

  AuthState copyWith({
    String? email,
    String? password,
    String? name,
  }) {
    return AuthState(
        email: email ?? this.email,
        password: password ?? this.password,
        name: name ?? this.name);
  }

  @override
  List<Object?> get props => [];
}
