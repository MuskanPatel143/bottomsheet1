import 'package:bottomsheet/bottom.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      home: Scaffold(body: HomeView()),
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('DraggableScrollableSheet'),
//         ),
//         body: SizedBox.expand(child: DraggableScrollableSheet(
//             builder: (BuildContext context, ScrollController scrollController) {
//           return Container(
//             color: Colors.blue[100],
//             child: ListView.builder(
//               controller: scrollController,
//               itemCount: 25,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(title: Text('Item $index'));
//               },
//             ),
//           );
//         })));
//   }
// }

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MyFloatingButton(),
    );
  }
}

class MyFloatingButton extends StatefulWidget {
  @override
  _MyFloatingButtonState createState() => _MyFloatingButtonState();
}

class _MyFloatingButtonState extends State<MyFloatingButton> {
  bool show = true;
  @override
  Widget build(BuildContext context) {
    return show
        ? FloatingActionButton(
            onPressed: () {
              var sheetController = showBottomSheet(
                  context: context, builder: (context) => BottomSheetWidget());
              showButton(false);
              sheetController.closed.then((value) {
                showButton(true);
              });
            },
          )
        : Container();
  }

  void showButton(bool value) {
    setState(() {
      show = value;
    });
  }
}
