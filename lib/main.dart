import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mydemo/Screens/EmailAuthWithBloc/sign_in/bloc/sign_in_bloc.dart';
import 'package:mydemo/Screens/practices/OtpVerification/cubits/auth_cubit/auth_cubit.dart';
import 'package:mydemo/Screens/practices/OtpVerification/cubits/auth_cubit/auth_state.dart';
import 'package:mydemo/splash_screen/splash_screen.dart';
import 'Introduction_screen/myintroscreen.dart';
import 'Screens/EmailAuthWithBloc/sign_in/sign_in_screen.dart';
import 'Screens/api/apicalling.dart';
import 'Screens/api/apicalling2.dart';
import 'Screens/practices/OtpVerification/otpverification.dart';
import 'Screens/practices/OtpVerification/verify_phonenumber_screen.dart';
import 'Screens/practices/chewie.dart';
import 'Screens/practices/giphy.dart';
import 'Screens/practices/link_preview_genrator.dart';
import 'Screens/practices/liquid_pull_refresh.dart';
import 'Screens/practices/local_auth.dart';
import 'Screens/practices/refreshwidget.dart';
import 'Screens/practices/table_celendar.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Splash(),
        routes: {
          '/apicall': (context) => const Myapicalling(),
          '/apicall2': (context) => const Myapicalling2(),
          '/signinpage': (context) => BlocProvider(
                create: (context) => SignInBloc(),
                child: const MySignInCreen(),
              ),
          '/localauth': (context) => const MylocalAuthh(),
          // '/justaudio': (context) => const Myjustaudioo(),
          '/myrefreshwidget': (context) => const Myrefreshwidget(),
          '/liquidpullrefresh': (context) => const Myliquidpullrefresh(),
          '/chewie': (context) => const Videoplayerview(),
          '/onboardingpage': (context) => const OnBoardingPage(),
          '/otpverification': (context) => BlocBuilder<AuthCubit, AuthState>(
                buildWhen: (oldState, newState) {
                  return oldState is AuthInitialState;
                },
                builder: (context, state) {
                  if (state is AuthLoggedInState) {
                    return const MyHomePage();
                  } else if (state is AuthLoggedOutState) {
                    return const MyotpVefication();
                  } else {
                    return const Scaffold(
                        body: Center(child: Text('Something went Wrong !!')));
                  }
                },
              ),
          '/verifyphonenumberscreen': (context) =>
              const VerifyPhoneNumberScreen(),
          '/linkpreviewgenrator': (context) => const Linkpreviewgenrator(),
          '/giphy': (context) => const Giphy(),
          '/tablecelendar': (context) => const Mytablecelendar(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              "HomePage",
              style: TextStyle(color: Colors.white),
            ),
            actions: <Widget>[
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoggedOutState) {
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const MyotpVefication()));
                  }
                },
                builder: (context, state) {
                  return IconButton(
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context).logout();
                      },
                      icon: const Icon(Icons.search, color: Colors.white));
                },
              )
            ]),
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/apicall');
              },
              child: const Text('Api Calling')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/apicall2');
              },
              child: const Text('Api Calling 2')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signinpage');
              },
              child: const Text('Sign in With Bloc')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/localauth');
              },
              child: const Text('Local Authentication')),
          // ElevatedButton(
          //     onPressed: () {
          //       Navigator.pushNamed(context, '/justaudio');
          //     },
          //     child: const Text('Just Audio')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/myrefreshwidget');
              },
              child: const Text('Refresh Widget')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/liquidpullrefresh');
              },
              child: const Text('Liquid Pull Refresh')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/chewie');
              },
              child: const Text('chewie')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/otpverification');
              },
              child: const Text('OTP Verification')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/linkpreviewgenrator');
              },
              child: const Text('Link Preview')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/giphy');
              },
              child: const Text('Giphy')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/tablecelendar');
              },
              child: const Text('Table Celendar')),
        ]))));
  }
}
