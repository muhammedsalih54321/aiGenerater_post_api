import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pr_8/repository/api/ai_api.dart';
import 'package:pr_8/repository/model/ai_model.dart';

part 'ai_event.dart';
part 'ai_state.dart';

class AiBloc extends Bloc<AiEvent, AiState> {

  late Aimodel aimodel;
  AIApi aiapi= AIApi();
  


  AiBloc() : super(AiInitial()) {
    on<fetchai>((event, emit)async {
      emit(Aiblocloadig());
      try {

        aimodel = await aiapi.postAi(event.massage);
        emit(Aiblocloaded());
        
      } catch (e) {
        print(e);
        emit(Aierror());
      }

      
    });
  }
}
