import 'package:flutter_application_1/domain/entities/qa_data.dart';
import 'package:flutter_application_1/domain/repositories/fetch_qa_data.dart';

class GetDataQAUsecase {
  GetQAdataRepository getQAdataRepository;
  static final List<Standard> _listaa = [];
  GetDataQAUsecase(this.getQAdataRepository);
  Future<List<Standard>> getQAdata() async {
    final dataQA = await getQAdataRepository.getQAdata();
    _listaa.addAll(dataQA);
    return _listaa ;
  }
}
