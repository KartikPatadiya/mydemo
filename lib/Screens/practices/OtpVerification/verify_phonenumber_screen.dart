import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mydemo/main.dart';

import 'cubits/auth_cubit/auth_cubit.dart';
import 'cubits/auth_cubit/auth_state.dart';

class VerifyPhoneNumberScreen extends StatefulWidget {
  const VerifyPhoneNumberScreen({super.key});

  @override
  State<VerifyPhoneNumberScreen> createState() =>
      _VerifyPhoneNumberScreenState();
}

class _VerifyPhoneNumberScreenState extends State<VerifyPhoneNumberScreen> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            TextFormField(
              controller: otpController,
              maxLength: 10,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter 6-Digit OTP",
                  counterText: ""),
            ),
            const SizedBox(
              height: 15,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthLoggedInState) {
                  Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const MyHomePage()));
                } else if (state is AuthErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                    content: Text(state.error),
                    duration: const Duration(milliseconds: 600),
                  ));
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
                      BlocProvider.of<AuthCubit>(context)
                          .verifyOTP(otpController.text);
                    },
                    color: Colors.blue,
                    child: const Text('Verifiy'),
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
