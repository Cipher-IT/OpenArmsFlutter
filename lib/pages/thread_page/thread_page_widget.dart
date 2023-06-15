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

    return Title(
        title: 'ThreadPage',
        color: FlutterFlowTheme.of(context).primary,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: true,
              title: FutureBuilder<List<ThreadsRow>>(
                future: ThreadsTable().querySingleRow(
                  queryFn: (q) => q.eq(
                    'id',
                    FFAppState().threadId,
                  ),
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
                  List<ThreadsRow> textThreadsRowList = snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final textThreadsRow = textThreadsRowList.isNotEmpty
                      ? textThreadsRowList.first
                      : null;
                  return Text(
                    textThreadsRow!.tite!.maybeHandleOverflow(
                      maxChars: 45,
                      replacement: '…',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).info,
                        ),
                  );
                },
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
                    child: Builder(
                      builder: (context) {
                        if (FFAppState().threadId != null &&
                            FFAppState().threadId != '') {
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
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
                                      width: 40.0,
                                      height: 40.0,
                                      child: SpinKitPulse(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 40.0,
                                      ),
                                    ),
                                  );
                                }
                                List<MessagesRow> listViewMessagesRowList =
                                    snapshot.data!;
                                if (listViewMessagesRowList.isEmpty) {
                                  return Center(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      child: HoldOnImThinkingWidget(),
                                    ),
                                  );
                                }
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
                                        if (listViewMessagesRow.role ==
                                            'user') {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 16.0, 0.0),
                                            child: wrapWithModel(
                                              model: _model.userMessageModels
                                                  .getModel(
                                                listViewMessagesRow.id
                                                    .toString(),
                                                listViewIndex,
                                              ),
                                              updateCallback: () =>
                                                  setState(() {}),
                                              updateOnChange: true,
                                              child: UserMessageWidget(
                                                key: Key(
                                                  'Key11n_${listViewMessagesRow.id.toString()}',
                                                ),
                                                text:
                                                    listViewMessagesRow.content,
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 8.0, 0.0, 0.0),
                                            child: wrapWithModel(
                                              model: _model
                                                  .assistantResponseModels
                                                  .getModel(
                                                listViewMessagesRow.id
                                                    .toString(),
                                                listViewIndex,
                                              ),
                                              updateCallback: () =>
                                                  setState(() {}),
                                              updateOnChange: true,
                                              child: AssistantResponseWidget(
                                                key: Key(
                                                  'Keyh6d_${listViewMessagesRow.id.toString()}',
                                                ),
                                                text:
                                                    listViewMessagesRow.content,
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
                          );
                        } else {
                          return wrapWithModel(
                            model: _model.emptyChatModel,
                            updateCallback: () => setState(() {}),
                            child: EmptyChatWidget(),
                          );
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 8.0, 0.0),
                            child: TextFormField(
                              controller: _model.textController,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.textController',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              autofocus: true,
                              textCapitalization: TextCapitalization.sentences,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  '2eqirg9o' /* Type here.. */,
                                ),
                                labelStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
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
                                suffixIcon:
                                    _model.textController!.text.isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model.textController?.clear();
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              size: 22,
                                            ),
                                          )
                                        : null,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              maxLines: null,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 20.0,
                            borderWidth: 0.0,
                            buttonSize: 40.0,
                            fillColor: FlutterFlowTheme.of(context).primary,
                            icon: FaIcon(
                              FontAwesomeIcons.solidPaperPlane,
                              color: FlutterFlowTheme.of(context).info,
                              size: 16.0,
                            ),
                            onPressed: () async {
                              if (FFAppState().threadId != null &&
                                  FFAppState().threadId != '') {
                                _model.jwtd = await actions.getUserJWT();
                                _model.apiResultf5y =
                                    await NewThreadMessageCall.call(
                                  token: _model.jwtd,
                                  content: _model.textController.text,
                                  threadId: FFAppState().threadId,
                                );
                                if ((_model.apiResultf5y?.succeeded ?? true)) {
                                  setState(() {
                                    _model.textController?.clear();
                                  });
                                }
                              } else {
                                _model.jwt = await actions.getUserJWT();
                                _model.thread = await StartChatThreadCall.call(
                                  content: _model.textController.text,
                                  token: _model.jwt,
                                );
                                setState(() {
                                  FFAppState().threadId = getJsonField(
                                    (_model.thread?.jsonBody ?? ''),
                                    r'''$.thread_id''',
                                  ).toString();
                                });
                                setState(() {
                                  _model.textController?.clear();
                                });
                              }

                              setState(() {});
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
        ));
  }
}
