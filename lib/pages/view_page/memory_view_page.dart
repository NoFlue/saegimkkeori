import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saegimkkeori/pages/writing_page/memory_writing_page.dart';
import 'package:saegimkkeori/utils/palette.dart';

import '../../model/memory.dart';
import '../../providers/memory_list.dart';

class MemoryViewPage extends StatelessWidget {
  const MemoryViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.background,
        elevation: .0,
        iconTheme: IconThemeData(
          color: Palette.primary,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.read<MemoryList>().deleteMemory(context.read<Memory>());
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: Text(
              '삭제',
              style: TextStyle(
                color: Palette.primary,
                fontFamily: 'EF_Diary',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => MemoryWritingPage(
                  memory: context.read<Memory>(),
                ),
              ),
            ),
            child: Text(
              '수정',
              style: TextStyle(
                color: Palette.primary,
                fontFamily: 'EF_Diary',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Palette.background,
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.read<Memory>().title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontFamily: 'EF_Diary',
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  context.read<Memory>().contents,
                  style: TextStyle(
                    color: Palette.primary,
                    fontSize: 15,
                    fontFamily: 'EF_Diary',
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
