import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_event.dart';

class TextSearchBar extends StatelessWidget {
  const TextSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(13),
      ),
      child: TextField(
        onChanged: (searchText) => context.read<ListingBloc>().add(
          ListingSearchEvent(searchText),
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(10),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          hintText: 'Search instrument',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
