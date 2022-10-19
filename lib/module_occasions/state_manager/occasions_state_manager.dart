import 'package:cater_me_v2/abstracts/states/error_state.dart';
import 'package:cater_me_v2/module_home/ui/state/loading_home_state.dart';
import 'package:cater_me_v2/module_occasions/request/create_occasion_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
import '../repository/occasions_repository.dart';
import '../response/occasions_response.dart';
import '../ui/screens/occasions_screen.dart';
import '../ui/state/occasions_success.dart';

@injectable
class OccasionsCubit extends Cubit<States> {
  final OccasionsRepository _occasionsRepository;
  OccasionsCubit(this._occasionsRepository) : super(LoadingState());

  getOccasions(OccasionsScreenState screenState) {
    emit(LoadingState());
    _occasionsRepository.getOccasions().then((value) {
      if (value == null) {
        emit(ErrorState(
            errMsg: 'Connection error',
            retry: () {
              getOccasions(screenState);
            }));
      } else if (value.code == 200) {
        List<OccasionsResponse> occList = [];
        for (var item in value.data.insideData) {
          occList.add(OccasionsResponse.fromJson(item));
        }
        emit(OccasionsListSuccess(
            screenState: screenState, occasionsResponse: occList));
      } else {
        emit(ErrorState(
            errMsg: value.errorMessage,
            retry: () {
              getOccasions(screenState);
            }));
      }
    });
  }

  createOccasion(
      OccasionsScreenState screenState, CreateOccasionRequest request) {
    emit(LoadingState());
    _occasionsRepository.createOccasion(request).then((value) {
      if (value == null) {
        emit(ErrorState(
            errMsg: 'Connection error',
            retry: () {
              getOccasions(screenState);
            }));
      } else if (value.code == 201) {
        getOccasions(screenState);
      } else {
        emit(ErrorState(
            errMsg: value.errorMessage,
            retry: () {
              getOccasions(screenState);
            }));
      }
    });
  }

  updateOccasion(
      OccasionsScreenState screenState, CreateOccasionRequest request) {
    emit(LoadingState());
    _occasionsRepository.updateOccasion(request).then((value) {
      if (value == null) {
        emit(ErrorState(
            errMsg: 'Connection error',
            retry: () {
              getOccasions(screenState);
            }));
      } else if (value.code == 201) {
        getOccasions(screenState);
      } else {
        emit(ErrorState(
            errMsg: value.errorMessage,
            retry: () {
              getOccasions(screenState);
            }));
      }
    });
  }

  deleteOccasion(OccasionsScreenState screenState, String id) {
    emit(LoadingState());
    _occasionsRepository.deleteOccasion(id).then((value) {
      if (value == null) {
        emit(ErrorState(
            errMsg: 'Connection error',
            retry: () {
              getOccasions(screenState);
            }));
      } else if (value.code == 200) {
        getOccasions(screenState);
      } else {
        emit(ErrorState(
            errMsg: value.errorMessage,
            retry: () {
              getOccasions(screenState);
            }));
      }
    });
  }
}
