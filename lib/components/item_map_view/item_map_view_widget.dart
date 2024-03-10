import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'item_map_view_model.dart';
export 'item_map_view_model.dart';

class ItemMapViewWidget extends StatefulWidget {
  const ItemMapViewWidget({super.key});

  @override
  State<ItemMapViewWidget> createState() => _ItemMapViewWidgetState();
}

class _ItemMapViewWidgetState extends State<ItemMapViewWidget> {
  late ItemMapViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemMapViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          if (!_model.mapView)
            FutureBuilder<ApiCallResponse>(
              future: HotelSearchLocationCall.call(),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                final listItemViewHotelSearchLocationResponse = snapshot.data!;
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(),
                  child: Builder(
                    builder: (context) {
                      final hotel = (HotelSearchLocationCall.hotel(
                                listItemViewHotelSearchLocationResponse
                                    .jsonBody,
                              )?.toList() ??
                              [])
                          .take(5)
                          .toList();
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: hotel.length,
                        itemBuilder: (context, hotelIndex) {
                          final hotelItem = hotel[hotelIndex];
                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 287.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 287.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                              child: Stack(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: CachedNetworkImage(
                                                      fadeInDuration: Duration(
                                                          milliseconds: 500),
                                                      fadeOutDuration: Duration(
                                                          milliseconds: 500),
                                                      imageUrl: valueOrDefault<
                                                          String>(
                                                        getJsonField(
                                                          hotelItem,
                                                          r'''$.max_1440_photo_url''',
                                                        )?.toString(),
                                                        'Photo',
                                                      ),
                                                      width: double.infinity,
                                                      height: 287.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.94, -0.93),
                                                    child: ToggleIcon(
                                                      onPressed: () async {
                                                        setState(() =>
                                                            FFAppState()
                                                                    .selected =
                                                                !FFAppState()
                                                                    .selected);
                                                      },
                                                      value:
                                                          FFAppState().selected,
                                                      onIcon: Icon(
                                                        FFIcons.kheart,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        size: 25.0,
                                                      ),
                                                      offIcon: Icon(
                                                        FFIcons.kheartFilled,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 25.0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              valueOrDefault<String>(
                                                getJsonField(
                                                  hotelItem,
                                                  r'''$.hotel_name''',
                                                )?.toString(),
                                                'Nomhotel',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge,
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                FFIcons.kstarFilled,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 16.0,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    getJsonField(
                                                      hotelItem,
                                                      r'''$.review_score''',
                                                    )?.toString(),
                                                    'Review',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                '${valueOrDefault<String>(
                                                  getJsonField(
                                                    hotelItem,
                                                    r'''$.address''',
                                                  )?.toString(),
                                                  'Adresse',
                                                )} ${valueOrDefault<String>(
                                                  getJsonField(
                                                    hotelItem,
                                                    r'''$.zip''',
                                                  )?.toString(),
                                                  'Code postale',
                                                )} ${valueOrDefault<String>(
                                                  getJsonField(
                                                    hotelItem,
                                                    r'''$.city''',
                                                  )?.toString(),
                                                  'Ville',
                                                )}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'SFPRO',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Du ${FFAppState().checkindate} Au ${FFAppState().checkoutdate}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'SFPRO',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        valueOrDefault<String>(
                                                      getJsonField(
                                                        hotelItem,
                                                        r'''$.min_total_price''',
                                                      )?.toString(),
                                                      'Prix',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall,
                                                  ),
                                                  TextSpan(
                                                    text: ' €',
                                                    style: TextStyle(),
                                                  ),
                                                  TextSpan(
                                                    text: ' night',
                                                    style: TextStyle(),
                                                  )
                                                ],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'SFPRO',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          if (_model.mapView)
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/Screenshot_2023-07-12_at_10.33.14.png',
                  width: 300.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  setState(() {
                    _model.mapView = !_model.mapView;
                  });
                },
                child: Container(
                  height: 34.0,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      _model.mapView
                          ? FlutterFlowTheme.of(context).secondary
                          : FlutterFlowTheme.of(context).primaryText,
                      FlutterFlowTheme.of(context).primaryText,
                    ),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 12.0, 0.0),
                          child: Stack(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            children: [
                              if (!_model.mapView)
                                Icon(
                                  Icons.map,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 18.0,
                                ),
                              if (_model.mapView)
                                Icon(
                                  Icons.list_alt,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 18.0,
                                ),
                            ],
                          ),
                        ),
                        Text(
                          _model.mapView ? 'List View' : 'Map View',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'SFPRO',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
