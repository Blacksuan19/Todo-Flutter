import 'package:flutter/material.dart';
import '../theme.dart';

class BuildFloatingButton extends StatelessWidget {
  const BuildFloatingButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      child: MaterialButton(
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        onPressed: () => {},
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        color: Colors.white,
        child: Row(
          children: [
            Icon(
              Icons.add,
              color: ThemeColors().accent,
            ),
            Text(
              "Add Todo",
              style: TextStyle(
                color: ThemeColors().accent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
