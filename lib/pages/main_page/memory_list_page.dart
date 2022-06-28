import 'package:flutter/material.dart';
import 'package:saegimkkeori/pages/main_page/widget/memory_list_view.dart';
import 'package:saegimkkeori/pages/main_page/widget/title_widget.dart';
import 'package:saegimkkeori/utils/palette.dart';

class MemoryListPage extends StatelessWidget {
  const MemoryListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      body: Column(
        children: const [
          TitleContainer(),
          MemoryListView(),
        ],
      ),
    );
  }
}
