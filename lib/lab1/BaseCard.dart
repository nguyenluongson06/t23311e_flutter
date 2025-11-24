
import 'package:flutter/material.dart';

class BaseCardComponent extends StatelessWidget {
  final Widget child;
  const BaseCardComponent({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:  BorderRadius.circular(12),
        boxShadow:const [BoxShadow(
          color:  Colors.black12,
          blurRadius:  6
        )]
      ),
      child: child,
    );
  }
}

class UserProfile extends BaseCardComponent{
  UserProfile(String username)
  : super(
    child: Text(
      "User : $username",
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    )
  );
}
