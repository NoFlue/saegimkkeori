// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:state_notifier/state_notifier.dart';

class MemorySearchState extends Equatable {
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

  @override
  List<Object> get props => [searchTerm];

  @override
  bool get stringify => true;
}

class MemorySearch extends StateNotifier<MemorySearchState> {
  MemorySearch() : super(MemorySearchState(searchTerm: ''));

  void updateSearch(String str) => state.copyWith(searchTerm: str);
}
