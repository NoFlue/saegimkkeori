import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:saegimkkeori/model/memory.dart';
import 'package:saegimkkeori/pages/main_page/memory_list_page.dart';
import 'package:saegimkkeori/providers/memory_list.dart';
import 'package:saegimkkeori/providers/memory_search.dart';
import 'package:saegimkkeori/providers/memory_search_list.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MemoryAdapter());
  await Hive.openBox<Memory>('memories');

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StateNotifierProvider<MemoryList, MemoryListState>(
          create: (_) => MemoryList(),
        ),
        StateNotifierProvider<MemorySearch, MemorySearchState>(
          create: (_) => MemorySearch(),
        ),
        StateNotifierProvider<MemorySearchList, MemorySearchListState>(
          create: (_) => MemorySearchList(),
        ),
      ],
      child: MaterialApp(
        title: '새김꺼리',
        debugShowCheckedModeBanner: false,
        home: MemoryListPage(),
      ),
    );
  }
}
