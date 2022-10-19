import 'package:cater_me_v2/abstracts/states/error_state.dart';
import 'package:cater_me_v2/module_addresses/repository/address_repository.dart';
import 'package:cater_me_v2/module_addresses/request/create_address_request.dart';
import 'package:cater_me_v2/module_addresses/response/address_response.dart';
import 'package:cater_me_v2/module_addresses/ui/screens/address_screen.dart';
import 'package:cater_me_v2/module_addresses/ui/state/address_list_success.dart';
import 'package:cater_me_v2/module_addresses/ui/state/selected_address_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';

@injectable
class AddressCubit extends Cubit<States> {
  final AddressRepository _addressRepository;
  AddressCubit(this._addressRepository) : super(LoadingState());

  getAddress(AddressScreenState screenState , [bool? selectedSate]) {
    emit(LoadingState());
    _addressRepository.getAddress().then((value) {
      if (value == null) {
        emit(ErrorState(
            errMsg: 'Connection error',
            retry: () {
              getAddress(screenState);
            }));
      } else if (value.code == 200) {
        List<AddressResponse> occList = [];
        for (var item in value.data.insideData) {
          occList.add(AddressResponse.fromJson(item));
        }
        if(selectedSate != null && selectedSate ){
          emit(
              SelectAddressListSuccess(screenState: screenState, addressList: occList));
        }
       else emit(
            AddressListSuccess(screenState: screenState, addressList: occList));
      } else {
        emit(ErrorState(
            errMsg: value.errorMessage,
            retry: () {
              getAddress(screenState,selectedSate);
            }));
      }
    });
  }

  createAddress(AddressScreenState screenState, CreateAddressRequest request) {
    emit(LoadingState());
    _addressRepository.createAddress(request).then((value) {
      if (value == null) {
        emit(ErrorState(
            errMsg: 'Connection error',
            retry: () {
              getAddress(screenState);
            }));
      } else if (value.code == 201) {
        getAddress(screenState);
      } else {
        emit(ErrorState(
            errMsg: value.errorMessage,
            retry: () {
              getAddress(screenState);
            }));
      }
    });
  }

  updateAddress(AddressScreenState screenState, CreateAddressRequest request) {
    emit(LoadingState());
    _addressRepository.updateAddress(request).then((value) {
      if (value == null) {
        emit(ErrorState(
            errMsg: 'Connection error',
            retry: () {
              getAddress(screenState);
            }));
      } else if (value.code == 201) {
        getAddress(screenState);
      } else {
        emit(ErrorState(
            errMsg: value.errorMessage,
            retry: () {
              getAddress(screenState);
            }));
      }
    });
  }

  deleteAddress(AddressScreenState screenState, String id) {
    emit(LoadingState());
    _addressRepository.deleteAddress(id).then((value) {
      if (value == null) {
        emit(ErrorState(
            errMsg: 'Connection error',
            retry: () {
              getAddress(screenState);
            }));
      } else if (value.code == 200) {
        getAddress(screenState);
      } else {
        emit(ErrorState(
            errMsg: value.errorMessage,
            retry: () {
              getAddress(screenState);
            }));
      }
    });
  }
}
