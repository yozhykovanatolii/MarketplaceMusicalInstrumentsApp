import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketplace_musical_instruments_app/core/helper/ui_helper.dart';
import 'package:marketplace_musical_instruments_app/core/navigation/app_routes.dart';
import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';
import 'package:marketplace_musical_instruments_app/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/booking_save/booking_save_cubit.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/booking_save/booking_save_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/widget/about_section.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/widget/calendar_section.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/widget/category_and_average_rating_section.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/widget/photo_listing_section.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/widget/price_listing_section.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/widget/review_section/review_section.dart';

class ListingDetailPage extends StatelessWidget {
  final ListingModel listing;

  const ListingDetailPage({
    super.key,
    required this.listing,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AppBloc, AppState>(
          listener: (context, state) {
            if (state is UserUnauthenticatedState) {
              UiHelper.showSnackBar(
                context: context,
                message: state.errorMessage,
                isErrorSnackBar: true,
              );
              context.go(AppRoutes.loginPage);
            }
          },
        ),
        BlocListener<BookingSaveCubit, BookingSaveState>(
          listener: (BuildContext context, BookingSaveState state) {
            final formStatus = state.formStatus;
            if (state.formStatus == FormStatus.success) {
              UiHelper.showSnackBar(
                context: context,
                message: S
                    .of(context)
                    .theTransactionWasSuccessfulYourBookingRequestHasBeenSent,
              );
            }
            if (formStatus == FormStatus.failure) {
              UiHelper.showSnackBar(
                context: context,
                message: state.errorMessage,
                isErrorSnackBar: true,
              );
            }
          },
        ),
      ],
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PhotoListingSection(
                    listingId: listing.id,
                    photos: listing.photos,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CategoryAndAverageRatingSection(
                          listingCategory: listing.category,
                          averageRating: listing.averageRating,
                          reviewerCounter: listing.reviewerCount,
                        ),
                        Text(
                          listing.title,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  TabBar(
                    tabs: [
                      Tab(text: S.of(context).about),
                      Tab(text: S.of(context).calendar),
                      Tab(text: S.of(context).review),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: TabBarView(
                      children: [
                        AboutSection(
                          location: listing.location,
                          listingDescription: listing.description,
                          authorAvatar: listing.authorAvatar,
                          authorFullName: listing.authorFullName,
                          authorPhoneNumber: listing.authorPhoneNumber,
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
