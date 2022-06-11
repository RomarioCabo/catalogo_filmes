import 'package:flutter/material.dart';

class RequestState {}

class Initial extends RequestState {}

class Loading extends RequestState {}

class Completed extends RequestState {}

class CompletedMore extends RequestState {}

class Error extends RequestState {
  String? error;

  Error({@required this.error});
}
