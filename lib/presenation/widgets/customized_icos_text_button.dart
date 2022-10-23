import 'package:coligo/presenation/styles/color.dart';
import 'package:flutter/material.dart';

class CustomizeIconTextdButton extends StatefulWidget {
  final String textContent;
  final IconData icon;
  const CustomizeIconTextdButton(
      {super.key, required this.icon, required this.textContent});

  @override
  State<CustomizeIconTextdButton> createState() =>
      _CustomizeIconTextdButtonState();
}

class _CustomizeIconTextdButtonState extends State<CustomizeIconTextdButton> {
  var isHover = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return MouseRegion(
        onHover: (event) {
          setState(() {
            isHover = true;
          });
        },
        onExit: (event) {
          setState(() {
            isHover = false;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: isHover
                    ? Colors.white
                    : const Color.fromARGB(0, 255, 255, 255),
                elevation: 0,
                foregroundColor: isHover ? teal : Colors.white),
            onPressed: () {},
            icon: FittedBox(
                child: Icon(
              widget.icon,
              size: width / 50,
            )),
            label: FittedBox(
              child: Text(
                widget.textContent,
                style: isHover
                    ? const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
                    : const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
          ),
        ));
  }
}
