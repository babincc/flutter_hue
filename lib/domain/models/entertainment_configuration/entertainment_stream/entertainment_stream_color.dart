import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hue/utils/color_converter.dart';

/// Represents a color that can be sent as a command to the bridge.
abstract class EntertainmentStreamColor {
  const EntertainmentStreamColor(this.colorMode);

  final ColorMode colorMode;

  /// Whether or not the given `brightness` is valid.
  ///
  /// The `brightness` must be greater than or equal to `0.0` and less than or
  /// equal to `1.0`.
  static bool isValidBrightness(double brightness) =>
      brightness >= 0.0 && brightness <= 1.0;

  /// The error message that is shown when the brightness is invalid.
  static const String invalidBrightnessMessage =
      'brightness must be greater than or equal to 0 and less than or equal to '
      '1';

  /// Whether or not this color would turn the lights off.
  bool get isOff;

  /// Whether or not this color would not turn the lights off.
  bool get isNotOff => !isOff;

  /// Returns a copy of this object.
  EntertainmentStreamColor copy();

  /// Returns a copy of this object with its field values replaced by the ones
  /// provided to this method.
  EntertainmentStreamColor copyWith();

  /// Converts this color to the given `colorMode`.
  EntertainmentStreamColor to(ColorMode colorMode, [double? brightness]);

  /// {@template lerp}
  /// Linearly interpolate between two colors.
  ///
  /// The `t` parameter is the interpolation value. It must be between `0.0` and
  /// `1.0`.
  /// {@endtemplate}
  ///
  /// If `a` and `b` are the same [Type], the result will be the same [Type]. If
  /// `a` and `b` are different [Type]s, the result will be a [ColorXy].
  static EntertainmentStreamColor lerp(
    EntertainmentStreamColor a,
    EntertainmentStreamColor b,
    double t,
  ) {
    if (a is ColorXy && b is ColorXy) {
      return ColorXy.lerp(a, b, t);
    }

    // ignore: deprecated_member_use_from_same_package
    if (a is ColorRgb && b is ColorRgb) {
      // ignore: deprecated_member_use_from_same_package
      return ColorRgb.lerp(a, b, t);
    }

    if (a is ColorRgbNormalized && b is ColorRgbNormalized) {
      return ColorRgbNormalized.lerp(a, b, t);
    }

    final ColorXy aXy;
    if (a is ColorXy) {
      aXy = a;
    } else {
      aXy = a.to(ColorMode.xy) as ColorXy;
    }

    final ColorXy bXy;
    if (b is ColorXy) {
      bXy = b;
    } else {
      bXy = b.to(ColorMode.xy) as ColorXy;
    }

    return ColorXy.lerp(aXy, bXy, t);
  }
}

/// A class representing a color in the CIE 1931 color space.
class ColorXy extends EntertainmentStreamColor {
  /// Creates a new [ColorXy] instance from the given `x`, `y`, and `brightness`
  /// values (0.0-1.0).
  const ColorXy(this.x, this.y, this.brightness)
      : assert(
          x >= 0.0 && x <= 1.0,
          'x must be greater than or equal to 0 and less than or equal to 1',
        ),
        assert(
          y >= 0.0 && y <= 1.0,
          'y must be greater than or equal to 0 and less than or equal to 1',
        ),
        assert(
          x + y <= 1.0,
          'x + y must be less than or equal to 1',
        ),
        assert(
          brightness >= 0.0 && brightness <= 1.0,
          EntertainmentStreamColor.invalidBrightnessMessage,
        ),
        super(ColorMode.xy);

  /// Creates a new [ColorXy] instance from the given `r`, `g`, and `b` values
  /// (0-255).
  ///
  /// The `brightness` parameter is the brightness (0.0-1.0) of the color. If
  /// not provided, it defaults to the calculated brightness of the color. Note,
  /// this is typically a bit dim.
  @Deprecated('Use fromRgbNormalized instead')
  factory ColorXy.fromRgb(int r, int g, int b, [double? brightness]) {
    return ColorXy.fromRgbNormalized(
      r / 255.0,
      g / 255.0,
      b / 255.0,
      brightness,
    );
  }

  /// Creates a new [ColorXy] instance from the given `r`, `g`, and `b` values
  /// (0.0-1.0).
  ///
  /// The `brightness` parameter is the brightness (0.0-1.0) of the color. If
  /// not provided, it defaults to the calculated brightness of the color. Note,
  /// this is typically a bit dim.
  factory ColorXy.fromRgbNormalized(
    double r,
    double g,
    double b, [
    double? brightness,
  ]) {
    if (brightness != null) {
      assert(
        EntertainmentStreamColor.isValidBrightness(brightness),
        EntertainmentStreamColor.invalidBrightnessMessage,
      );
    }

    final List<double> xyList = ColorConverter.rgb2xy2(r, g, b);

    return ColorXy(xyList[0], xyList[1], brightness ?? xyList[2]);
  }

