import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mydemo/Screens/EmailAuthWithBloc/sign_in/bloc/sign_in_event.dart';
import 'package:mydemo/Screens/EmailAuthWithBloc/sign_in/bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInTextChangedEvent>((event, emit) => {
          if (event.email == "" ||
              EmailValidator.validate(event.email) == false)
            {
              emit(SignInErrorState(
                  errorMessage: "please Enter a Valid Email address"))
            }
          else if (event.password.length < 8)
            {
              emit(SignInErrorState(
                  errorMessage: "Please Enter a Valid Password"))
            }
          else
            {emit(SignInvalidState())}
        });
    on<SignInSubmittedEvent>((event, emit) => {emit(SignInLoadingState())});
  }
}
