import 'package:flutter/material.dart';

class ExpandDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ExpandWidgetLab2();
  }

}

class ExpandWidgetLab1 extends StatelessWidget{
  //tạo widget sẽ expaand toàn bộ thông tin row, column ở trục chính

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: <Widget> [
            Container(
              color: Colors.red,
              padding: EdgeInsets.all(12),
              child: Text(
                "Component 1",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.green,
                padding: EdgeInsets.all(12),
                child: Text(
                  "Component 1",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
            Container(
              color: Colors.yellow,
              padding: EdgeInsets.all(12),
              child: Text(
                "Component 1",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
          ],
        ),
      )
    );
  }
}

class ExpandWidgetLab2 extends StatelessWidget{
  //tạo widget sẽ expaand toàn bộ thông tin row, column ở trục chính

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Row(
            children: <Widget> [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.red,
                  padding: EdgeInsets.all(12),
                )
              ),
              Expanded(
                flex: 3,
                  child: Container(
                    color: Colors.green,
                    padding: EdgeInsets.all(12),
                  )
              )
            ],
          ),
        )
    );
  }
}

class FlexibleLab1 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Row(
            children: <Widget> [
              Container(
                color: Colors.red,
                padding: EdgeInsets.all(12),
                child: Text(
                  "Component 1",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              //flexible: khi còn thừa không gian theo trục chính, < kích thước container bên trong
              Flexible(
                child: Flexible(
                  child: Container(
                    color: Colors.green,
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Component 1",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                )
              )
            ],
          ),
        )
    );
  }
}