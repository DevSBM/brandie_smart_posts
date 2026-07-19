import 'dart:async';

import 'package:brandie_smart_posts/core/utils/openLink.dart';
import 'package:brandie_smart_posts/features/smart_post/controllers/smart_post_controller.dart';
import 'package:brandie_smart_posts/features/smart_post/data/models/product.dart';
import 'package:brandie_smart_posts/features/smart_post/presentation/widgets/color_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.product,
    this.isActive = true,
    this.delay = const Duration(milliseconds: 1600),
    required this.ref,
  });
  final Product product;
  final bool isActive; // True only for the currently visible Reel.
  final Duration delay;

  final WidgetRef ref;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  late final Animation<double> fadeAnimation;
  late final Animation<Offset> slideAnimation;

  Timer? delayTimer;

  late final bool alreadyShown = widget.ref
      .read(smartPostControllerProvider)
      .shownProductIds
      .contains(widget.product.name);

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 550),
    );

    animationController.addListener(() {
      if (animationController.isCompleted) {
        widget.ref
            .read(smartPostControllerProvider.notifier)
            .addToShownProduct(widget.product.name);
      }
    });

    fadeAnimation = CurvedAnimation(
      parent: animationController,
      curve: const Interval(0, 0.8, curve: Curves.easeOut),
    );

    slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.28), end: Offset.zero).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.easeOutBack,
          ),
        );

    if (widget.isActive && !alreadyShown) {
      scheduleAnimation();
    }
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);

    final becameActive = widget.isActive && !oldWidget.isActive;
    final becameInactive = !widget.isActive && oldWidget.isActive;
    // final productChanged = widget.productId != oldWidget.productId;

    if (becameInactive) {
      resetAnimation();
      return;
    }

    // if (becameActive || productChanged)
    if (becameActive) {
      resetAnimation();

      if (widget.isActive) {
        scheduleAnimation();
      }
    }
  }

  void scheduleAnimation() {
    delayTimer?.cancel();
    delayTimer = Timer(widget.delay, () {
      if (!mounted || !widget.isActive) return;

      animationController.forward(from: 0);
    });
  }

  void resetAnimation() {
    delayTimer?.cancel();
    animationController.reset();
  }

  @override
  void dispose() {
    delayTimer?.cancel();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return alreadyShown
        ? GestureDetector(
            onTap: () {
              openLink(widget.product.productLink);
            },
            child: ProdCard(widget: widget),
          )
        : IgnorePointer(
            ignoring: widget.isActive,
            child: FadeTransition(
              opacity: fadeAnimation,
              child: SlideTransition(
                position: slideAnimation,
                child: ProdCard(widget: widget),
              ),
            ),
          );
  }
}

class ProdCard extends StatelessWidget {
  const ProdCard({super.key, required this.widget});

  final ProductCard widget;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.6,
      ),

      child: ColorContainer(
        isDark: false,
        borderRadius: 8,
        padding: EdgeInsetsGeometry.symmetric(vertical: 4, horizontal: 8),
        child: Row(
          children: [
            if (widget.product.imagePath != null)
              Container(
                width: 54,
                height: 54,
                margin: EdgeInsets.only(right: 10),
                child: Image.asset(widget.product.imagePath!, fit: BoxFit.fill),
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      widget.product.name,
                      softWrap: true,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.white,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "\$${widget.product.price}",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 2,
                        ),
                        margin: EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 0, 114, 91),
                        ),
                        child: Text(
                          "${widget.product.discountPercentage}% off",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
