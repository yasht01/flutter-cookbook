import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:test_app/screens/first_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: const DraggableCard(),
      floatingActionButton: CircleAvatar(
        child: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const FirstPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const curve = Curves.easeOut;
                  final curveTween = CurveTween(curve: curve);

                  const begin = Offset(0, 1);
                  const end = Offset.zero;
                  final tween = Tween(begin: begin, end: end).chain(curveTween);
                  final offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
              ),
            );
          },
          icon: const Icon(Icons.splitscreen),
        ),
      ),
    );
  }
}

class DraggableCard extends StatefulWidget {
  const DraggableCard({
    Key? key,
  }) : super(key: key);

  @override
  State<DraggableCard> createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Alignment _alignment = Alignment.center;
  late Animation<Alignment> _alignmentAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _controller.addListener(() {
      setState(() {
        _alignment = _alignmentAnimation.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _runAnimation(Offset px_per_s, Size size) {
    _alignmentAnimation = _controller
        .drive(AlignmentTween(begin: _alignment, end: Alignment.center));

    const spring = SpringDescription(
      mass: 10,
      stiffness: 1,
      damping: 1,
    );

    final normalisedVelocity =
        Offset(px_per_s.dx / (size.width / 2), px_per_s.dy / (size.height / 2))
            .distance;

    final springSimulation =
        SpringSimulation(spring, 0, 1, -normalisedVelocity);

    _controller.animateWith(springSimulation);
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onPanDown: (details) {
        _controller.forward();
        // _controller.stop();
      },
      onPanUpdate: (details) {
        setState(() {
          _alignment += Alignment(details.delta.dx / (_screenSize.width / 2),
              details.delta.dy / (_screenSize.height / 2));
        });
      },
      onPanEnd: (details) {
        _runAnimation(details.velocity.pixelsPerSecond, _screenSize);
      },
      child: Align(
        alignment: _alignment,
        child: const Card(
          child: FlutterLogo(
            size: 100,
          ),
        ),
      ),
    );
  }
}
