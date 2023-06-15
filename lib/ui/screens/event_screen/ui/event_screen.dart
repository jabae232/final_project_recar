import 'package:car_m/ui/screens/event_screen/data/event_bloc/event_bloc.dart';
import 'package:car_m/ui/screens/event_screen/ui/widgets/participants_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../constants/app_assets.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_styles.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);
  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  LocationData? currentLocation;
  LatLng startLocation = LatLng(43.235420, 76.909147);
  final Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  @override
  void initState() {
    BlocProvider.of<EventBloc>(context).add(GetEvents());
    Location location = Location();
    location.getLocation().then((location) => currentLocation = location);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<EventBloc, EventState>(
        builder: (context, state) {
          if (state is EventLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is EventLoadedState) {
            for (int i = 0; i < state.eventsList.length; i++) {
              markers[MarkerId('${state.eventsList[i].name}')] = Marker(
                markerId: MarkerId('$i'),
                position: LatLng(state.eventsList[i].location.lat,
                    state.eventsList[i].location.lang),
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
                                  Text('${state.eventsList[i].author.name}',
                                      style: AppStyles.s18w700.copyWith(
                                          color: AppColors.mainBlack)),
                                  Text(
                                      '${state.eventsList[i].author.description}',
                                      style: AppStyles.s18w700.copyWith(
                                          color: AppColors.mainBlack)),
                                  Text('${state.eventsList[i].name}'),
                                  Text('${state.eventsList[i].description}'),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ParticipantsScreen(
                                                        members: state
                                                            .eventsList[i]
                                                            .members)));
                                      },
                                      child: Text(
                                          '${state.eventsList[i].members.length} ${AppLocalizations.of(context)?.membersWillAttend}')),
                                  ElevatedButton(
                                      onPressed: () {
                                        BlocProvider.of<EventBloc>(context).add(
                                            GoEvents(
                                                id: state.eventsList[i].id
                                                    .toString()));
                                        BlocProvider.of<EventBloc>(context)
                                            .add(GetEvents());
                                      },
                                      child: Text(
                                          '${AppLocalizations.of(context)?.attendToEvent}')),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              );
            }
            return GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: startLocation,
                  zoom: 14.5,
                ),
                markers: Set<Marker>.of(markers.values));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
