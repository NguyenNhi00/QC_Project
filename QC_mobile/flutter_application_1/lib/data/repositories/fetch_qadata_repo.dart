import 'package:flutter_application_1/data/data_source/fetch_qadata.dart';
import 'package:flutter_application_1/domain/entities/qa_data.dart';
import 'package:flutter_application_1/domain/repositories/fetch_qa_data.dart';

class GetQAdataRepositoryimpl implements GetQAdataRepository {
  final FetchQaDataService httpService;
  GetQAdataRepositoryimpl(this.httpService);

  @override
  Future<List<Standard>> getQAdata() {
    return httpService.getQAdata();
  }
}
