import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mydemo/Screens/EmailAuthWithBloc/sign_in/bloc/sign_in_bloc.dart';
import 'package:mydemo/Screens/EmailAuthWithBloc/sign_in/bloc/sign_in_event.dart';
import 'package:mydemo/Screens/EmailAuthWithBloc/sign_in/bloc/sign_in_state.dart';

class MySignInCreen extends StatefulWidget {
  const MySignInCreen({super.key});

  @override
  State<MySignInCreen> createState() => _MySignInCreenState();
}

class _MySignInCreenState extends State<MySignInCreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sigin In With Bloc'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(38.0),
          child: ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: [
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInErrorState) {
                    return Text(
                      state.errorMessage,
                      style: const TextStyle(color: Colors.red),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: emailController,
                onChanged: (val) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SignInTextChangedEvent(
                          emailController.text, passwordController.text));
                },
                decoration: const InputDecoration(hintText: "Email Address"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: passwordController,
                onChanged: (val) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SignInTextChangedEvent(
                          emailController.text, passwordController.text));
                },
                decoration: const InputDecoration(hintText: "Password"),
              ),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: (state is SignInvalidState)
                              ? const MaterialStatePropertyAll(Colors.blue)
                              : const MaterialStatePropertyAll(Colors.grey)),
                      onPressed: () {
                        if (state is SignInvalidState) {}
                        BlocProvider.of<SignInBloc>(context).add(
                            SignInSubmittedEvent(
                                emailController.text, passwordController.text));
                      },
                      child: const Text('Sign In'));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
