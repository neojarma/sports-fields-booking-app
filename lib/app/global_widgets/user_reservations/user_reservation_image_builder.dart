import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserReservationImageBuilder extends StatelessWidget {
  const UserReservationImageBuilder({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: url,
        placeholder: (_, __) => const SizedBox(),
      ),
    );
  }
}
