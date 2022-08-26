import 'package:ecommerce_app/common/styles/app_colors.dart';
import 'package:ecommerce_app/models/seller_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoView extends StatefulWidget {
  const PhotoView({Key? key}) : super(key: key);

  @override
  State<PhotoView> createState() => _PhotoViewState();
}

class _PhotoViewState extends State<PhotoView> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: 0, viewportFraction: 0.6);
    final seller = context.read<SellerModel>();

    return Expanded(
      child: PageView.builder(
        controller: controller,
        onPageChanged: (index) => setState(() {
          currentPage = index;
        }),
        itemCount: seller.images.length,
        itemBuilder: (context, index) {
          final imageUrl = seller.images[index];
          final scale = currentPage == index ? 1.0 : 0.8;

          return TweenAnimationBuilder(
            duration: const Duration(milliseconds: 300),
            tween: Tween(begin: scale, end: scale),
            curve: Curves.ease,
            child: _PhotoItem(imageUrl: imageUrl),
            builder: (context, double value, child) {
              return Transform.scale(
                scale: value,
                child: child,
              );
            },
          );
        },
      ),
    );
  }
}

class _PhotoItem extends StatelessWidget {
  const _PhotoItem({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(blurRadius: 20, offset: Offset(0, 10), color: AppColors.shadowPhoto),
        ],
      ),
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.only(top: 20, bottom: 14),
      padding: const EdgeInsets.all(8),
      child: Image.network(
        imageUrl,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
