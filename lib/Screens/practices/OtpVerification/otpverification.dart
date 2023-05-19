import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mydemo/Screens/practices/OtpVerification/cubits/auth_cubit/auth_cubit.dart';
import 'package:mydemo/Screens/practices/OtpVerification/cubits/auth_cubit/auth_state.dart';
import 'package:mydemo/Screens/practices/OtpVerification/verify_phonenumber_screen.dart';

class MyotpVefication extends StatefulWidget {
  const MyotpVefication({super.key});

  @override
  State<MyotpVefication> createState() => _MyotpVeficationState();
}

class _MyotpVeficationState extends State<MyotpVefication> {
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification Using Bloc'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            TextFormField(
              controller: phoneController,
              maxLength: 10,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Phone Number",
                  counterText: ""),
            ),
            const SizedBox(
              height: 15,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthCodeSentState) {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              const VerifyPhoneNumberScreen()));
                } else {
                  print('otp not send');
                }
              },
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CupertinoButton(
                    onPressed: () {
                      String phonenumber = "+91${phoneController.text}";
                      BlocProvider.of<AuthCubit>(context).sendOTP(phonenumber);
                    },
                    color: Colors.blue,
                    child: const Text('Sign In'),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
