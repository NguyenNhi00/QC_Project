import 'package:flutter_application_1/domain/entities/qc_data.dart';
import 'package:flutter_application_1/domain/repositories/post_report_repo.dart';

class SendReportUsecase {
  PostReportRepository sendReportRepository;
  SendReportUsecase(this.sendReportRepository);
  Future<void> sendReport(QcReport qcReport) async {
     sendReportRepository.sendReport(qcReport);
  }
}
