import 'package:catfacts/data/network/app_api.dart';
import 'package:catfacts/domain/model/cats.dart';

class Repository {
  final AppServiceClient _appServiceClient;

  Repository(this._appServiceClient);

  Future<List<Cats>> fetchCats() => _appServiceClient.fetch();
}
