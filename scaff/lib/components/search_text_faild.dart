import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scaff/constants.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Constants.kGreyColor.withOpacity(0.12),
      ),
      child:Row(
        children: [
          SvgPicture.asset(Constants.kIconSearch, color: Colors.white60 , height: 20,width: 20,),
          const SizedBox(width: 10,),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText:"Search",
                hintStyle:  TextStyle(fontSize: 16,color: Colors.white60),
                border: InputBorder.none
              ),
            ),
          ),
          const SizedBox(width: 10,),
          SvgPicture.asset(Constants.kIconMic ,color: Colors.white60, height: 20,width: 20,)


        ],
      ) ,
    );
  }
}
