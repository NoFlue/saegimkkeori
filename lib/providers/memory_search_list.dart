// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:state_notifier/state_notifier.dart';

import 'package:saegimkkeori/model/memory.dart';
import 'package:saegimkkeori/providers/memory_search.dart';

Box<Memory>? memoryBox = Hive.box('memories');

class MemorySearchListState extends Equatable {
  final List<Memory> memories;

  MemorySearchListState({
    required this.memories,
  });

  factory MemorySearchListState.initial() =>
      MemorySearchListState(memories: memoryBox!.values.toList());

  MemorySearchListState copyWith({
    List<Memory>? memories,
  }) {
    return MemorySearchListState(
      memories: memories ?? this.memories,
    );
  }

  @override
  List<Object> get props => [memories];

  @override
  bool get stringify => true;
}

class MemorySearchList extends StateNotifier<MemorySearchListState>
    with LocatorMixin {
  MemorySearchList() : super(MemorySearchListState.initial());

  @override
  void update(Locator watch) {
    String str = watch<MemorySearchState>().searchTerm.toLowerCase();

    List<Memory>? memories;

    if (str.isNotEmpty) {
      memories = state.memories.where((memory) {
        if (memory.contents.contains(str) || memory.title.contains(str)) {
          return true;
        }
        return false;
      }).toList();
    }

    state.copyWith(memories: memories!);

    super.update(watch);
  }
}
