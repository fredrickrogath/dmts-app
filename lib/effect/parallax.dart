import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BidhaaList extends StatefulWidget {
  BidhaaList({
    Key? key,
    required this.imageUrl,
    required this.kuuzwa,
    required this.idadi,
  }) : super(key: key);

  final String imageUrl;
  final int kuuzwa;
  final String idadi;

  @override
  State<BidhaaList> createState() => _BidhaaListState();
}

class _BidhaaListState extends State<BidhaaList>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final GlobalKey _backgroundImageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
      child: AspectRatio(
        aspectRatio: 16 / 6,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              _buildParallaxBackground(context),
              _buildGradient(),
              // _buildButtonYaKuuza(),
              // _buildBei(),
              // _badiliko(),
              // _name(),
              _idadiYaBidhaa(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return Flow(
      delegate: ParallaxFlowDelegate(
        scrollable: Scrollable.of(context)!,
        listItemContext: context,
        backgroundImageKey: _backgroundImageKey,
      ),
      children: [
        Image.asset(
          widget.imageUrl,
          key: _backgroundImageKey,
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.6, 0.95],
          ),
        ),
      ),
    );
  }

  // Widget _buildBei() {
  //   return Positioned(
  //     child: Container(
  //       margin: const EdgeInsets.only(top: 5.0, left: 5.0),
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(20.0),
  //         color: Colors.purple[500],
  //       ),
  //       child: Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Text(
  //           'Tsh ${widget.kuuzwa}',
  //           style: const TextStyle(
  //               fontSize: 20.0,
  //               fontFamily: 'Tangerine',
  //               color: Colors.black,
  //               fontWeight: FontWeight.w900),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _badiliko() {
  //   return Positioned(
  //     right: 5.0,
  //     child: Container(
  //       margin: const EdgeInsets.only(top: 5.0, left: 5.0),
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(20.0),
  //         color: Colors.purple[500],
  //       ),
  //       child: Material(
  //         color: Colors.white.withOpacity(0.0),
  //         child: InkWell(
  //           onTap: () {
  //             print("Mabadiliko");
  //           },
  //           child: Padding(
  //             padding: EdgeInsets.all(8.0),
  //             child: Text(
  //               'Tsh ${widget.kuuzwa}',
  //               style: const TextStyle(
  //                   fontSize: 21.0,
  //                   fontFamily: 'Tangerine',
  //                   color: Colors.black,
  //                   fontWeight: FontWeight.w900,
  //                   decoration: TextDecoration.lineThrough),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildButtonYaKuuza() {
  //   return const Positioned(
  //       bottom: 5.0, right: 1.0, child: SizedBox(height: 45.0, child: uza()));
  // }

  // Widget _name() {
  //   return Center(
  //       child: ColorizeAnimatedTextKit(
  //     repeatForever: true,
  //     text: const [
  //       "Karibu",
  //       "Adela Shop",
  //     ],
  //     textStyle: TextStyle(
  //         fontSize: 30.0, color: Colors.orange[200], fontFamily: 'Tangerine'),
  //     colors: const [
  //       Color(0xFFFFCC80),
  //       Colors.purple,
  //       Color(0xFFFFCC80),
  //     ],
  //     textAlign: TextAlign.start,
  //   ));
  // }

  Widget _idadiYaBidhaa() {
    return Positioned(
        bottom: 0.0,
        left: 7.0,
        child: SizedBox(
          height: 45.0,
          child: Text(
            widget.idadi,
            style: const TextStyle(
                fontWeight: FontWeight.w900,
                // color: Colors.black,
                fontFamily: 'Tangerine',
                fontSize: 25.0),
          ),
        ));
  }
}

class ParallaxFlowDelegate extends FlowDelegate {
  ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
      width: constraints.maxWidth,
    );
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    // Calculate the position of this list item within the viewport.
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
        listItemBox.size.centerLeft(Offset.zero),
        ancestor: scrollableBox);

    // Determine the percent position of this list item within the
    // scrollable area.
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction =
        (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);

    // Calculate the vertical alignment of the background
    // based on the scroll percent.
    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject() as RenderBox)
            .size;
    final listItemSize = context.size;
    final childRect =
        verticalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);

    // Paint the background.
    context.paintChild(
      0,
      transform:
          Transform.translate(offset: Offset(0.0, childRect.top)).transform,
    );
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}

class Parallax extends SingleChildRenderObjectWidget {
  Parallax({
    required Widget background,
  }) : super(child: background);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderParallax(scrollable: Scrollable.of(context)!);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderParallax renderObject) {
    renderObject.scrollable = Scrollable.of(context)!;
  }
}

class ParallaxParentData extends ContainerBoxParentData<RenderBox> {}

class RenderParallax extends RenderBox
    with RenderObjectWithChildMixin<RenderBox>, RenderProxyBoxMixin {
  RenderParallax({
    required ScrollableState scrollable,
  }) : _scrollable = scrollable;

  ScrollableState _scrollable;

  ScrollableState get scrollable => _scrollable;

  set scrollable(ScrollableState value) {
    if (value != _scrollable) {
      if (attached) {
        _scrollable.position.removeListener(markNeedsLayout);
      }
      _scrollable = value;
      if (attached) {
        _scrollable.position.addListener(markNeedsLayout);
      }
    }
  }

  @override
  void attach(covariant PipelineOwner owner) {
    super.attach(owner);
    _scrollable.position.addListener(markNeedsLayout);
  }

  @override
  void detach() {
    _scrollable.position.removeListener(markNeedsLayout);
    super.detach();
  }

  @override
  void setupParentData(covariant RenderObject child) {
    if (child.parentData is! ParallaxParentData) {
      child.parentData = ParallaxParentData();
    }
  }

  @override
  void performLayout() {
    size = constraints.biggest;

    // Force the background to take up all available width
    // and then scale its height based on the image's aspect ratio.
    final background = child!;
    final backgroundImageConstraints =
        BoxConstraints.tightFor(width: size.width);
    background.layout(backgroundImageConstraints, parentUsesSize: true);

    // Set the background's local offset, which is zero.
    (background.parentData as ParallaxParentData).offset = Offset.zero;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    // Get the size of the scrollable area.
    final viewportDimension = scrollable.position.viewportDimension;

    // Calculate the global position of this list item.
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final backgroundOffset =
        localToGlobal(size.centerLeft(Offset.zero), ancestor: scrollableBox);

    // Determine the percent position of this list item within the
    // scrollable area.
    final scrollFraction =
        (backgroundOffset.dy / viewportDimension).clamp(0.0, 1.0);

    // Calculate the vertical alignment of the background
    // based on the scroll percent.
    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final background = child!;
    final backgroundSize = background.size;
    final listItemSize = size;
    final childRect =
        verticalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);

    // Paint the background.
    context.paintChild(
        background,
        (background.parentData as ParallaxParentData).offset +
            offset +
            Offset(0.0, childRect.top));
  }
}