  /// Creates a new [ColorXy] instance from the given `color`.
  ///
  /// The `brightness` parameter is the brightness (0.0-1.0) of the color. If
  /// not provided, it defaults to whatever is calculated from `color`. Note,
  /// this is usually a bit dim.
  factory ColorXy.fromColor(Color color, [double? brightness]) {
    final ColorXy toReturn = color.toColorXy();

    if (brightness == null) return toReturn;

    return toReturn.copyWith(brightness: brightness);
  }

  /// The x value of the color (0.0-1.0).
  final double x;

  /// The y value of the color (0.0-1.0).
  final double y;

  /// The brightness of the color (0.0-1.0).
  final double brightness;

  @override
  bool get isOff => x == 0.0 && y == 0.0 && brightness == 0.0;

  @override
  ColorXy copy() => copyWith();

  @override
  ColorXy copyWith({
    double? x,
    double? y,
    double? brightness,
  }) =>
      ColorXy(
        x ?? this.x,
        y ?? this.y,
        brightness ?? this.brightness,
      );

  @override
  EntertainmentStreamColor to(ColorMode colorMode, [double? brightness]) {
    switch (colorMode) {
      case ColorMode.xy:
        return copyWith(brightness: brightness);
      // ignore: deprecated_member_use_from_same_package
      case ColorMode.rgb:
        // ignore: deprecated_member_use_from_same_package
        return toRgb(brightness);
      case ColorMode.rgbNormalized:
        return toRgbNormalized(brightness);
    }
  }

  /// Converts this color to an RGB color.
  ///
  /// The `brightness` parameter is the brightness (0.0-1.0) of the color. If
  /// not provided, it defaults to the [brightness] of this XY color.
  @Deprecated('Use toRgbNormalized instead')
  ColorRgb toRgb([double? brightness]) =>
      ColorRgb.fromXy(x, y, brightness ?? this.brightness);

  /// Converts this color to a normalized RGB color.
  ///
  /// The `brightness` parameter is the brightness (0.0-1.0) of the color. If
  /// not provided, it defaults to the [brightness] of this XY color.
  ColorRgbNormalized toRgbNormalized([double? brightness]) =>
      ColorRgbNormalized.fromXy(x, y, brightness ?? this.brightness);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    if (other.runtimeType != runtimeType) return false;

    return other is ColorXy &&
        identical(other.x, x) &&
        identical(other.y, y) &&
        identical(other.brightness, brightness);
  }

  @override
  int get hashCode => Object.hash(
        x,
        y,
        brightness,
      );

  @override
  String toString() =>
      'Instance of ColorXy: x=$x, y=$y, brightness=$brightness';

  /// {@macro lerp}
  static ColorXy lerp(
    ColorXy a,
    ColorXy b,
    double t,
  ) {
    final double x = clampDouble(
      a.x + (b.x - a.x) * t,
      0.0,
      1.0,
    );
    final double y = clampDouble(
      a.y + (b.y - a.y) * t,
      0.0,
      1.0,
    );
    final double brightness = clampDouble(
      a.brightness + (b.brightness - a.brightness) * t,
      0.0,
      1.0,
    );

    return ColorXy(x, y, brightness);
  }
}

/// A class representing a color in the RGB color space.
@Deprecated('Use ColorRgbNormalized instead')
class ColorRgb extends EntertainmentStreamColor {
  /// Creates a new [ColorRgb] instance from the given `r`, `g`, and `b` values
  /// (0-255).
  const ColorRgb(this.r, this.g, this.b)
      : assert(
          r >= 0 && r <= 255,
          'r must be greater than or equal to 0 and less than or equal to 255',
        ),
        assert(
          g >= 0 && g <= 255,
          'g must be greater than or equal to 0 and less than or equal to 255',
        ),
        assert(
          b >= 0 && b <= 255,
          'b must be greater than or equal to 0 and less than or equal to 255',
        ),
        // ignore: deprecated_member_use_from_same_package
        super(ColorMode.rgb);

