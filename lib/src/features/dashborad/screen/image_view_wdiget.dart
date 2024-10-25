import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/app_defaluts.dart';

class ImageViewWdiget extends ConsumerStatefulWidget {
    const ImageViewWdiget({super.key});

    @override
    ConsumerState createState() => _ImageViewWdigetState();
}

class _ImageViewWdigetState extends ConsumerState<ImageViewWdiget> {
    @override
    Widget build(BuildContext context) {
        return Stack(
            children: [
                ClipRRect(
                    borderRadius:
                    BorderRadius.all(Radius.circular(AppDefaults.borderRadius)),
                    child: Image.asset(
                        'assets/images/dashboard/dashboard_6.jpg',
                        fit: BoxFit.cover,
                    ),
                ),
                Positioned(
                    top: 20,
                    left: 20,
                    child: Text(
                        'Hello World!',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                        ),
                    ),
                ),
            ],
        );
    }
}
