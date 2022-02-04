import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_app/presentation/helper/space_widget.dart';
import 'package:photo_app/presentation/ui/screens/new_list.dart';
import 'package:photo_app/presentation/ui/widgets/photo_list.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Space(40),
              UnsplashTitle(),
              Space(30),
              PhotoFeeds()
              // PhotoList()
            ],
          ),
        ));
  }
}

class UnsplashTitle extends StatelessWidget {
  const UnsplashTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Unsplash',
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.w600)),
          SizedBox(
            height: 10,
          ),
          Text(
              'Explore the world through collections\nof beautiful HD pictures',
              style: TextStyle(
                  height: 1.5,
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}
