import 'dart:ffi';

import 'package:flutter/material.dart';

class ExpandDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandWidgetLab2();
  }
}

class ExpandWidgetLab1 extends StatelessWidget {
  //tạo widget sẽ expaand toàn bộ thông tin row, column ở trục chính

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Row(
        children: <Widget>[
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
    ));
  }
}

class ExpandWidgetLab2 extends StatelessWidget {
  //tạo widget sẽ expaand toàn bộ thông tin row, column ở trục chính

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.red,
                padding: EdgeInsets.all(12),
              )),
          Expanded(
              flex: 3,
              child: Container(
                color: Colors.green,
                padding: EdgeInsets.all(12),
              ))
        ],
      ),
    ));
  }
}

class FlexibleLab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Row(
        children: <Widget>[
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
          )),
          Flexible(
            fit: FlexFit.tight, //FlexFit.tight is equivalent to Expand
            child: Container(
              color: Colors.red,
              padding: EdgeInsets.all(12),
              child: Text(
                "Text 3",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class WrapLab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Center(
      //tự xuống dòng khi tràn nội dung (wrap)
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 8,
        runSpacing: 50,
        children: [
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.grey.shade900,
              child: Text('A'),
            ),
            label: Text('Banana'),
          ),
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.grey.shade900,
              child: Text('A'),
            ),
            label: Text('Banana'),
          ),
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.grey.shade900,
              child: Text('A'),
            ),
            label: Text('Banana'),
          ),
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.grey.shade900,
              child: Text('A'),
            ),
            label: Text('Banana'),
          ),
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.grey.shade900,
              child: Text('A'),
            ),
            label: Text('Banana'),
          ),
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.grey.shade900,
              child: Text('A'),
            ),
            label: Text('Banana'),
          ),
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.grey.shade900,
              child: Text('A'),
            ),
            label: Text('Banana'),
          ),
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.grey.shade900,
              child: Text('A'),
            ),
            label: Text('Banana'),
          ),
        ],
      ),
    ));
  }
}

class StackLab1 extends StatelessWidget {
  //xếp chồng các component trên nhau
  /*
  - khai báo đầu tiên: ở dưới cùng
  - kích thước: bằng kích thước component lớn nhất
   */

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;
    print("Screen width: $width, orientation: $orientation");
    /*
    layoutBuilder:
     */
    return Scaffold(
        body: Center(
      child: Container(
        width: 300,
        height: 400,
        color: Colors.grey,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.blueGrey),
              width: 300,
              height: 400,
              child: Center(
                child: Text(
                  "Base Layer",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
            Positioned(
                top: 20,
                right: 20,
                child: Row(children: [
                  Icon(
                    Icons.favorite,
                    size: 40,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.thumb_down_alt_outlined,
                    size: 40,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.settings,
                    size: 40,
                    color: Colors.white,
                  )
                ]))
          ],
        ),
      ),
    ));
  }
}

class ResponsiveUI extends StatelessWidget{
  final List<String> profiles = List<String>.generate(10, (index) => "Profile $index");
  final double cardHeightRate = 0.15;
  @override
  Widget build(BuildContext context) {
    print(profiles);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final cardHeight = screenHeight * cardHeightRate;
    print("Size: $screenWidth x $screenHeight, card height: $cardHeight");
    return Scaffold(
      appBar: AppBar(
        title: Text("UI Responsive demo"),
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
        child: LayoutBuilder(
            builder: (context, constraint) {
              final bool isLargeScreen = constraint.maxWidth > 600;
              if (isLargeScreen){
                var childAspectRatio = constraint.maxWidth / 2 / cardHeight;
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: childAspectRatio
                    ),
                  itemCount: profiles.length,
                  itemBuilder: (context, index) {
                      var text = profiles[index];
                    return Container(
                      color: Colors.blue,
                      child: Center(
                          child: Text(text, style: TextStyle(fontSize: 24, color: Colors.white),)
                      ),
                    );
                  },
                );
              } else {
                return ListView.builder(
                  itemCount: profiles.length,
                    itemBuilder: (context, index) {
                    return Padding(padding: EdgeInsets.all(10),
                    child: buildCard(profiles[index], cardHeight),);
                    }
                );
              }
            }
        )
      ),
    );
  }

  Widget buildCard(String content, double height){
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey,
        border: Border.all(color: Colors.green, width: 2)
      ),
      child: Text(content, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }
}

class GridViewLab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(20, (i) {
            return Container(
              color: Colors.blue,
              child: Center(
                child: Text("Item $i", style: TextStyle(fontSize: 24, color: Colors.white),)
              ),
            );
          })
        )
      ),
    );
  }
  
}
