import 'package:flutter_application_1/domain/entities/qa_data.dart';

abstract class GetQAdataRepository {
  GetQAdataRepository(GetQAdataRepository getQAdataRepository);

  Future<List<Standard>> getQAdata();
}
