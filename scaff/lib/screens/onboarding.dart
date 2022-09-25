import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:scaff/components/custom_outline.dart';
import 'package:scaff/constants.dart';
import 'package:scaff/screens/home.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      backgroundColor: Constants.kBlackColor,
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            Positioned(
              top: screenHeight * 0.1,
              left: -80,
              child: Container(
                height: 170,
                width: 170,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kPinkColor,
                ),
                child: BackdropFilter(
                  child: Container(
                    height: 166,
                    width: 166,
                    color: Colors.transparent,
                  ),
                  filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.3,
              right: -60,
              child: Container(
                height: 166,
                width: 166,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kGreenColor.withOpacity(0.9),
                ),
                child: BackdropFilter(
                  child: Container(
                    height: 170,
                    width: 170,
                    color: Colors.transparent,
                  ),
                  filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                ),
              ),
            ),
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenHeight * 0.07,
                  ),
                  CustomOutline(
                      strokeWidth: 4,
                      radius: 150,
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Constants.kPinkColor,
                          Constants.kPinkColor.withOpacity(0.1),
                          Constants.kGreenColor.withOpacity(0.2),
                          Constants.kGreenColor,
                        ],
                        stops: const [0.2, 0.4, 0.6, 1],
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/img-onboarding.png",
                              ),
                              fit: BoxFit.cover,
                              alignment: Alignment.bottomLeft,
                            )),
                      ),
                      width: screenWidth * 0.7,
                      height: screenHeight * 0.3,
                      padding: const EdgeInsets.symmetric(horizontal: 8)),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  Text(
                    "Watch movies in \nVirtual Reality",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: screenWidth <= 667 ? 30 : 34),
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  const Text(
                    "Download and watch offline \n  wherever are you  ",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white38, fontSize: 14),
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  CustomOutline(
                      strokeWidth: 3,
                      radius: 150,
                      gradient: const LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Constants.kPinkColor,
                          Constants.kGreenColor,
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const MyHomePage()));
                        },
                        child: Container(
                          child: const Center(
                            child: Text(
                              "Sign in ",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                colors: [
                                  Constants.kPinkColor.withOpacity(0.5),
                                  Constants.kGreenColor.withOpacity(0.5),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              )),
                        ),
                      ),
                      width: screenWidth * 0.6,
                      height: screenHeight * 0.08,
                      padding: const EdgeInsets.only()),
                  SizedBox(
                    height: screenHeight * 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return Container(
                        margin: const EdgeInsets.only(left: 3),
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == 0 ? Colors.white70 : Colors.white24,
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
