import 'package:flutter/material.dart';

class CustomButtonMenu extends StatelessWidget {
  final IconData icon;
  final String buttonText;
  final VoidCallback onPressed;

  CustomButtonMenu(
      {required this.icon, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    double alto = MediaQuery.of(context).size.height;
    return Container(
      height: alto * 0.25,
      width: ancho * 0.15, // Adjust the width of the button as needed
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius:
            BorderRadius.circular(10.0), // Adjust the border radius as needed
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10.0),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 40.0, // Adjust the size of the icon as needed
                  color: Colors.white, // Icon color
                ),
                SizedBox(height: 8.0),
                Text(
                  buttonText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0, // Adjust the font size as needed
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
