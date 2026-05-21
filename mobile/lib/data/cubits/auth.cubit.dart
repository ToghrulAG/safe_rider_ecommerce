import 'package:flutter_bloc/flutter_bloc.dart';
import './auth.state.dart';
import '../repositories/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(AuthInitial());

  Future<void> loginWithGoogle() async {
    emit(AuthLoading());

    try {
      final user = await _authRepository.signInWithGoogle();

      if (user != null) {
        emit(AuthSuccess(user));
      } else {
        emit(AuthError('Login was rejected from server'));
      }
    } catch (e) {
      emit(AuthError('Error was detected $e'));
    }
  }

  void logout() {
    emit(AuthInitial());
  }
}
