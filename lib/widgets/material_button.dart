import 'package:flutter/material.dart';

import '../theme.dart';

class BuildMaterialButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final String text;
  final double width;
  const BuildMaterialButton({
    Key key,
    this.onPressed,
    this.icon,
    this.text,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 100,
      child: MaterialButton(
        elevation: 6.0,
        shape: AppTheme.shape,
        onPressed: onPressed,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        color: Colors.white,
        child: Row(
          children: [
            Icon(
              icon,
              color: AppTheme.accentColor,
            ),
            Text(
              text ?? "",
              style: TextStyle(
                color: AppTheme.accentColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
