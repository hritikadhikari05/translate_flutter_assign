import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:translator_task/features/homepage/widgets/languageCard.dart';

class ShimmerLoadingList extends StatelessWidget {
  const ShimmerLoadingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xff121416).withOpacity(0.1),
      highlightColor: Color.fromARGB(255, 103, 107, 110).withOpacity(0.4),
      // enabled: _enabled,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 6,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: LanguageCard(
              text: "",
            ),
          );
        },
      ),
    );
  }
}
