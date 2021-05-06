import 'package:flutter_bloc/flutter_bloc.dart';
enum FavEvent {favorite}
class FavaBloc extends Bloc<FavEvent, bool>{
  FavaBloc() : super(false);
  @override
  bool get initialCount => false;
  @override
  Stream<bool> mapEventToState(FavEvent event) async*{
    switch(event){
      case FavEvent.favorite:
        yield !state;
        break;
    }
  }

}