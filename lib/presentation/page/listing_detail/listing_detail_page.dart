import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/util/snack_bar_util.dart';
import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/booking_save/booking_save_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/booking_save/booking_save_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/widget/about_section.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/widget/calendar_section.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/widget/category_and_average_rating_section.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/widget/photo_listing_section.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/widget/price_listing_section.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/widget/review_section.dart';

class ListingDetailPage extends StatelessWidget {
  final ListingModel listing;

  const ListingDetailPage({
    super.key,
    required this.listing,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingSaveBloc, BookingSaveState>(
      listenWhen: (previous, current) {
        return previous.errorMessage != current.errorMessage;
      },
      listener: (BuildContext context, BookingSaveState state) {
        if (state.errorMessage.isNotEmpty) {
          SnackBarUtil.showSnackBar(
            context,
            state.errorMessage,
            Icons.error,
            0xFFFFEEEF,
            0xFFE77282,
          );
        }
      },
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PhotoListingSection(
                    photos: listing.photos,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      spacing: 10,
                      children: [
                        CategoryAndAverageRatingSection(
                          listingCategory: listing.category,
                          averageRating: listing.averageRating,
                          reviewerCounter: listing.reviewerCount,
                        ),
                        Text(
                          'Prepared Hero Emergency Fire Blanket 303',
                          style: TextStyle(
                            fontSize: MediaQuery.textScalerOf(
                              context,
                            ).scale(22),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  TabBar(
                    indicatorColor: Colors.blue,
                    labelColor: Colors.blue,
                    indicatorWeight: 4,
                    labelStyle: TextStyle(
                      fontSize: MediaQuery.textScalerOf(context).scale(17),
                      fontWeight: FontWeight.w500,
                    ),
                    tabs: const [
                      Tab(text: 'About'),
                      Tab(text: 'Calendar'),
                      Tab(text: 'Review'),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: TabBarView(
                      children: [
                        AboutSection(
                          location: listing.location,
                        ),
                        CalendarSection(
                          listingId: listing.id,
                          startingPrice: listing.priceByHour,
                        ),
                        ReviewSection(listingId: listing.id),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: PriceListingSection(
            listing: listing,
          ),
        ),
      ),
    );
  }
}
