part of "auth_bloc.dart";

class AuthState extends Equatable {
  const AuthState({
    this.email = '',
    this.password = '',
    this.name = '',
    this.errorMessage = '',
    this.apiStatus = ApiStatus.initial,
  });

  final String email;
  final String password;
  final String name;
  final ApiStatus apiStatus;
  final String errorMessage;

  AuthState copyWith({
    String? email,
    String? password,
    String? name,
    ApiStatus? apiStatus,
    String? errorMessage,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      apiStatus: apiStatus ?? this.apiStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [email, password, name, apiStatus, errorMessage];
}
