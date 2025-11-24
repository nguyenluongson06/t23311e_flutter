import 'package:flutter/material.dart';
import 'package:t2311e_demo/lab1/BaseCard.dart';
import 'package:t2311e_demo/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen()
      // home:  AppBarDemo(),
    );
  }
}

class AppBarDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>  _AppBarDemoState();

}
class _AppBarDemoState extends State<AppBarDemo>{
  bool _isSearching = false;
  final TextEditingController _searchInput = TextEditingController();

  void _toggleSearch(){
    setState(() {
      _isSearching = !_isSearching;
      if(!_isSearching){
        _searchInput.clear();
        FocusScope.of(context).unfocus(); // close mobile keyboard
      }
    });
  }



  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("data"),
          leading: Builder(builder: (context){
            return IconButton(
                onPressed: (){
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu));
          },
          ),
          backgroundColor: Colors.indigo,
          actions: <Widget> [
              IconButton(
                icon: Icon(_isSearching ?  Icons.close
                    :Icons.search
                ),
                onPressed: _toggleSearch,
              )
          ],

        ),
        body: Center(
          child: UserProfile("John Doe 34543535"),
        ),
        drawer: Drawer(
          child: ListView(
            padding:  EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.indigo
                ),
                child: Text(
                  "MENU",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                )),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
              const ListTile(
                leading: Icon(Icons.message),
                title: Text("Message"),
              )

            ],
          ),
        ) ,
      );
  }

}




class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // return ColorScreen();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
            onPressed: (){
              print("Clicked leading icon button");
            },
            icon:  Icon(Icons.menu,color: Colors.white)
        ),
          title: const Text("Home Page"),
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search,
                    color: Colors.white)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings,
                    color: Colors.black12))
          ],
      ),
      body : Center(
        child: Container(
          // margin: EdgeInsets.symmetric(vertical: 10),
          child:  Mycounter(),
        ),
      )
    );
  }
}

// Statefull widget vs Stateless Widget
class Mycounter extends StatefulWidget{
  const Mycounter({super.key});

  @override
  State<StatefulWidget> createState() => MyCounterState();
}
class MyCounterState extends State<Mycounter> {
  int _counter = 0;

  // increment
  void _incrementCount(){
    setState(() {
      _counter ++;
    });
  }
  void _decrementCount(){
    setState(() {
      _counter --;
    });
  }

  @override
  Widget build(BuildContext context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 250),
          const Text("Current Number Value : ",
            style: TextStyle(
              fontSize: 20
            ),
          ),
          Text('$_counter',
            style: const TextStyle(
                fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          ),
        SizedBox(height: 100),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: _incrementCount,
              tooltip: 'Increment number',
              backgroundColor: Colors.green,
            ),
            FloatingActionButton(
              child: const Icon(Icons.remove),
              onPressed: _decrementCount,
              tooltip: 'Decrement number',
              backgroundColor: Colors.red,
            )
           ],
        )
        ],
      );
  }
}
// Chon mau tu 1 selectbox => thay doi nen giao dien

class ColorScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  late  Color _selectedColor;
  // Color _selectedColor = Colors.green;
  final Map<String,Color> colors = {
    'Xanh' : Colors.green,
    'Vang' : Colors.yellow,
    'Do' : Colors.red
  };
  @override
  void initState() {
    super.initState();
    _selectedColor = Colors.green;
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: _selectedColor,
        appBar: AppBar(
          title: const Text('Color Screen'),
          backgroundColor: Colors.blueAccent,
          elevation: 2,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Choose Color',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            DropdownButton(
                value: _selectedColor,
                items: colors.entries.map((item ){
                  return DropdownMenuItem<Color>(
                    value: item.value,
                      child: Row(
                        children: [
                          Container(height: 20, width: 20, color: item.value, margin:  EdgeInsets.only(right: 10)),
                          Text(item.key)
                        ],
                      )
                  );
                }).toList(),
                onChanged: (Color? selectColor) {
                  if (selectColor != null) {
                    setState(() {
                      _selectedColor = selectColor;
                    });
                  }
                }),
          ],
        ),
        ),
      );
  }





}


// Text
class TextDemo extends StatelessWidget {
  const TextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Column( // cau truc bo thuc
        crossAxisAlignment:CrossAxisAlignment.center ,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text (
            "Green large text",
            style: TextStyle(fontSize: 34, color: Colors.green),
          ),
          SizedBox(height: 10),
          Text(
           "Bold text",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "loradisum  loradisum loradisum loradisum loradisum loradisum  loradisum loradisum loradisum loradisumloradisum  loradisum loradisum loradisum loradisum",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.normal),
            maxLines: 1,
            // overflow: TextOverflow.ellipsis ,
            overflow: TextOverflow.ellipsis,
          )
        ],
    );

  }
}

class ProfileDemo extends StatelessWidget {
  const ProfileDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
                radius: 80,
                // child:  Image.asset('assets/images/images.webp')
                backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeK76ON20FIbTr9u4z9xIJBCxjNr_2xswX-oWSAkiFbFCBHrN15jj_6oCsDVDiyUdN5PSFPln76JXdpgTkZp0WlL-ODuCbIRv3i2lFEK87AA&s=10"),
                // backgroundImage: Image.asset('assets/images/images.webp')
            ),
            SizedBox(width: 20,)

            ,Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Albert Einstein",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                    "1879-1955",
                    style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 20),
                Text(
                    "Nhà vật lý học",
                    style: TextStyle(fontSize: 18),
                ),
                Text(
                    "Cha đẻ thuyết tương đối",
                    style: TextStyle(fontSize: 18),
                )

              ],
            )
          ]
        ),
    
    );
        // Image.asset('assets/images/images.webp')
  }
}
class ContainerDemo extends StatelessWidget {
   ContainerDemo({super.key});

  @override
  Widget build(BuildContext context) {
     return Container(
        padding: EdgeInsets.all(20) ,
        margin:EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(12)
        ),
        child:  Column(),
     );
    // Image.asset('assets/images/images.webp')
  }
}

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () => {print("Clicked button")},
              child: Text("Elevated Button")),
          TextButton(onPressed: () => {print("Clicked button")}
              , child: Text("Text button")),
          IconButton(onPressed: () => {print("Clicked button liked")}
              , icon: Icon(Icons.thumb_up))
        ],
      ),
    );
  }

}










