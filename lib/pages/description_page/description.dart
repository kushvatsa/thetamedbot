import "package:flutter/material.dart";
import "package:introduction_screen/introduction_screen.dart";

class Description extends StatefulWidget {
  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  void _introEnd(context) {
    Navigator.pushReplacementNamed(context, '/sup');
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      pages: [
        PageViewModel(
          decoration: PageDecoration(
              pageColor: Colors.white,
              titleTextStyle:
                  TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          image: Image.asset("assets/logo_Theta_MedBot_v1.png"),
          title: "ThetaMedBot",
          body:
              "ThetaMedBot keeps your skin healthy with regular skin checks\n In ThetaMedBot we care about awareness of skin cancer and provide a mobile service to help individuals assess their risk of being diseased. ",
        ),
        PageViewModel(
          decoration: PageDecoration(
              pageColor: Colors.white,
              titleTextStyle:
                  TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          image: Image.asset("assets/design_2.png"),
          title: "Capture your skin spot on camera",
          body:
              "Take or upload a photo of the skin spot that concerns you within our App.ThetaMedBot will assess your photo using our AI-based algorithm.",
        ),
        PageViewModel(
          decoration: PageDecoration(
              pageColor: Colors.white,
              titleTextStyle:
                  TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          image: Image.asset("assets/design_3.jpg"),
          title: "Get the assessment of your risk",
          body:
              "Within short period of time, you'll receive the result of your skin check. ThetaMedBot will tell whether your skin spot is benign or there is a high probability of being malignant.",
        ),
        PageViewModel(
            decoration: PageDecoration(
                pageColor: Colors.white,
                titleTextStyle:
                    TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            image: Image.asset("assets/design_4.png"),
            title: "Track your skin spots",
            body:
                "ThetaMedBot securely store the history of your checks so that you can you can look for changes over time.")
      ],
      onDone: () => _introEnd(context),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    ));
  }
}
