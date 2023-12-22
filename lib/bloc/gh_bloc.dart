
import 'dart:async';

import 'package:bloc/bloc.dart';

part 'gh_event.dart';
part 'gh_state.dart';

class GhBloc extends Bloc<GhEvent, GHState>{
  GhBloc(): super(GHState());

  Future <String>  retornString() async{
    return "Hola mundo";
  }




  @override
  Stream<GHState> mapEventToStare (
    GhEvent event,
  ) async* {

  }




}