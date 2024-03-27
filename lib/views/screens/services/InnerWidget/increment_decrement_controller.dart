// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class IncrementDecrementController extends GetxController{
//
//   //=====================================> Load Counter Method <==================================
//   var _counter = 1000;
//   _loadCounter() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     setState(() {
//       _counter = preferences.getInt("counter") ?? 1000;
//     });
//   }
//
// //==================================> Increment Counter Method <================================
//   _incrementCounter() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     setState(() {
//       _counter++;
//       preferences.setInt("counter", _counter);
//     });
//   }
//
// //==================================> Decrement Counter Method <================================
//   _decrementCounter() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     setState(() {
//       _counter--;
//       preferences.setInt("counter", _counter);
//     });
//   }
//
//   @override
//   void initState() {
//     _loadCounter();
//     super.initState();
//   }
//
//
//
//
//
//
//
//
//
// }
