import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_event.dart';

class TextSearchBar extends StatelessWidget {
  const TextSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border.all(
          width: 1.5,
          color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
        ),
        borderRadius: BorderRadius.circular(13),
      ),
      child: TextField(
        onChanged: (searchText) => context.read<ListingBloc>().add(
          ListingSearchEvent(searchText),
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(10),
          prefixIcon: const Icon(
            Icons.search,
          ),
          hintText: S.of(context).searchInstrument,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
