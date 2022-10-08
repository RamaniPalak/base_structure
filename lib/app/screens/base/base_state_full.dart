import 'package:base_structure/app/screens/base/base_state.dart';
import 'package:flutter/material.dart';

abstract class BasePage extends StatefulWidget {
  BasePage({Key? key}) : super(key: key);
}

abstract class BaseState<Page extends BasePage> extends State<Page> with BaseScreen{
}