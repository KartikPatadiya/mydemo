import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mydemo/Screens/practices/OtpVerification/cubits/auth_cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthCubit() : super(AuthInitialState()) {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      //Login
      emit(AuthLoggedInState(currentUser));
    } else {
      //Logout
      emit(AuthLoggedOutState());
    }
  }
//================
  String? _verificationId;

  void sendOTP(String phonenumber) async {
    emit(AuthLoadingState());
    await _auth.verifyPhoneNumber(
        phoneNumber: phonenumber,
        codeSent: (verificationId, forceResendingToken) {
          _verificationId = verificationId;
          emit(AuthCodeSentState());
        },
        verificationCompleted: (phoneAuthCredential) {
          signInWithPhone(phoneAuthCredential);
        },
        verificationFailed: (error) {
          emit(AuthErrorState(error.message.toString()));
        },
        codeAutoRetrievalTimeout: (verificationId) {
          _verificationId = verificationId;
        });
  }

//================
  void verifyOTP(String otp) async {
    emit(AuthLoadingState());
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!, smsCode: otp);
    signInWithPhone(credential);
  }

//================
  void signInWithPhone(PhoneAuthCredential credential) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        emit(AuthLoggedInState(userCredential.user!));
      }
    } on FirebaseAuthException catch (ex) {
      emit(AuthErrorState(ex.message.toString()));
    }
  }

//================
  void logout() async {
    await _auth.signOut();
    emit(AuthLoggedOutState());
  }
}
