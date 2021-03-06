import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saegimkkeori/pages/search_page/widget/memory_card_search_view.dart';
import 'package:saegimkkeori/providers/memory_search_list.dart';
import 'package:saegimkkeori/utils/palette.dart';

class MemorySearchListView extends StatelessWidget {
  const MemorySearchListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => Divider(
        height: 0,
        color: Palette.primary,
        thickness: .3,
      ),
      itemCount: context.watch<MemorySearchListState>().memories.length,
      itemBuilder: (listContext, index) {
        return Padding(
          padding: EdgeInsets.only(top: 8, left: 16, right: 16),
          child: MemoryCardSearchView(index: index),
        );
      },
    );
  }
}
