import 'package:flutter/material.dart';

import 'package:quitanda/config/custom_color.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    Key? key,
    required this.category,
    required this.image,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  final String category;
  final bool isSelected;
  final String image;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            height: 60,
            width: 80,
            // padding: const EdgeInsets.all(8),
            //  margin: EdgeInsets.zero,
            decoration: BoxDecoration(
                color: isSelected
                    ? CustomColors.customContrasColor.withOpacity(0.5)
                    : CustomColors.customSwatchColor.shade200,
                borderRadius: BorderRadius.circular(20)),
            child: Image.network(image),
          ),
          Text(
            category,
            style: TextStyle(
              color:
                  isSelected ? CustomColors.customContrasColor : Colors.white,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
