import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saegimkkeori/utils/palette.dart';

import '../../model/memory.dart';

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
            onPressed: () {},
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
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [Text(context.read<Memory>().title)],
        ),
      ),
    );
  }
}
