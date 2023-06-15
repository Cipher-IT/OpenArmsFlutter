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
import 'thread_page_model.dart';
export 'thread_page_model.dart';

class ThreadPageWidget extends StatefulWidget {
  const ThreadPageWidget({Key? key}) : super(key: key);

  @override
  _ThreadPageWidgetState createState() => _ThreadPageWidgetState();
}

class _ThreadPageWidgetState extends State<ThreadPageWidget> {
  late ThreadPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThreadPageModel());

    _model.textController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: true,
          title: Text(
            FFAppState().threadTitle,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: FutureBuilder<List<MessagesRow>>(
                    future: MessagesTable().queryRows(
                      queryFn: (q) => q
                          .eq(
                            'thread_id',
                            FFAppState().threadId,
                          )
                          .order('timestamp'),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        );
                      }
                      List<MessagesRow> listViewMessagesRowList =
                          snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        reverse: true,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewMessagesRowList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewMessagesRow =
                              listViewMessagesRowList[listViewIndex];
                          return Builder(
                            builder: (context) {
                              if (listViewMessagesRow.role == 'user') {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 16.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.userMessageModels.getModel(
                                      listViewMessagesRow.id.toString(),
                                      listViewIndex,
                                    ),
                                    updateCallback: () => setState(() {}),
                                    child: UserMessageWidget(
                                      key: Key(
                                        'Keykau_${listViewMessagesRow.id.toString()}',
                                      ),
                                      text: listViewMessagesRow.content,
                                    ),
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 8.0, 0.0, 0.0),
                                  child: wrapWithModel(
                                    model:
                                        _model.assistantResponseModels.getModel(
                                      listViewMessagesRow.id.toString(),
                                      listViewIndex,
                                    ),
                                    updateCallback: () => setState(() {}),
                                    child: AssistantResponseWidget(
                                      key: Key(
                                        'Key6dj_${listViewMessagesRow.id.toString()}',
                                      ),
                                      text: listViewMessagesRow.content,
                                    ),
                                  ),
                                );
                              }
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 8.0, 0.0),
                        child: TextFormField(
                          controller: _model.textController,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: FFLocalizations.of(context).getText(
                              '2eqirg9o' /* Type here.. */,
                            ),
                            labelStyle: FlutterFlowTheme.of(context).titleSmall,
                            hintStyle: FlutterFlowTheme.of(context).labelMedium,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          maxLines: null,
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 20.0,
                        borderWidth: 0.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).primary,
                        icon: FaIcon(
                          FontAwesomeIcons.solidPaperPlane,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          size: 16.0,
                        ),
                        onPressed: () async {
                          await StartThreadCall.call(
                            content: _model.textController.text,
                            token: 'd',
                          );
                          setState(() {
                            _model.textController?.clear();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
