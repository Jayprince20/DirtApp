import 'package:dio/dio.dart';
import 'package:dirtapp/core/utils/apilibrary.dart';
import 'package:dirtapp/core/utils/constant.dart';
import 'package:dirtapp/model/placeModel.dart';

class RemoteProvider {
  static const base_url = Constant.Dvaddress;

  void saveDirt({
    String? idplace,
    String? message,
    String? status = "FULL",
    List<String>? picture,
    Function()? beforeSend,
    Function(dynamic token)? onSuccess,
    Function(DioError error)? onError,
  }) async {
    ApiRequest(
      url: base_url,
      data: {
        "message": message,
        "idplace": idplace,
        "status": status,
        "picture": picture,
      },
    ).post(
      beforeSend: () => {if (beforeSend == null) beforeSend!()},
      onSuccess: (data) {
        onSuccess!(data);
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  void getPlace({
    Function()? beforeSend,
    Function(List<PlaceModel> place)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    ApiRequest(
      url: base_url + "place",
      data: null,
    ).get(
      beforeSend: () => {if (beforeSend == null) beforeSend!()},
      onSuccess: (data) {
        print(data);
        onSuccess!(List<PlaceModel>.from(
            data.map((element) => PlaceModel.fromMap(element)).toList()));
        print("onSuccess");
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }
}
