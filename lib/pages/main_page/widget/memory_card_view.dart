import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saegimkkeori/utils/palette.dart';

import '../../../providers/memory_list.dart';

class MemoryCardView extends StatelessWidget {
  final int index;

  const MemoryCardView({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String>? image =
        context.read<MemoryListState>().memories[index].images;

    return Container(
      height: 75,
      width: MediaQuery.of(context).size.width,
      color: Palette.background,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (image.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Image.memory(base64Decode(image[0])).image),
                ),
              ),
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 2),
                  child: Text(
                    context.watch<MemoryListState>().memories[index].title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'EF_Diary',
                    ),
                  ),
                ),
                Text(
                  context.watch<MemoryListState>().memories[index].contents,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Palette.primary,
                    fontFamily: 'EF_Diary',
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
