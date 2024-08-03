import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/repos/auth/auth_repo.dart';
import 'package:hive/services/session_controller/session_controller.dart';
import 'package:hive/utils/string_extensions.dart';
import '../../utils/utils.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _authRepo = AuthRepo();

  AuthBloc() : super(const AuthState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<NameChanged>(_onNameChanged);
    on<SignInButtonClick>(_signInButtonClick);
    on<RegisterButtonClick>(_registerButtonClick);
  }

  _onEmailChanged(EmailChanged event, Emitter<AuthState> emit) {
    emit(
      state.copyWith(email: event.email, apiStatus: ApiStatus.initial),
    );
  }

  _onPasswordChanged(PasswordChanged event, Emitter<AuthState> emit) {
    emit(
      state.copyWith(password: event.password, apiStatus: ApiStatus.initial),
    );
  }

  _onNameChanged(NameChanged event, Emitter<AuthState> emit) {
    emit(
      state.copyWith(name: event.name, apiStatus: ApiStatus.initial),
    );
  }

  _signInButtonClick(SignInButtonClick event, Emitter<AuthState> emit) async {
    emit(
      state.copyWith(
        message: "loading",
        apiStatus: ApiStatus.loading,
      ),
    );

    await _authRepo
        .signInWithEmailAndPassword(
            email: state.email, password: state.password)
        .then((user) async {
      if (user != null) {
        await SessionController().saveUserInPreference(
            userName: user.displayName!, email: user.email!);
        await SessionController().getUserDataFromPreference();

        emit(
          state.copyWith(
            name: user.displayName,
            message: "SignIn successfull",
            apiStatus: ApiStatus.success,
          ),
        );
      } else {
        emit(
          state.copyWith(
            message: "Something went wrong",
            apiStatus: ApiStatus.error,
          ),
        );
      }
    }, onError: (error, stackTrace) {
      emit(state.copyWith(
        message: error.toString().parseError(),
        apiStatus: ApiStatus.error,
      ));
    });
  }

  _registerButtonClick(
      RegisterButtonClick event, Emitter<AuthState> emit) async {
    emit(
      state.copyWith(
        message: "loading",
        apiStatus: ApiStatus.loading,
      ),
    );
    await _authRepo
        .signUpWithEmailAndPassword(
      userName: state.name,
      email: state.email,
      password: state.password,
    )
        .then((user) async {
      if (user != null) {
        await SessionController()
            .saveUserInPreference(userName: state.name, email: user.email!);
        await SessionController().getUserDataFromPreference();

        emit(
          state.copyWith(
            message: "Account created",
            apiStatus: ApiStatus.success,
          ),
        );
      } else {
        emit(
          state.copyWith(
            message: "Something went wrong",
            apiStatus: ApiStatus.error,
          ),
        );
      }
    }, onError: (error, stackTrace) {
      emit(state.copyWith(
        message: error.toString().parseError(),
        apiStatus: ApiStatus.error,
      ));
    });
  }
}
