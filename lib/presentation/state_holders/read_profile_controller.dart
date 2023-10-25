import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/models/read_profile_model.dart';
import '../../data/utility/network_caller.dart';
import '../../data/utility/urls.dart';

class ReadProfileController extends GetxController {
  String _message = '';
  ReadProfileModel _readProfileModel = ReadProfileModel();

  String get message => _message;

  ReadProfileModel get readProfileModel => _readProfileModel;

  Future<bool> readProfileData() async {
    final NetworkResponse response =
    await NetworkCaller().getRequest(Urls.readProfile);
    if (response.isSuccess) {
      _readProfileModel =
          ReadProfileModel.fromJson(response.responseJson ?? {});
      return true;
    } else {
      _message = 'Read profile data fetch failed!';
      return false;
    }
  }
}