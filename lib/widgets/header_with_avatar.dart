import 'package:flutter/material.dart';

class HeaderWithAvatar extends StatelessWidget {
  final String name;
  final double headerHeight;
  final double avatarSize;

  const HeaderWithAvatar({
    super.key,
    required this.name,
    required this.headerHeight,
    required this.avatarSize,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: headerHeight,
                color: Colors.red,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white,),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: headerHeight,
                color: const Color(0xFF004D61),
              ),
            ),
          ],
        ),
        Positioned(
          right: size.width * 0.25,
          child: SizedBox(
            width: avatarSize,
            height: avatarSize,
            child: Image.asset(
              'lib/assets/images/deliveryman.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.language, color: Colors.white),
          ),
        ),
      ],
    );
  }
} 
