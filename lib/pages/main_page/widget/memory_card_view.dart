import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saegimkkeori/pages/view_page/memory_view_page.dart';
import 'package:saegimkkeori/utils/palette.dart';

import '../../../providers/memory_list.dart';

class MemoryCardView extends StatelessWidget {
  final int index;

  const MemoryCardView({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String>? image =
        context.read<MemoryListState>().memories[index].images;

    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => Provider.value(
            value: context.read<MemoryListState>().memories[index],
            child: MemoryViewPage(),
          ),
        ),
      ),
      child: Container(
        height: 75,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Palette.background,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(2, 2),
            ),
          ],
        ),
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
      ),
    );
  }
}
