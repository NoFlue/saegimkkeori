import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:saegimkkeori/pages/writing_page/widget/image_picker.dart';
import 'package:saegimkkeori/providers/memory_image_picker.dart';
import 'package:saegimkkeori/utils/palette.dart';

class MemoryWritingPage extends StatefulWidget {
  const MemoryWritingPage({Key? key}) : super(key: key);

  @override
  State<MemoryWritingPage> createState() => _MemoryWritingPageState();
}

class _MemoryWritingPageState extends State<MemoryWritingPage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StateNotifierProvider<MemoryImagePicker, MemoryImagePickerState>(
          create: (_) => MemoryImagePicker(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Palette.background,
        appBar: AppBar(
          backgroundColor: Palette.background,
          elevation: .0,
          iconTheme: IconThemeData(color: Palette.primary),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                '작성',
                style: TextStyle(
                  color: Palette.primary,
                  fontFamily: 'EF_Diary',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '제목',
                  isDense: true,
                ),
                style:
                    TextStyle(color: Palette.primary, fontFamily: 'EF_Diary'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Divider(
                thickness: .3,
                color: Palette.primary,
                height: 0,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: TextField(
                  controller: _contentController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '내용',
                    isDense: true,
                  ),
                  style:
                      TextStyle(color: Palette.primary, fontFamily: 'EF_Diary'),
                ),
              ),
            ),
            ImageListView(),
          ],
        ),
      ),
    );
  }
}
