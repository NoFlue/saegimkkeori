import 'package:flutter/material.dart';
import 'package:saegimkkeori/providers/memory_image_picker.dart';
import 'package:saegimkkeori/utils/palette.dart';
import 'package:provider/provider.dart';

class ImageListView extends StatelessWidget {
  const ImageListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: 0,
          thickness: .3,
          color: Palette.primary,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 75,
          color: Palette.background,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  width: 60,
                  height: 60,
                  color: Colors.white,
                  child: Center(
                    child: Icon(Icons.add),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
