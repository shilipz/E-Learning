import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'test_bloc_event.dart';
part 'test_bloc_state.dart';

class TestBlocBloc extends Bloc<TestBlocEvent, TestBlocState> {
  TestBlocBloc() : super(TestBlocInitial()) {
    on<TestBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
