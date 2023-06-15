import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryLoadingCard extends StatelessWidget {
  const CategoryLoadingCard({Key? key}) : super(key: key);

@override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      shadowColor: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Shimmer.fromColors(
          highlightColor: Colors.white,
          baseColor: Colors.grey.shade300,
          child: Column(
            children: [
              Flexible(
                flex: 5,
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.grey.shade300,
                      height: 20,
                    ),
                    const SizedBox(height: 5),
                    Container(
                      color: Colors.grey.shade300,
                      height: 15,
                      width: 75,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}