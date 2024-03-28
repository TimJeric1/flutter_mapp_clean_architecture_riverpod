import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'selected_page_provider.g.dart';



@Riverpod(keepAlive: true)
class SelectedPageNotifer extends _$SelectedPageNotifer {

  @override
  int build() => 0;


  void changePage(int newValue) {
    state = newValue;
  }
}
