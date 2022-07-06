import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saegimkkeori/providers/memory_image_picker.dart';
import 'package:saegimkkeori/utils/palette.dart';
import 'package:provider/provider.dart';

class ImageListView extends StatefulWidget {
  const ImageListView({Key? key}) : super(key: key);

  @override
  State<ImageListView> createState() => _ImageListViewState();
}

class _ImageListViewState extends State<ImageListView> {
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
            children: List.generate(
              context.watch<MemoryImagePickerState>().images.length + 1,
              (index) {
                if (index == 0) {
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () {
                        WidgetsBinding.instance.addPostFrameCallback((_) async {
                          final List<XFile>? images =
                              await ImagePicker().pickMultiImage();

                          if (!mounted) return;
                          if (images != null) {
                            context.read<MemoryImagePicker>().addImage(images);
                          }
                        });
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Palette.background,
                          border: Border.all(color: Palette.primary, width: .3),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: Palette.primary,
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.only(top: 8, right: 8, bottom: 8),
                    child: Container(
                      width: 60,
                      height: 60,
                    ),
                  );
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
