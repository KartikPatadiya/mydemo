// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class SignInState {}

class SignInInitialState extends SignInState {}

class SignInInvalidState extends SignInState {}

class SignInvalidState extends SignInState {}

class SignInErrorState extends SignInState {
  final String errorMessage;
  SignInErrorState({
    required this.errorMessage,
  });
}

class SignInLoadingState extends SignInState {}
