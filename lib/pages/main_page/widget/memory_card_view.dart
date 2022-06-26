import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/memory_list.dart';

class MemoryCardView extends StatelessWidget {
  final int index;

  const MemoryCardView({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 350,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4),
            // image: context
            //         .read<MemoryListState>()
            //         .memories[index]
            //         .images[0]
            //         .isNotEmpty
            //     ? DecorationImage(
            //         image: Image.memory(base64Decode(context
            //                 .read<MemoryListState>()
            //                 .memories[index]
            //                 .images[0]))
            //             .image,
            //         fit: BoxFit.cover,
            //       )
            //     : null,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            width: 350,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.3),
            ),
          ),
        )
      ],
    );
  }
}
