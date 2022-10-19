import 'package:cater_me_v2/abstracts/states/error_state.dart';
import 'package:cater_me_v2/module_credits/repository/credits_repository.dart';
import 'package:cater_me_v2/module_credits/request/create_credit_request.dart';
import 'package:cater_me_v2/module_credits/response/credit_response.dart';
import 'package:cater_me_v2/module_credits/ui/screens/credits_screen.dart';
import 'package:cater_me_v2/module_credits/ui/state/credits_list_success.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';

@injectable
class CreditsCubit extends Cubit<States> {
  final CreditsRepository _CreditsRepository;
  CreditsCubit(this._CreditsRepository) : super(LoadingState());

  getCredits(CreditScreenState screenState) {
    emit(LoadingState());
    _CreditsRepository.getCredits().then((value) {
      if (value == null) {
        emit(ErrorState(
            errMsg: 'Connection error',
            retry: () {
              getCredits(screenState);
            }));
      } else if (value.code == 200) {
        List<CreditsResponse> occList = [];
        for (var item in value.data.insideData) {
          occList.add(CreditsResponse.fromJson(item));
        }
        emit(
            CreditsListSuccess(screenState: screenState, creditsList: occList));
      } else {
        emit(ErrorState(
            errMsg: value.errorMessage,
            retry: () {
              getCredits(screenState);
            }));
      }
    });
  }

  createCredit(CreditScreenState screenState, CreateCreditRequest request) {
    emit(LoadingState());
    _CreditsRepository.createCredit(request).then((value) {
      if (value == null) {
        emit(ErrorState(
            errMsg: 'Connection error',
            retry: () {
              getCredits(screenState);
            }));
      } else if (value.code == 200) {
        getCredits(screenState);
      } else {
        emit(ErrorState(
            errMsg: value.errorMessage,
            retry: () {
              getCredits(screenState);
            }));
      }
    });
  }

  deleteCredit(CreditScreenState screenState, String id) {
    emit(LoadingState());
    _CreditsRepository.deleteCredit(id).then((value) {
      if (value == null) {
        emit(ErrorState(
            errMsg: 'Connection error',
            retry: () {
              getCredits(screenState);
            }));
      } else if (value.code == 200) {
        getCredits(screenState);
      } else {
        emit(ErrorState(
            errMsg: value.errorMessage,
            retry: () {
              getCredits(screenState);
            }));
      }
    });
  }
}
