import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  final VoidCallback? onTap;
  const SearchButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xffF4F5FE),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Ink(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              'assets/png/scan.png',
              height: 24,
              width: 24,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
