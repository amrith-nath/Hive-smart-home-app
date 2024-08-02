part of "auth_bloc.dart";

class AuthState extends Equatable {
  const AuthState({
    this.email = '',
    this.password = '',
    this.name = '',
    this.message = '',
    this.apiStatus = ApiStatus.initial,
  });

  final String email;
  final String password;
  final String name;
  final ApiStatus apiStatus;
  final String message;

  AuthState copyWith({
    String? email,
    String? password,
    String? name,
    ApiStatus? apiStatus,
    String? message,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      apiStatus: apiStatus ?? this.apiStatus,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [email, password, name, apiStatus, message];
}
