

import 'package:sumangalam/constants/entities.dart';
import 'package:sumangalam/core/di/injector.dart';

final _reqisteredUrl = $sl.get<Urls>();

class Urls {
  Urls(this.url);

  final String url;

  factory Urls.test() => Urls('https://omiferp.easycloud.co.in/omif');

  static final baseUrl = _reqisteredUrl.url;

  static final String jsonWs = '$baseUrl/org.openbravo.service.json.jsonrest';
  static final String _customWs = '$baseUrl/ws';

  static final String preferences = '$jsonWs/${Entities.preference}';

  static final attachmentWsV2 = '$_customWs/in.easycloud.rest.files.v2';
  static final attachmentWs = '$_customWs/in.easycloud.rest.files.multipart';
  static final queryService = '$_customWs/in.easycloud.commons.QueryService';

  static final user = '$jsonWs/${Entities.user}';
  static final device = '$jsonWs/${Entities.device}';
  static final organization = '$jsonWs/${Entities.organization}';
  static final businessPartner = '$jsonWs/${Entities.businessPartner}';
  static final approvalUser = '$jsonWs/${Entities.approvalUser}';
  static final bankAccount = '$jsonWs/${Entities.bankAccount}';
  static final businessPartnerLocation = '$jsonWs/${Entities.businessPartnerLocation}';
  static final preference = '$jsonWs/${Entities.preference}';
  static final expense = '$jsonWs/${Entities.expense}';
  static final image = '$jsonWs/${Entities.image}';
  static final roleOrganization = '$jsonWs/${Entities.roleOrganization}';
  static final financialGLItem = '$jsonWs/${Entities.financialGLItem}';
  static final invoice = '$jsonWs/${Entities.invoice}';
  static final attachment = '$jsonWs/${Entities.attachment}';
  static final finPaymentMethod ='$jsonWs/${Entities.payments}';
  static final payingFromMethods ='$jsonWs/${Entities.payingFrom}';
    static final costCenterMethod ='$jsonWs/${Entities.costCenter}';



  static final sendApprove = '$_customWs/in.easycloud.expensemanager.ApproveExpenseRequest';
  static final approvalOrder = '$_customWs/in.easycloud.expensemanager.getApprovalOrderlist';
  static final createPaymentOut = '$_customWs/in.easycloud.expensemanager.createPayout';
  static final glitemForExpenseReq = '$_customWs/in.easycloud.expensemanager.getglitemforexpensereq';
  static final customlocation = '$_customWs/in.easycloud.user.AddBPLocation';

  // Push Notifications
  static final pnsService = '$_customWs/in.easycloud.pns.service';
}



abstract class AppConstants {
  static const oneSignalId = "3db95866-8858-42c1-9502-fc57285c82ff";
}