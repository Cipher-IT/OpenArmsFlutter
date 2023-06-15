import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/assistant_response/assistant_response_widget.dart';
import '/components/user_message/user_message_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ThreadPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for UserMessage dynamic component.
  late FlutterFlowDynamicModels<UserMessageModel> userMessageModels;
  // Models for AssistantResponse dynamic component.
  late FlutterFlowDynamicModels<AssistantResponseModel> assistantResponseModels;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    userMessageModels = FlutterFlowDynamicModels(() => UserMessageModel());
    assistantResponseModels =
        FlutterFlowDynamicModels(() => AssistantResponseModel());
  }

  void dispose() {
    unfocusNode.dispose();
    userMessageModels.dispose();
    assistantResponseModels.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
