import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Перерисовка дорожки слайдера без учета формы наложения
class RoundedRectWithoutOverlayRangeSliderTrackShape
    extends RoundedRectRangeSliderTrackShape {
  RoundedRectWithoutOverlayRangeSliderTrackShape();

  @override
  // ignore: long-parameter-list
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight!;

    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final trackRight = trackLeft + parentBox.size.width;
    final trackBottom = trackTop + trackHeight;

    // If the parentBox'size less than slider's size the trackRight will be less than trackLeft, so switch them.
    return Rect.fromLTRB(
      math.min(trackLeft, trackRight),
      trackTop,
      math.max(trackLeft, trackRight),
      trackBottom,
    );
  }
}
