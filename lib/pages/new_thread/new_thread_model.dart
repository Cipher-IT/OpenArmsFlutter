import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewThreadModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDownThreadType widget.
  int? dropDownThreadTypeValue;
  FormFieldController<int>? dropDownThreadTypeValueController;
  // State field(s) for DropDownDucomentLanguage widget.
  int? dropDownDucomentLanguageValue;
  FormFieldController<int>? dropDownDucomentLanguageValueController;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Custom Action - getUserJWT] action in ButtonStart widget.
  String? jwt;
  // Stores action output result for [Custom Action - getFileName] action in ButtonStart widget.
  String? fileId;
  // Stores action output result for [Backend Call - API (StartFileThread)] action in ButtonStart widget.
  ApiCallResponse? apiResultgsc;
  // Stores action output result for [Custom Action - getUserJWT] action in ButtonStart widget.
  String? jwtg;
  // Stores action output result for [Custom Action - getFileName] action in ButtonStart widget.
  String? imageId;
  // Stores action output result for [Backend Call - API (StartFileThread)] action in ButtonStart widget.
  ApiCallResponse? apiResultrsh;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
