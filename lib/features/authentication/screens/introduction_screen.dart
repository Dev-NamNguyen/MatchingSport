import 'package:flutter/material.dart';
import 'package:matchingsport/features/authentication/widgets/linear_recommend_sport.dart';
import 'package:matchingsport/features/authentication/widgets/main_background.dart';
import 'package:matchingsport/models/content_introduction_model.dart';
import 'package:matchingsport/res/widgets/atoms/base_button.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    //mock data
    final List<ContentIntroductionModel> newsItems = [
      ContentIntroductionModel(
          title: "Sport as a hobby",
          content:
              "This is the perfect place to keep track of your hobbies and practice the sport you like!"),
      ContentIntroductionModel(
          title: "Sport as a hobby",
          content:
              "This is the perfect place to keep track of your hobbies and practice the sport you like!"),
      ContentIntroductionModel(
          title: "Sport as a hobby",
          content:
              "This is the perfect place to keep track of your hobbies and practice the sport you like!"),
      ContentIntroductionModel(
          title: "Sport as a hobby",
          content:
              "This is the perfect place to keep track of your hobbies and practice the sport you like!"),
    ];

    return Scaffold(
      body: MainBackground(
        child: Column(
          children: [
            Image(
              image: const AssetImage("assets/pngs/intro_background.png"),
              height: screenSize.height * 0.5,
              width: screenSize.width,
              fit: BoxFit.fill,
            ),
            Expanded(
                child: SafeArea(
                    child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LinearRecommendSport(newsItems: newsItems),
                  SizedBox(height: screenSize.height * 0.07),
                  Column(
                    children: [
                      BaseButton(
                        onPressed: () {},
                        content: "Join now",
                        backgroundColor: Colors.white,
                        tintColor: Colors.blue.shade700,
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "Already a member? Log in",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 15),
                    ],
                  )
                ],
              ),
            )))
          ],
        ),
      ),
    );
  }
}
