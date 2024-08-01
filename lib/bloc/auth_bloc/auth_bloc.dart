import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/config/config.dart';

import '../../utils/utils.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<NameChanged>(_onNameChanged);
  }

  _onEmailChanged(EmailChanged event, Emitter<AuthState> emit) {
    emit(
      state.copyWith(
        email: event.email,
      ),
    );
  }

  _onPasswordChanged(PasswordChanged event, Emitter<AuthState> emit) {
    emit(
      state.copyWith(
        password: event.password,
      ),
    );
  }

  _onNameChanged(NameChanged event, Emitter<AuthState> emit) {
    emit(
      state.copyWith(
        name: event.name,
      ),
    );
  }
}
