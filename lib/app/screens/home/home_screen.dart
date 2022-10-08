import 'package:base_structure/app/screens/base/base_state_full.dart';
import 'package:base_structure/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends BasePage {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen> {
  bool? isCenter;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      getInitialData();
    });
  }


  getInitialData() async {
    reservationDetail();
    user();
  }

  reservationDetail() async {

  }

  user() async {


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
        title: Text(
          'LOCL colive & work',
          style: kAppBarTitleStyle,
        ),
        actions: [
        ],
      ),

      body: Container(),
    );
  }
}


