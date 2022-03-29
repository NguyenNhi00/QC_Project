import 'package:flutter_application_1/data/data_source/post_report.dart';
import 'package:flutter_application_1/domain/entities/qc_data.dart';
import 'package:flutter_application_1/domain/repositories/post_report_repo.dart';

class PosrReportRepositoryImpl implements PostReportRepository {
  final PostReportService postReportService;
  PosrReportRepositoryImpl(this.postReportService);
  @override
  Future<void> sendReport(QcReport qcReport) {
    // TODO: implement sendReport
    return postReportService.postReport(qcReport);
  }
}
