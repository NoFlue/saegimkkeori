// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:state_notifier/state_notifier.dart';

class MemorySearchState {
  final String searchTerm;

  MemorySearchState({
    required this.searchTerm,
  });

  MemorySearchState copyWith({
    String? searchTerm,
  }) {
    return MemorySearchState(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }
}

class MemorySearch extends StateNotifier<MemorySearchState> {
  MemorySearch() : super(MemorySearchState(searchTerm: ''));

  void updateSearch(String str) => state.copyWith(searchTerm: str);
}
