import 'package:car_m/constants/app_styles.dart';
import 'package:car_m/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../../../../../../../../constants/app_assets.dart';
import '../../../../../../../../../../../../constants/app_colors.dart';
import '../../../../../../../../posts/data/dto/posts_dto.dart';
import '../../../../data/dto/selected_club_dto.dart';
import '../data/bloc/create_event_screen_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({Key? key, required this.club}) : super(key: key);
  final OwnClubDto club;
  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  @override
  Widget build(BuildContext context) {
    return _CreateEventScreenBody(
      club: widget.club,
    );
  }
}

class _CreateEventScreenBody extends StatefulWidget {
  const _CreateEventScreenBody({Key? key, required this.club})
      : super(key: key);
  final OwnClubDto club;
  @override
  State<_CreateEventScreenBody> createState() => _CreateEventScreenBodyState();
}

class _CreateEventScreenBodyState extends State<_CreateEventScreenBody> {
  GoogleMapController? mapController;
  CameraPosition? cameraPosition;
  LatLng startLocation = LatLng(43.235420, 76.909147);
  String location = "Location Name:";
  TextEditingController? textController;
  TextEditingController? eventTextController;
  @override
  void initState() {
    textController = TextEditingController();
    eventTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var position = LatLng(43.235420, 76.909147);
    return Scaffold(
      body: BlocBuilder<CreateEventScreenBloc, CreateEventScreenState>(
        builder: (context, state) {
          return Stack(
            children: [
              GoogleMap(
                zoomGesturesEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: startLocation,
                  zoom: 14.5,
                ),
                mapType: MapType.normal,
                onMapCreated: (controller) {
                  setState(() {
                    mapController = controller;
                  });
                },
                onCameraMove: (CameraPosition cameraPositiona) {
                  cameraPosition = cameraPositiona;
                },
              ),
              Center(
                child: GestureDetector(
                  onTap: () => showModalBottomSheet(
                      isDismissible: true,
                      isScrollControlled: true,
                      context: context,
                      backgroundColor: Colors.transparent,
                      barrierColor: Colors.transparent,
                      builder: (BuildContext context) {
                        return DraggableScrollableSheet(
                          initialChildSize: 0.65,
                          builder: (_, controller) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.mainWhite,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 46,
                                      backgroundImage:
                                          AssetImage(AppAssets.images.testNews),
                                      backgroundColor: Colors.transparent,
                                    ),
                                    Text('${widget.club.name}',
                                        style: AppStyles.s18w700.copyWith(
                                            color: AppColors.mainBlack)),
                                    Text('${widget.club.description}',
                                        style: AppStyles.s18w700.copyWith(
                                            color: AppColors.mainBlack)),
                                    Text(
                                      'Lat: ${cameraPosition?.target.latitude}',
                                      style: AppStyles.s18w700
                                          .copyWith(color: AppColors.mainBlack),
                                    ),
                                    Text(
                                        'Long: ${cameraPosition?.target.longitude}',
                                        style: AppStyles.s18w700.copyWith(
                                            color: AppColors.mainBlack)),
                                    Text(
                                        '${AppLocalizations.of(context)?.description}'),
                                    TextField(
                                      controller: textController,
                                      decoration: InputDecoration(
                                        hintText:
                                            '${AppLocalizations.of(context)?.addDescription}',
                                        fillColor: AppColors.background,
                                        filled: true,
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    TextField(
                                      controller: eventTextController,
                                      decoration: InputDecoration(
                                        hintText:
                                            '${AppLocalizations.of(context)?.name}',
                                        fillColor: AppColors.background,
                                        filled: true,
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          BlocProvider.of<
                                                      CreateEventScreenBloc>(
                                                  context)
                                              .add(CreateEventEvent(
                                                  latitude: cameraPosition!
                                                      .target.latitude,
                                                  longitude: cameraPosition!
                                                      .target.longitude,
                                                  description:
                                                      '${textController?.text}',
                                                  name:
                                                      '${eventTextController?.text}',
                                                  id: widget.club.id
                                                      .toString()));
                                          Navigator.pushReplacementNamed(context, MainNavigationRouteNames.mainRoute);
                                        },
                                        child: Text(
                                            '${AppLocalizations.of(context)?.createEvent}')),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                  child: Image.asset(
                    AppAssets.images.locator,
                    width: 80,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
