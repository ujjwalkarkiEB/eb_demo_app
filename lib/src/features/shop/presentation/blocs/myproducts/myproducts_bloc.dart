import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'myproducts_event.dart';
part 'myproducts_state.dart';

class MyproductsBloc extends Bloc<MyproductsEvent, MyproductsState> {
  MyproductsBloc() : super(MyProductsInitial()) {
    on<MyproductsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
