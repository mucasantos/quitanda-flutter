import 'package:flutter/material.dart';
import 'package:quitanda/config/custom_color.dart';

class QuantityWidget extends StatelessWidget {
  final int value;
  final String suffixText;
  final Function calcQuantity;

  const QuantityWidget({
    Key? key,
    required this.suffixText,
    required this.value,
    required this.calcQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 1,
              blurRadius: 2,
            )
          ]),
      child: Row(
        children: [
          _QuantityButton(
            color: Colors.grey,
            icon: Icons.remove,
            onPressed: () {
              if (value == 1) return;
              int result = value - 1;
              calcQuantity(result);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: Text(
              '$value$suffixText',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _QuantityButton(
            color: CustomColors.customSwatchColor,
            icon: Icons.add,
            onPressed: () {
              int result = value + 1;
              calcQuantity(result);
            },
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;
  const _QuantityButton({
    Key? key,
    required this.color,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onPressed,
        child: Ink(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}
