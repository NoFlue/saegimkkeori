import 'package:flutter/material.dart';
import 'package:saegimkkeori/pages/search_page/widget/memory_search_list_view.dart';
import 'package:saegimkkeori/pages/search_page/widget/search_term.dart';
import 'package:saegimkkeori/utils/palette.dart';

class MemorySearchPage extends StatelessWidget {
  const MemorySearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.background,
        elevation: .0,
        iconTheme: IconThemeData(color: Palette.primary),
      ),
      backgroundColor: Palette.background,
      body: Column(
        children: [
          SearchTerm(),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Divider(
              color: Palette.primary,
              thickness: .3,
              height: 0,
            ),
          ),
          Expanded(
            child: MemorySearchListView(),
          ),
        ],
      ),
    );
  }
}
