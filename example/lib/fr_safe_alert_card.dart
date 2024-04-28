import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FRSafeAlertCard extends StatelessWidget {
  final String assetImage;
  final String alertTittle;
  final String alertDisOne;
  final String alertDisTwo;
  final List<Color> colors;
  final VoidCallback? onPressed;

  const FRSafeAlertCard({
    required this.assetImage,
    required this.alertTittle,
    required this.alertDisOne,
    required this.alertDisTwo,
    required this.colors,
    this.onPressed,
  });

  factory FRSafeAlertCard.safeCard() => const FRSafeAlertCard(
        assetImage: "",
        colors: [Colors.greenAccent, Colors.green],
        alertTittle: 'Stay safe!',
        alertDisOne: "All you buildings are safe.",
        alertDisTwo: 'Any incident will be shown in real-time.',
      );

  factory FRSafeAlertCard.redCard() => FRSafeAlertCard(
        assetImage: "",
        colors: const [Colors.redAccent, Colors.red],
        alertTittle: "event.eventLocation",
        alertDisOne: "event.eventTitle",
        alertDisTwo: "event.eventHappenedOn",
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: colors,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SizedBox(
                    width: 65,
                    height: 65,
                    child: Image.asset(
                      assetImage,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        alertTittle,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      SizedBox(height: 8),
                      if (alertDisOne.isNotEmpty) ...[
                        Text(
                          alertDisOne,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        SizedBox(height: 8),
                      ],
                      if (alertDisTwo.isNotEmpty) ...[
                        Text(
                          alertDisTwo,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
