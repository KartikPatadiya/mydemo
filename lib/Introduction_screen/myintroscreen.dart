import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mydemo/main.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        scrollPhysics: const BouncingScrollPhysics(),
        pages: [
          PageViewModel(
              titleWidget: const Text('This is a first page',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              body:
                  "This is a first page of introduction screen,This is a first page of introduction screen,This is a first page of introduction screen.",
              image: Image.network(
                'https://img.freepik.com/premium-vector/web-designers-working-website-application-interface-ui-ux-characters-develop-design-mobile-application_87771-24804.jpg',
                fit: BoxFit.fill,
                height: 300,
                width: 300,
              )),
          PageViewModel(
              titleWidget: const Text('This is a second page',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              body:
                  "This is a first page of introduction screen,This is a first page of introduction screen,This is a first page of introduction screen.",
              image: Image.network(
                'https://img.freepik.com/free-vector/people-search-concept-illustration_114360-977.jpg?w=2000',
                fit: BoxFit.fill,
                height: 300,
                width: 300,
              )),
          PageViewModel(
              titleWidget: const Text('This is a third page',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              body:
                  "This is a first page of introduction screen,This is a first page of introduction screen,This is a first page of introduction screen.",
              image: Image.network(
                'https://img.freepik.com/premium-vector/monitor-mobile-with-same-interface-flat-illustration-adaptive-design_203633-7720.jpg?w=2000',
                fit: BoxFit.fill,
                height: 300,
                width: 300,
              ))
        ],
        onDone: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MyHomePage()));
        },
        onSkip: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MyHomePage()));
        },
        showSkipButton: true,
        skip: const Text(
          "Skip",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blue),
        ),
        next: const Icon(
          Icons.arrow_forward,
          color: Colors.blue,
        ),
        done: const Text(
          "Done",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blue),
        ),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20, 10),
            color: Colors.black26,
            activeColor: Colors.blue,
            spacing: const EdgeInsets.symmetric(horizontal: 3),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
