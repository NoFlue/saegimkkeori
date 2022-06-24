// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'memory.g.dart';

@HiveType(typeId: 1)
class Memory extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String contents;
  @HiveField(3)
  final List<String> images;
  @HiveField(4)
  final String date;

  Memory({
    String? id,
    required this.title,
    required this.contents,
    List<String>? images,
    required this.date,
  })  : id = id ?? Uuid().v4(),
        images = images ?? [];

  Memory copyWith({
    String? id,
    String? title,
    String? contents,
    List<String>? images,
    String? date,
  }) {
    return Memory(
      id: id ?? this.id,
      title: title ?? this.title,
      contents: contents ?? this.contents,
      images: images ?? this.images,
      date: date ?? this.date,
    );
  }

  @override
  List<Object> get props => [id, title, contents, images, date];

  @override
  bool get stringify => true;
}