  /// Creates a new [ColorRgb] instance from the given `x` and `y` values
  /// (0.0-1.0).
  ///
  /// The `brightness` parameter is the brightness (0.0-1.0) of the color. If
  /// not provided, it defaults to `1.0`.
  factory ColorRgb.fromXy(double x, double y, [double? brightness]) {
    if (brightness != null) {
      assert(
        EntertainmentStreamColor.isValidBrightness(brightness),
        EntertainmentStreamColor.invalidBrightnessMessage,
      );
    }

    final List<double> rgbList =
        ColorConverter.xy2rgb2(x, y, brightness ?? 1.0);

    return ColorRgb(
      (rgbList[0] * 255).round(),
      (rgbList[1] * 255).round(),
      (rgbList[2] * 255).round(),
    );
  }

  /// Creates a new [ColorRgb] instance from the given normalized `r`, `g`, and
  /// `b` values (0.0-1.0).
  factory ColorRgb.fromRgbNormalized(double r, double g, double b) {
    return ColorRgb(
      (r * 255).round(),
      (g * 255).round(),
      (b * 255).round(),
    );
  }

  /// Creates a new [ColorRgb] instance from the given `color`.
  factory ColorRgb.fromColor(Color color) => color.toColorRgb();

  /// The red value of the color (0-255).
  final int r;

  /// The green value of the color (0-255).
  final int g;

  /// The blue value of the color (0-255).
  final int b;

  @override
  bool get isOff => r == 0 && g == 0 && b == 0;

  @override
  ColorRgb copy() => copyWith();

  @override
  ColorRgb copyWith({
    int? r,
    int? g,
    int? b,
  }) =>
      ColorRgb(
        r ?? this.r,
        g ?? this.g,
        b ?? this.b,
      );

  @override
  EntertainmentStreamColor to(ColorMode colorMode, [double? brightness]) {
    switch (colorMode) {
      case ColorMode.xy:
        return toXy(brightness);
      // ignore: deprecated_member_use_from_same_package
      case ColorMode.rgb:
        if (brightness == null) return copy();
        return toXy(brightness).toRgb();
      case ColorMode.rgbNormalized:
        return toRgbNormalized(brightness);
    }
  }

  /// Converts this color to an XY color.
  ///
  /// The `brightness` parameter is the brightness (0.0-1.0) of the color. If
  /// not provided, it defaults to the calculated brightness of the color. Note,
  /// this is typically a bit dim.
  ColorXy toXy([double? brightness]) => ColorXy.fromRgb(r, g, b, brightness);

  /// Converts this color to a normalized RGB color.
  ///
  /// The `brightness` parameter is the brightness (0.0-1.0) of the color. If
  /// not provided, it defaults to the calculated brightness of the color. Note,
  /// this is typically a bit dim.
  ColorRgbNormalized toRgbNormalized([double? brightness]) =>
      ColorXy.fromRgb(r, g, b, brightness).toRgbNormalized();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    if (other.runtimeType != runtimeType) return false;

    return other is ColorRgb &&
        identical(other.r, r) &&
        identical(other.g, g) &&
        identical(other.b, b);
  }

  @override
  int get hashCode => Object.hash(
        r,
        g,
        b,
      );

  @override
  String toString() => 'Instance of ColorRgb: r=$r, g=$g, b=$b';

  /// {@macro lerp}
  static ColorRgb lerp(
    ColorRgb a,
    ColorRgb b,
    double t,
  ) {
    final double red = (a.r + (b.r - a.r) * t)
        .clamp(
          0.0,
          255.0,
        )
        .toDouble();
    final double green = (a.g + (b.g - a.g) * t)
        .clamp(
          0.0,
          255.0,
        )
        .toDouble();
    final double blue = (a.b + (b.b - a.b) * t)
        .clamp(
          0.0,
          255.0,
        )
        .toDouble();

    return ColorRgb(red.round(), green.round(), blue.round());
  }
}

/// A class representing a color in the normalized RGB color space.
class ColorRgbNormalized extends EntertainmentStreamColor {
  /// Creates a new [ColorRgbNormalized] instance from the given `r`, `g`, and
  /// `b` values (0.0-1.0).
  const ColorRgbNormalized(this.r, this.g, this.b)
      : assert(
          r >= 0 && r <= 255,
          'r must be greater than or equal to 0 and less than or equal to 255',
        ),
        assert(
          g >= 0 && g <= 255,
          'g must be greater than or equal to 0 and less than or equal to 255',
        ),
        assert(
          b >= 0 && b <= 255,
          'b must be greater than or equal to 0 and less than or equal to 255',
        ),
        // ignore: deprecated_member_use_from_same_package
        super(ColorMode.rgb);

