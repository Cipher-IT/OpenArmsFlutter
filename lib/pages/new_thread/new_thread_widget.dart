import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'new_thread_model.dart';
export 'new_thread_model.dart';

class NewThreadWidget extends StatefulWidget {
  const NewThreadWidget({Key? key}) : super(key: key);

  @override
  _NewThreadWidgetState createState() => _NewThreadWidgetState();
}

class _NewThreadWidgetState extends State<NewThreadWidget> {
  late NewThreadModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewThreadModel());

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
            FFLocalizations.of(context).getText(
              'ye8328rs' /* New Thread */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: FlutterFlowDropDown<int>(
                  controller: _model.dropDownValueController1 ??=
                      FormFieldController<int>(null),
                  options: [1, 2, 3],
                  optionLabels: [
                    FFLocalizations.of(context).getText(
                      'bwz348do' /* Upload An Image (.jpg, .png, .... */,
                    ),
                    FFLocalizations.of(context).getText(
                      '1s9apgyw' /* Upload PDF file */,
                    ),
                    FFLocalizations.of(context).getText(
                      'fj0k1fco' /* Start a new chat */,
                    )
                  ],
                  onChanged: (val) =>
                      setState(() => _model.dropDownValue1 = val),
                  width: 300.0,
                  height: 50.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium,
                  hintText: FFLocalizations.of(context).getText(
                    't40gdkiw' /* Please select a way to start c... */,
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 2.0,
                  borderColor: FlutterFlowTheme.of(context).primary,
                  borderWidth: 2.0,
                  borderRadius: 25.0,
                  margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                  hidesUnderline: true,
                  isSearchable: false,
                ),
              ),
              if ((_model.dropDownValue1 == 1) || (_model.dropDownValue1 == 2))
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: FutureBuilder<List<LanguagesRow>>(
                    future: FFAppState().getLanguages(
                      requestFn: () => LanguagesTable().queryRows(
                        queryFn: (q) => q.eq(
                          'visible',
                          true,
                        ),
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
                      List<LanguagesRow> dropDownLanguagesRowList =
                          snapshot.data!;
                      return FlutterFlowDropDown<int>(
                        controller: _model.dropDownValueController2 ??=
                            FormFieldController<int>(
                          _model.dropDownValue2 ??=
                              dropDownLanguagesRowList.first.id,
                        ),
                        options:
                            dropDownLanguagesRowList.map((e) => e.id).toList(),
                        optionLabels: dropDownLanguagesRowList
                            .map((e) => e.writtenName)
                            .withoutNulls
                            .toList(),
                        onChanged: (val) =>
                            setState(() => _model.dropDownValue2 = val),
                        width: 300.0,
                        height: 50.0,
                        searchHintTextStyle:
                            FlutterFlowTheme.of(context).labelMedium,
                        textStyle: FlutterFlowTheme.of(context).bodyMedium,
                        hintText: FFLocalizations.of(context).getText(
                          'q9yn1ts9' /* Please select document languag... */,
                        ),
                        searchHintText: FFLocalizations.of(context).getText(
                          '5gesai2h' /* Search for an item... */,
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 2.0,
                        borderColor: FlutterFlowTheme.of(context).primary,
                        borderWidth: 2.0,
                        borderRadius: 25.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            16.0, 4.0, 16.0, 4.0),
                        hidesUnderline: true,
                        isSearchable: true,
                      );
                    },
                  ),
                ),
              if (_model.dropDownValue1 == 2)
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final selectedFile = await selectFile(
                            storageFolderPath: '/', allowedExtensions: ['pdf']);
                        if (selectedFile != null) {
                          setState(() => _model.isDataUploading1 = true);
                          FFUploadedFile? selectedUploadedFile;
                          String? downloadUrl;
                          try {
                            showUploadMessage(
                              context,
                              'Uploading file...',
                              showLoading: true,
                            );
                            selectedUploadedFile = FFUploadedFile(
                              name: selectedFile.storagePath.split('/').last,
                              bytes: selectedFile.bytes,
                            );
                            downloadUrl = await uploadSupabaseStorageFile(
                              bucketName: 'thread_files',
                              selectedMedia: selectedFile,
                            );
                          } finally {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            _model.isDataUploading1 = false;
                          }
                          if (selectedUploadedFile != null &&
                              downloadUrl != null) {
                            setState(() {
                              _model.uploadedLocalFile1 = selectedUploadedFile!;
                              _model.uploadedFileUrl1 = downloadUrl!;
                            });
                            showUploadMessage(
                              context,
                              'Success!',
                            );
                          } else {
                            setState(() {});
                            showUploadMessage(
                              context,
                              'Failed to upload file',
                            );
                            return;
                          }
                        }
                      },
                      text: FFLocalizations.of(context).getText(
                        'a13rb3ap' /* Button */,
                      ),
                      options: FFButtonOptions(
                        width: 180.0,
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              if (_model.dropDownValue1 == 1)
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final selectedMedia =
                            await selectMediaWithSourceBottomSheet(
                          context: context,
                          storageFolderPath: '/',
                          imageQuality: 70,
                          allowPhoto: true,
                        );
                        if (selectedMedia != null &&
                            selectedMedia.every((m) =>
                                validateFileFormat(m.storagePath, context))) {
                          setState(() => _model.isDataUploading2 = true);
                          var selectedUploadedFiles = <FFUploadedFile>[];
                          var downloadUrls = <String>[];
                          try {
                            showUploadMessage(
                              context,
                              'Uploading file...',
                              showLoading: true,
                            );
                            selectedUploadedFiles = selectedMedia
                                .map((m) => FFUploadedFile(
                                      name: m.storagePath.split('/').last,
                                      bytes: m.bytes,
                                      height: m.dimensions?.height,
                                      width: m.dimensions?.width,
                                      blurHash: m.blurHash,
                                    ))
                                .toList();

                            downloadUrls = await uploadSupabaseStorageFiles(
                              bucketName: 'thread_files',
                              selectedMedia: selectedMedia,
                            );
                          } finally {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            _model.isDataUploading2 = false;
                          }
                          if (selectedUploadedFiles.length ==
                                  selectedMedia.length &&
                              downloadUrls.length == selectedMedia.length) {
                            setState(() {
                              _model.uploadedLocalFile2 =
                                  selectedUploadedFiles.first;
                              _model.uploadedFileUrl2 = downloadUrls.first;
                            });
                            showUploadMessage(context, 'Success!');
                          } else {
                            setState(() {});
                            showUploadMessage(context, 'Failed to upload data');
                            return;
                          }
                        }
                      },
                      text: FFLocalizations.of(context).getText(
                        'a13rb3ap' /* Button */,
                      ),
                      options: FFButtonOptions(
                        width: 180.0,
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    _model.newThreadOutput = await ThreadsTable().insert({
                      'user_id': currentUserUid,
                    });
                    setState(() {
                      FFAppState().threadId = _model.newThreadOutput!.id;
                      FFAppState().threadTitle = _model.newThreadOutput!.tite!;
                    });

                    setState(() {});
                  },
                  text: FFLocalizations.of(context).getText(
                    'a13rb3ap' /* Button */,
                  ),
                  options: FFButtonOptions(
                    width: 180.0,
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
