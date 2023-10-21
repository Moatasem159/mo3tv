import 'package:flutter/material.dart';
class MediaIconButton extends StatefulWidget {
  final Widget icon;
  final VoidCallback onTap;
  const MediaIconButton({super.key, required this.icon, required this.onTap});
  @override
  State<MediaIconButton> createState() => _MediaIconButtonState();
}
class _MediaIconButtonState extends State<MediaIconButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.75).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );
    _scaleController.addStatusListener(_handleAnimationStatusChanged);
  }

  void _handleAnimationStatusChanged(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _scaleController.reverse();
    }
  }
  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
        _scaleController.forward(from: 0.0);
      },
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blueGrey[900],
        ),
        child: AnimatedBuilder(
          animation: _scaleController,
          builder: (BuildContext context, Widget? child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: child,
            );
          },
          child: widget.icon,
        ),
      ),
    );
  }
}

