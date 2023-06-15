import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class InterestsWidget extends StatefulWidget {
  const InterestsWidget({Key? key}) : super(key: key);

  @override
  State<InterestsWidget> createState() => _InterestsWidgetState();
}

class _InterestsWidgetState extends State<InterestsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${AppLocalizations.of(context)?.mightBeInterested}'),
      ],
    );
  }
}
