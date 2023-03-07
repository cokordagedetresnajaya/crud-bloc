import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import './app.dart';
import './general_observer.dart';

void main() {
  Bloc.observer = MyObserver();
  runApp(const App());
}
