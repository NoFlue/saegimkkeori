// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:state_notifier/state_notifier.dart';

class MemoryImagePickerState extends Equatable {
  final List<XFile> images;

  MemoryImagePickerState({
    required this.images,
  });

  factory MemoryImagePickerState.initial() =>
      MemoryImagePickerState(images: []);

  MemoryImagePickerState copyWith({
    List<XFile>? images,
  }) {
    return MemoryImagePickerState(
      images: images ?? this.images,
    );
  }

  @override
  List<Object> get props => [images];

  @override
  bool get stringify => true;
}

class MemoryImagePicker extends StateNotifier<MemoryImagePickerState> {
  MemoryImagePicker() : super(MemoryImagePickerState.initial());

  void addImage(List<XFile>? images) {
    state = state.copyWith(images: images);
    print('${state.images.length}');
  }

  void removeImage(int index) {
    final images =
        state.images.where((image) => image != state.images[index]).toList();

    state = state.copyWith(images: images);
  }

  Future<Image> getImage(int index) async {
    final Uint8List bytes = await state.images[index].readAsBytes();

    return Image.memory(bytes);
  }
}
