import 'package:flutter/material.dart';
import 'package:saegimkkeori/utils/palette.dart';

class TitleContainer extends StatelessWidget {
  const TitleContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            color: Palette.background,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '새김꺼리',
                  style: TextStyle(
                    color: Palette.primary,
                    fontFamily: 'EF_Diary',
                    fontSize: 20,
                  ),
                ),
                Text(
                  '간직하고 싶은 추억을 담다',
                  style: TextStyle(
                    color: Palette.primary,
                    fontFamily: 'EF_Diary',
                    fontSize: 13,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 5,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.add,
                    color: Palette.primary,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.search,
                    color: Palette.primary,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 30,
            right: 30,
            child: Divider(
              height: 0,
              thickness: .3,
              color: Palette.primary,
            ),
          )
        ],
      ),
    );
  }
}
