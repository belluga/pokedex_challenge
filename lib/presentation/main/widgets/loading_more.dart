import 'package:flutter/material.dart';
import 'package:stream_value/core/stream_value.dart';
import 'package:stream_value/core/stream_value_builder.dart';

class LoadingMore extends StatelessWidget {

  final StreamValue<bool> loadingStreamValue;

  const LoadingMore({super.key, required this.loadingStreamValue});

  @override
  Widget build(BuildContext context) {
    return StreamValueBuilder<bool>(
      streamValue: loadingStreamValue,
      builder: (context, snapshot) {
        final bool _isLoadingNextPage = snapshot;
        if (_isLoadingNextPage == false) {
          return const SizedBox.shrink();
        }

        return const SizedBox(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
