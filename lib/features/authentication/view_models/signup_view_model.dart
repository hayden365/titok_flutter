import 'dart:async';

import 'package:riverpod/riverpod.dart';
import 'package:titok_flutter/features/authentication/repos/authentication_repo.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> signUp() async {
    state = const AsyncValue.loading();
    final form = ref.read(signUpForm);
    state = await AsyncValue.guard(
      () async => await _authRepo.signUp(
        form["email"],
        form["password"],
      ),
    );
  }
}

final signUpForm = StateProvider((ref) => {});

final signUpProvider =
    AsyncNotifierProvider<SignUpViewModel, void>(() => SignUpViewModel());
