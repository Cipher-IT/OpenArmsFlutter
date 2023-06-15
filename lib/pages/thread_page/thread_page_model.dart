import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/assistant_response/assistant_response_widget.dart';
import '/components/empty_chat/empty_chat_widget.dart';
import '/components/hold_on_im_thinking/hold_on_im_thinking_widget.dart';
import '/components/user_message/user_message_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
  // Model for EmptyChat component.
  late EmptyChatModel emptyChatModel;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - getUserJWT] action in IconButton widget.
  String? jwtd;
  // Stores action output result for [Backend Call - API (NewThreadMessage)] action in IconButton widget.
  ApiCallResponse? apiResultf5y;
  // Stores action output result for [Custom Action - getUserJWT] action in IconButton widget.
  String? jwt;
  // Stores action output result for [Backend Call - API (StartChatThread)] action in IconButton widget.
  ApiCallResponse? thread;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    userMessageModels = FlutterFlowDynamicModels(() => UserMessageModel());
    assistantResponseModels =
        FlutterFlowDynamicModels(() => AssistantResponseModel());
    emptyChatModel = createModel(context, () => EmptyChatModel());
  }

  void dispose() {
    unfocusNode.dispose();
    userMessageModels.dispose();
    assistantResponseModels.dispose();
    emptyChatModel.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
