import 'package:flutter/material.dart';

class BorderButtonCustom extends StatefulWidget {
  final String title;
  final Color color;
  final Color foregroundColor;
  final Color backgroundColor;
  final Color? borderColor;
  final IconData? icon;
  final bool showMargin;
  final Function() onTap;
  const BorderButtonCustom({
    Key? key,
    required this.title,
    required this.color,
    this.foregroundColor = Colors.white,
    required this.backgroundColor,
    this.borderColor,
    this.icon,
    this.showMargin = false,
    required this.onTap,
  }) : super(key: key);

  @override
  State<BorderButtonCustom> createState() => _BorderButtonCustomState();
}

class _BorderButtonCustomState extends State<BorderButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        border: widget.borderColor == null
            ? null
            : Border.all(
                color: widget.borderColor!,
              ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () => widget.onTap(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: Text(
                widget.title,
                style: TextStyle(
                  color: widget.foregroundColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(width: widget.icon == null ? 0 : 5),
            widget.icon == null
                ? const SizedBox.shrink()
                : Icon(
                    widget.icon,
                    color: widget.color,
                  ),
          ],
        ),
      ),
    );
  }
}
