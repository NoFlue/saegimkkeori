import 'package:flutter/material.dart';
import 'package:saegimkkeori/model/memory.dart';
import 'package:provider/provider.dart';
import 'package:saegimkkeori/providers/memory_list.dart';

import 'memory_card_view.dart';

class MemoryListView extends StatelessWidget {
  const MemoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Memory> memoryList = context.watch<MemoryListState>().memories;

    return Expanded(
      child: ListView.builder(
        itemCount: memoryList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(top: 8, left: 16, right: 16),
            child: MemoryCardView(index: index),
          );
        },
      ),
    );
  }
}
