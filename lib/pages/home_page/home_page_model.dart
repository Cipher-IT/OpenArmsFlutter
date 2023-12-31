import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/start_thread_widget.dart';
import '/components/thread_card/thread_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for StartThread component.
  late StartThreadModel startThreadModel;
  // Models for ThreadCard dynamic component.
  late FlutterFlowDynamicModels<ThreadCardModel> threadCardModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    startThreadModel = createModel(context, () => StartThreadModel());
    threadCardModels = FlutterFlowDynamicModels(() => ThreadCardModel());
  }

  void dispose() {
    unfocusNode.dispose();
    startThreadModel.dispose();
    threadCardModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
