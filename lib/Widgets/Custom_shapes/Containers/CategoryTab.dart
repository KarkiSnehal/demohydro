import 'package:flutter/material.dart';
import 'package:hydrogang/Widgets/productverticalcard.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              GridView.builder(
                itemCount: 6,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 8),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 288,
                ),
                itemBuilder: (_, index) => CProductCardVertical(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
