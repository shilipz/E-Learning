import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';

part 'course_bloc_event.dart';
part 'course_bloc_state.dart';

class CourseBloc extends Bloc<CourseBlocEvent, CourseBlocState> {
  CourseBloc() : super(CourseBlocInitial()) {
    on<CourseInitialsFetchEvent>(courseInitialsFetchEvent);
  }

  FutureOr<void> courseInitialsFetchEvent(
      CourseInitialsFetchEvent event, Emitter<CourseBlocState> emit) async {
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.parse('http://127.0.0.1:8000/api/tutor/courses/'),
      );
      print(response.body);
    } catch (e) {
      log(e.toString());
    }
  }
}
