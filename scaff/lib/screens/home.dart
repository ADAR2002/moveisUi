import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:scaff/components/masked_image.dart';
import 'package:scaff/components/search_text_faild.dart';
import 'package:scaff/models/movie.dart';
import 'package:scaff/screens/onboarding.dart';

import '../constants.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

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
              top: -100,
              left: -80,
              child: Container(
                height: 170,
                width: 170,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kGreenColor,
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
                  color: Constants.kPinkColor.withOpacity(0.9),
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
            Positioned(
              bottom: -100,
              left: -80,
              child: Container(
                height: 166,
                width: 166,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kCyanColor.withOpacity(0.9),
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
              bottom: false,
              child: SizedBox(
                height: screenHeight,
                width: screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    const Center(
                      child: Text(
                        "What would you\nlike to watch?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    const SearchTextField(),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        "New movies",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    SizedBox(
                      height: screenHeight * 0.2,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: newMovies.length,
                          itemBuilder: (context, index) {
                            String mask = "";
                            if (index == 0) {
                              mask = Constants.kMaskFirstIndex;
                            } else if (index == (newMovies.length - 1)) {
                              mask = Constants.kMaskLastIndex;
                            } else {
                              mask = Constants.kMaskCenter;
                            }
                            return Container(
                              height: screenHeight * 0.2,
                              width: screenWidth * 0.4,
                              margin: EdgeInsets.only(
                                  left: index == 0 ? 20 : 0,
                                  right:
                                      index == (newMovies.length - 1) ? 10 : 0),
                              child: MaskedImage(
                                asset: newMovies[index].moviePoster,
                                mask: mask,
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        "Upcoming movies",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    SizedBox(
                      height: screenHeight * 0.2,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: upcomingMovies.length,
                          itemBuilder: (context, index) {
                            String mask = "";
                            if (index == 0) {
                              mask = Constants.kMaskFirstIndex;
                            } else if (index == (upcomingMovies.length - 1)) {
                              mask = Constants.kMaskLastIndex;
                            } else {
                              mask = Constants.kMaskCenter;
                            }
                            return Container(
                              height: screenHeight * 0.2,
                              width: screenWidth * 0.4,
                              margin: EdgeInsets.only(
                                  left: index == 0 ? 20 : 0,
                                  right:
                                      index == (newMovies.length - 1) ? 10 : 0),
                              child: MaskedImage(
                                asset: upcomingMovies[index].moviePoster,
                                mask: mask,
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.all(2),
        height: 60,
        padding: const EdgeInsets.all(3),
        width: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Constants.kPinkColor.withOpacity(0.8),
                Constants.kGreenColor.withOpacity(0.8),
              ],
            ),),
        child: RawMaterialButton(
          onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OnBoardingScreen()));},
          shape: const CircleBorder(),
          fillColor: const Color(0xff404c57),
          child: SvgPicture.asset(Constants.kIconPlus),
        ),
      ),
      bottomNavigationBar: GlassmorphicContainer(
        linearGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Constants.kWhiteColor.withOpacity(0.15),
            Constants.kBlackColor.withOpacity(0.15),
          ],
        ),
        borderGradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Constants.kPinkColor.withOpacity(0.3),
            Constants.kGreenColor.withOpacity(0.3),
          ],
        ),
        border: 0,
        height: screenHeight*0.08,
        borderRadius: 0,
        blur: 20,
        width: screenWidth,
        child:BottomAppBar(
          color: Colors.transparent,
          notchMargin: 4,
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){}, icon: SvgPicture.asset(Constants.kIconHome)),
              IconButton(onPressed: (){}, icon: SvgPicture.asset(Constants.kIconPlayOnTv)),
              IconButton(onPressed: (){ }, icon: Container()),
              IconButton(onPressed: (){}, icon: SvgPicture.asset(Constants.kIconCategories)),
              IconButton(onPressed: (){}, icon: SvgPicture.asset(Constants.kIconDownload)),
            ],

          ),

        )
      ),
    );
  }
}
