import 'package:catfacts/data/network/app_api.dart';
import 'package:catfacts/domain/model/cats.dart';

abstract class RemoteDataSource {
  Future<List<Cats>> fetchCats();
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  RemoteDataSourceImplementer(this._appServiceClient);
  final AppServiceClient _appServiceClient;

  @override
  Future<List<Cats>> fetchCats() {
    return _appServiceClient.fetch();
  }
}
