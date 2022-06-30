import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saegimkkeori/providers/memory_search.dart';
import 'package:saegimkkeori/utils/palette.dart';

class SearchTerm extends StatelessWidget {
  const SearchTerm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: TextField(
        style: TextStyle(
          color: Palette.primary,
          fontFamily: 'EF_Diary',
        ),
        decoration: InputDecoration(
            border: InputBorder.none,
            isDense: true,
            hintText: '제목 또는 내용을 입력해주세요'),
        onChanged: (String? str) {
          context.read<MemorySearch>().updateSearch(str!);
        },
      ),
    );
  }
}
