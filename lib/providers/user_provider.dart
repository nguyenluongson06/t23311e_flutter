
import 'package:flutter/material.dart';
import 'package:t2311e_demo/models/User.dart';

class UserProvider extends StatefulWidget{
  final Widget child;
  const UserProvider({super.key, required this.child});

  @override
  State<StatefulWidget> createState() => _UserProviderState();

  static _UserProviderState of(BuildContext context){
    final _UserInherited? userData =
    context.dependOnInheritedWidgetOfExactType<_UserInherited>();
    if(userData == null){
      print("UserProvider not found in context");
    }
    return userData!.data;
  }
}



class _UserProviderState extends State<UserProvider>{
  UserModel? _user;
  void login(UserModel newUser){
    setState(() {
      _user = newUser;
    });
  }
  void logout(){
    setState(() {
      _user = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _UserInherited(child: widget.child, data: this);
  }
}
class _UserInherited extends InheritedWidget {
  final _UserProviderState data;
  const _UserInherited({
    required super.child,
    required this.data
  });

  @override
  bool updateShouldNotify(_UserInherited oldComponent){
    return oldComponent.data._user != data._user;
  }

}