import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/themes/font_themes.dart';
import '../../../core/values/colors.dart';
import '../../../data/enum/venue_category_enum.dart';
import '../controllers/all_venue_controller.dart';

class HeaderCategoryVenueBuilder extends GetView<AllVenueController> {
  const HeaderCategoryVenueBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Expanded(
              child: Text(
                controller.filteredVenues[0].category.toString(),
                style: smallText.copyWith(color: orange),
              ),
            ),
            Text(
              'Category',
              style: smallText,
            ),
            PopupMenuButton<VenueCategory>(
              icon: const Icon(
                Icons.expand_more,
              ),
              onSelected: controller.updateFilteredVenuesByCategory,
              itemBuilder: (context) => <PopupMenuItem<VenueCategory>>[
                const PopupMenuItem<VenueCategory>(
                  value: VenueCategory.footbal,
                  child: Text('Football'),
                ),
                const PopupMenuItem<VenueCategory>(
                  value: VenueCategory.futsal,
                  child: Text('Futsal'),
                ),
                const PopupMenuItem<VenueCategory>(
                  value: VenueCategory.basket,
                  child: Text('Basket'),
                ),
                const PopupMenuItem<VenueCategory>(
                  value: VenueCategory.miniSoccer,
                  child: Text('Mini Soccer'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
