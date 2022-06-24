import 'package:hive/hive.dart';

import 'package:saegimkkeori/model/memory.dart';
import 'package:state_notifier/state_notifier.dart';

Box<Memory>? memoryBox = Hive.box('memories');

class MemoryListState {
  final List<Memory> memories;

  MemoryListState({
    required this.memories,
  });

  factory MemoryListState.initial() =>
      MemoryListState(memories: memoryBox!.values.toList());

  MemoryListState copyWith({
    List<Memory>? memories,
  }) {
    return MemoryListState(
      memories: memories ?? this.memories,
    );
  }
}

class MemoryList extends StateNotifier<MemoryListState> {
  MemoryList() : super(MemoryListState.initial());

  //CRUD
  void createMemory(Memory memory) {
    final memories = [...state.memories, memory];

    state.copyWith(memories: memories);
    memoryBox!.put(memory.id, memory);
  }

  void updateMemory(Memory memory) {
    final memories = state.memories.map((m) {
      if (memory.id == m.id) {
        return memory;
      }
      return m;
    }).toList();

    state.copyWith(memories: memories);
  }

  void deleteMemory(Memory memory) {
    final memories = state.memories.where((m) => memory.id != m.id).toList();

    state.copyWith(memories: memories);
  }
}
