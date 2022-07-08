import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:saegimkkeori/model/memory.dart';
import 'package:saegimkkeori/providers/memory_image_picker.dart';
import 'package:saegimkkeori/providers/memory_list.dart';
import 'package:saegimkkeori/utils/palette.dart';

class MemoryWritingPage extends StatefulWidget {
  final Memory? memory;

  const MemoryWritingPage({Key? key, this.memory}) : super(key: key);

  @override
  State<MemoryWritingPage> createState() => _MemoryWritingPageState();
}

class _MemoryWritingPageState extends State<MemoryWritingPage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void initState() {
    _titleController.text = widget.memory == null ? '' : widget.memory!.title;
    _contentController.text =
        widget.memory == null ? '' : widget.memory!.contents;
    super.initState();
  }

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
              onPressed: () {
                addOrUpdateMemory();
              },
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
          ],
        ),
      ),
    );
  }

  void addOrUpdateMemory() {
    if (widget.memory == null) {
      final DateTime now = DateTime.now();
      final DateFormat format = DateFormat('yyyy.MM.dd');
      final memory = Memory(
        title: _titleController.text,
        contents: _contentController.text,
        date: format.format(now),
      );

      context.read<MemoryList>().createMemory(memory);
    } else {
      final memory = Memory(
        id: widget.memory!.id,
        title: _titleController.text,
        contents: _contentController.text,
        date: widget.memory!.date,
      );
      context.read<MemoryList>().updateMemory(memory);
    }

    Navigator.popUntil(context, (route) => route.isFirst);
  }
}