  /// Creates a new [ColorRgbNormalized] instance from the given `x` and `y`
  /// values (0.0-1.0).
  ///
  /// The `brightness` parameter is the brightness (0.0-1.0) of the color. If
  /// not provided, it defaults to `1.0`.
  factory ColorRgbNormalized.fromXy(double x, double y, [double? brightness]) {
    if (brightness != null) {
      assert(
        EntertainmentStreamColor.isValidBrightness(brightness),
        EntertainmentStreamColor.invalidBrightnessMessage,
      );
    }

    final List<double> rgbList =
        ColorConverter.xy2rgb2(x, y, brightness ?? 1.0);

    return ColorRgbNormalized(rgbList[0], rgbList[1], rgbList[2]);
  }

  /// Creates a new [ColorRgbNormalized] instance from the given normalized `r`,
  /// `g`, and `b` values (0-255).
  @Deprecated('Use default constructor instead')
  factory ColorRgbNormalized.fromRgb(int r, int g, int b) {
    return ColorRgbNormalized(r / 255.0, g / 255.0, b / 255.0);
  }

  /// Creates a new [ColorRgbNormalized] instance from the given `color`.
  factory ColorRgbNormalized.fromColor(Color color) =>
      color.toColorRgbNormalized();

  /// The red value of the color (0.0-1.0).
  final double r;

  /// The green value of the color (0.0-1.0).
  final double g;

  /// The blue value of the color (0.0-1.0).
  final double b;

  @override
  bool get isOff => r == 0.0 && g == 0.0 && b == 0.0;

  @override
  ColorRgbNormalized copy() => copyWith();

  @override
  ColorRgbNormalized copyWith({
    double? r,
    double? g,
    double? b,
  }) =>
      ColorRgbNormalized(
        r ?? this.r,
        g ?? this.g,
        b ?? this.b,
      );

  @override
  EntertainmentStreamColor to(ColorMode colorMode, [double? brightness]) {
    switch (colorMode) {
      case ColorMode.xy:
        return toXy(brightness);
      // ignore: deprecated_member_use_from_same_package
      case ColorMode.rgb:
        // ignore: deprecated_member_use_from_same_package
        return toRgb(brightness);
      case ColorMode.rgbNormalized:
        if (brightness == null) return copy();
        return toXy(brightness).toRgbNormalized();
    }
  }

  /// Converts this color to an XY color.
  ///
  /// The `brightness` parameter is the brightness (0.0-1.0) of the color. If
  /// not provided, it defaults to the calculated brightness of the color. Note,
  /// this is typically a bit dim.
  ColorXy toXy([double? brightness]) =>
      ColorXy.fromRgbNormalized(r, g, b, brightness);

  /// Converts this color to an RGB color.
  ///
  /// The `brightness` parameter is the brightness (0.0-1.0) of the color. If
  /// not provided, it defaults to the calculated brightness of the color. Note,
  /// this is typically a bit dim.
  @Deprecated('ColorRgb is deprecated, keep using ColorRgbNormalized')
  ColorRgb toRgb([double? brightness]) =>
      ColorXy.fromRgbNormalized(r, g, b, brightness).toRgb();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    if (other.runtimeType != runtimeType) return false;

    return other is ColorRgbNormalized &&
        identical(other.r, r) &&
        identical(other.g, g) &&
        identical(other.b, b);
  }

  @override
  int get hashCode => Object.hash(
        r,
        g,
        b,
      );

  @override
  String toString() => 'Instance of ColorRgbNormalized: r=$r, g=$g, b=$b';

  /// {@macro lerp}
  static ColorRgbNormalized lerp(
    ColorRgbNormalized a,
    ColorRgbNormalized b,
    double t,
  ) {
    final double red = (a.r + (b.r - a.r) * t)
        .clamp(
          0.0,
          1.0,
        )
        .toDouble();
    final double green = (a.g + (b.g - a.g) * t)
        .clamp(
          0.0,
          1.0,
        )
        .toDouble();
    final double blue = (a.b + (b.b - a.b) * t)
        .clamp(
          0.0,
          1.0,
        )
        .toDouble();

    return ColorRgbNormalized(red, green, blue);
  }
}

/// An enum representing the color mode of the entertainment stream.
enum ColorMode {
  /// The color mode is XY and uses the CIE 1931 color space.
  xy,

  /// The color mode is RGB and uses the RGB color space.
  @Deprecated('Use rgbNormalized instead')
  rgb,

  /// The color mode is normalized RGB and uses the normalized RGB color space.
  rgbNormalized;
}
