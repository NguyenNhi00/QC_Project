import 'package:flutter_application_1/domain/entities/qc_data.dart';

abstract class PostReportRepository {
  Future<void> sendReport(QcReport qcReport);
}
