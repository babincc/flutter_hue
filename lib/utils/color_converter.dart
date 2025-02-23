import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hue/domain/models/entertainment_configuration/entertainment_stream/entertainment_stream_color.dart';

/// A class for converting between color spaces.
class ColorConverter {
  /// Converts xy coordinates in the CIE 1931 color space to RGB (0-255) values.
  ///
  /// Returns a list of integers representing the RGB values. [r, g, b]
  @Deprecated('Use xy2rgb2 instead')
  static List<int> xy2rgb(double x, double y, [double brightness = 1.0]) {
    final List<double> rgb = xy2rgb2(x, y, brightness);

    return [
      (rgb[0] * 255).round(),
      (rgb[1] * 255).round(),
      (rgb[2] * 255).round(),
    ];
  }

  /// Converts xy coordinates in the CIE 1931 color space to normalized
  /// RGB (0.0-1.0) values.
  ///
  /// Returns a list of doubles representing the RGB values. [r, g, b]
  static List<double> xy2rgb2(double x, double y, [double brightness = 1.0]) {
    assert(x >= 0.0 && x <= 1.0,
        'x must be greater than or equal to 0 and less than or equal to 1');
    assert(y >= 0.0 && y <= 1.0,
        'y must be greater than or equal to 0 and less than or equal to 1');
    assert(x + y <= 1.0, 'x + y must be less than or equal to 1');
    assert(
        brightness >= 0.0 && brightness <= 1.0,
        'brightness must be greater than or equal to 0 and less than or equal '
        'to 1');

    final double z = 1.0 - x - y;
    final double Y = brightness;
    if (y == 0) y = 0.0001;
    final double X = (Y / y) * x;
    final double Z = (Y / y) * z;

    // sRGB D65 conversion
    double r = X * 1.656492 - Y * 0.354851 - Z * 0.255038;
    double g = -X * 0.707196 + Y * 1.655397 + Z * 0.036152;
    double b = X * 0.051713 - Y * 0.121364 + Z * 1.011530;

    // Apply reverse gamma correction.
    r = _reverseGammaCorrection(r);
    g = _reverseGammaCorrection(g);
    b = _reverseGammaCorrection(b);

    // If one of the values is greater than 1, the color is too saturated and
    // needs to be brought back down.
    if (r > b && r > g && r > 1.0) {
      g = g / r;
      b = b / r;
      r = 1.0;
    } else if (g > b && g > r && g > 1.0) {
      r = r / g;
      b = b / g;
      g = 1.0;
    } else if (b > r && b > g && b > 1.0) {
      r = r / b;
      g = g / b;
      b = 1.0;
    }

    // Make sure none of the values are less than 0 or greater than 1.
    r = r.clamp(0.0, 1.0);
    g = g.clamp(0.0, 1.0);
    b = b.clamp(0.0, 1.0);

    return [r, g, b];
  }

  /// Converts xy coordinates in the CIE 1931 color space to HSV.
  ///
  /// Returns a list of doubles representing the HSV values. [h, s, v]
  static List<double> xy2hsv(double x, double y, [double brightness = 1.0]) {
    assert(x >= 0.0 && x <= 1.0,
        'x must be greater than or equal to 0 and less than or equal to 1');
    assert(y >= 0.0 && y <= 1.0,
        'y must be greater than or equal to 0 and less than or equal to 1');
    assert(x + y <= 1.0, 'x + y must be less than or equal to 1');
    assert(
        brightness >= 0.0 && brightness <= 1.0,
        'brightness must be greater than or equal to 0 and less than or equal '
        'to 1');

    final List<double> rgb = xy2rgb2(x, y, brightness);
    return rgb2hsv2(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts xy coordinates in the CIE 1931 color space to a hex string.
  ///
  /// Returns a string representing the hex value. ffffffff
  static String xy2hex(double x, double y, [double brightness = 1.0]) {
    assert(x >= 0.0 && x <= 1.0,
        'x must be greater than or equal to 0 and less than or equal to 1');
    assert(y >= 0.0 && y <= 1.0,
        'y must be greater than or equal to 0 and less than or equal to 1');
    assert(x + y <= 1.0, 'x + y must be less than or equal to 1');
    assert(
        brightness >= 0.0 && brightness <= 1.0,
        'brightness must be greater than or equal to 0 and less than or equal '
        'to 1');

    final List<double> rgb = xy2rgb2(x, y, brightness);
    return rgb2hex2(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts xy coordinates in the CIE 1931 color space to HSL.
  ///
  /// Returns a list of doubles representing the HSL values. [h, s, l]
  static List<double> xy2hsl(double x, double y, [double brightness = 1.0]) {
    assert(x >= 0.0 && x <= 1.0,
        'x must be greater than or equal to 0 and less than or equal to 1');
    assert(y >= 0.0 && y <= 1.0,
        'y must be greater than or equal to 0 and less than or equal to 1');
    assert(x + y <= 1.0, 'x + y must be less than or equal to 1');
    assert(
        brightness >= 0.0 && brightness <= 1.0,
        'brightness must be greater than or equal to 0 and less than or equal '
        'to 1');

    final List<double> rgb = xy2rgb2(x, y, brightness);
    return rgb2hsl2(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts xy coordinates in the CIE 1931 color space to a Flutter Color.
  static Color xy2color(double x, double y, [double brightness = 1.0]) {
    assert(x >= 0.0 && x <= 1.0,
        'x must be greater than or equal to 0 and less than or equal to 1');
    assert(y >= 0.0 && y <= 1.0,
        'y must be greater than or equal to 0 and less than or equal to 1');
    assert(x + y <= 1.0, 'x + y must be less than or equal to 1');
    assert(
        brightness >= 0.0 && brightness <= 1.0,
        'brightness must be greater than or equal to 0 and less than or equal '
        'to 1');

    final List<double> rgb = xy2rgb2(x, y, brightness);
    return rgb2color2(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts xy coordinates in the CIE 1931 color space to an integer.
  static int xy2int(double x, double y, [double brightness = 1.0]) {
    assert(x >= 0.0 && x <= 1.0,
        'x must be greater than or equal to 0 and less than or equal to 1');
    assert(y >= 0.0 && y <= 1.0,
        'y must be greater than or equal to 0 and less than or equal to 1');
    assert(x + y <= 1.0, 'x + y must be less than or equal to 1');
    assert(
        brightness >= 0.0 && brightness <= 1.0,
        'brightness must be greater than or equal to 0 and less than or equal '
        'to 1');

    final List<double> rgb = xy2rgb2(x, y, brightness);
    return rgb2int2(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts xy coordinates in the CIE 1931 color space to a [ColorXy] object.
  static ColorXy xy2colorXy(double x, double y, [double brightness = 1.0]) {
    assert(x >= 0.0 && x <= 1.0,
        'x must be greater than or equal to 0 and less than or equal to 1');
    assert(y >= 0.0 && y <= 1.0,
        'y must be greater than or equal to 0 and less than or equal to 1');
    assert(x + y <= 1.0, 'x + y must be less than or equal to 1');
    assert(
        brightness >= 0.0 && brightness <= 1.0,
        'brightness must be greater than or equal to 0 and less than or equal '
        'to 1');

    return ColorXy(x, y, brightness);
  }

  /// Converts xy coordinates in the CIE 1931 color space to a [ColorRgb]
  /// object.
  @Deprecated('Use xy2colorRgbNormalized instead')
  static ColorRgb xy2colorRgb(double x, double y, [double brightness = 1.0]) {
    assert(x >= 0.0 && x <= 1.0,
        'x must be greater than or equal to 0 and less than or equal to 1');
    assert(y >= 0.0 && y <= 1.0,
        'y must be greater than or equal to 0 and less than or equal to 1');
    assert(x + y <= 1.0, 'x + y must be less than or equal to 1');
    assert(
        brightness >= 0.0 && brightness <= 1.0,
        'brightness must be greater than or equal to 0 and less than or equal '
        'to 1');

    return ColorRgb.fromXy(x, y, brightness);
  }

  /// Converts xy coordinates in the CIE 1931 color space to a
  /// [ColorRgbNormalized] object.
  static ColorRgbNormalized xy2colorRgbNormalized(
    double x,
    double y, [
    double brightness = 1.0,
  ]) {
    assert(x >= 0.0 && x <= 1.0,
        'x must be greater than or equal to 0 and less than or equal to 1');
    assert(y >= 0.0 && y <= 1.0,
        'y must be greater than or equal to 0 and less than or equal to 1');
    assert(x + y <= 1.0, 'x + y must be less than or equal to 1');
    assert(
        brightness >= 0.0 && brightness <= 1.0,
        'brightness must be greater than or equal to 0 and less than or equal '
        'to 1');

    return ColorRgbNormalized.fromXy(x, y, brightness);
  }

  /// Converts RGB (0-255) values to xy coordinates in the CIE 1931 color space.
  ///
  /// Returns a list of doubles representing the xy values. [x, y, brightness]
  @Deprecated('Use rgb2xy2 instead')
  static List<double> rgb2xy(int r, int g, int b) {
    assert(r >= 0 && r <= 255,
        'r must be greater than or equal to 0 and less than or equal to 255');
    assert(g >= 0 && g <= 255,
        'g must be greater than or equal to 0 and less than or equal to 255');
    assert(b >= 0 && b <= 255,
        'b must be greater than or equal to 0 and less than or equal to 255');

    if (r == 0 && g == 0 && b == 0) return [0.0, 0.0, 0.0];

    // Convert to a linear RGB color space.
    double R = r / 255.0;
    double G = g / 255.0;
    double B = b / 255.0;

    return rgb2xy2(R, G, B);
  }

  /// Converts normalized RGB (0.0-1.0) values to xy coordinates in the CIE 1931
  /// color space.
  ///
  /// Returns a list of doubles representing the xy values. [x, y, brightness]
  static List<double> rgb2xy2(double r, double g, double b) {
    assert(r >= 0.0 && r <= 1.0,
        'r must be greater than or equal to 0 and less than or equal to 1');
    assert(g >= 0.0 && g <= 1.0,
        'g must be greater than or equal to 0 and less than or equal to 1');
    assert(b >= 0.0 && b <= 1.0,
        'b must be greater than or equal to 0 and less than or equal to 1');

    if (r == 0.0 && g == 0.0 && b == 0.0) return [0.0, 0.0, 0.0];

    // Apply gamma correction.
    final double R = _gammaCorrection(r);
    final double G = _gammaCorrection(g);
    final double B = _gammaCorrection(b);

    // Convert to XYZ using the Wide RGB D65 conversion formula.
    final double X = R * 0.4124 + G * 0.3576 + B * 0.1805;
    double Y = R * 0.2126 + G * 0.7152 + B * 0.0722;
    final double Z = R * 0.0193 + G * 0.1192 + B * 0.9505;

    // Calculate the xy values from the XYZ values.
    double x = X / (X + Y + Z);
    double y = Y / (X + Y + Z);

    x = x.isNaN ? 0.0 : x;
    y = y.isNaN ? 0.0 : y;

    x = x.clamp(0.0, 1.0);
    y = y.clamp(0.0, 1.0);
    Y = Y.clamp(0.0, 1.0);

    if (x + y > 1.0) {
      double scale = 1.0 / (x + y);
      x *= scale;
      y *= scale;
    }

    return [x, y, Y];
  }

  /// Converts RGB (0-255) values to HSV values.
  ///
  /// Returns a list of doubles representing the HSV values. [h, s, v]
  @Deprecated('Use rgb2hsv2 instead')
  static List<double> rgb2hsv(int r, int g, int b) {
    assert(r >= 0 && r <= 255,
        'r must be greater than or equal to 0 and less than or equal to 255');
    assert(g >= 0 && g <= 255,
        'g must be greater than or equal to 0 and less than or equal to 255');
    assert(b >= 0 && b <= 255,
        'b must be greater than or equal to 0 and less than or equal to 255');

    final double R = r / 255.0;
    final double G = g / 255.0;
    final double B = b / 255.0;

    return rgb2hsv2(R, G, B);
  }

  /// Converts normalized RGB (0.0-1.0) values to HSV values.
  ///
  /// Returns a list of doubles representing the HSV values. [h, s, v]
  static List<double> rgb2hsv2(double r, double g, double b) {
    assert(r >= 0.0 && r <= 1.0,
        'r must be greater than or equal to 0 and less than or equal to 1');
    assert(g >= 0.0 && g <= 1.0,
        'g must be greater than or equal to 0 and less than or equal to 1');
    assert(b >= 0.0 && b <= 1.0,
        'b must be greater than or equal to 0 and less than or equal to 1');

    final double maximum = max(r, max(g, b));
    final double minimum = min(r, min(g, b));
    final double delta = maximum - minimum;

    double h = 0;
    double s = 0;
    double v = maximum;

    if (delta != 0) {
      s = delta / maximum;

      if (r == maximum) {
        h = (g - b) / delta;
      } else if (g == maximum) {
        h = 2 + (b - r) / delta;
      } else if (b == maximum) {
        h = 4 + (r - g) / delta;
      }

      h *= 60.0;

      if (h < 0.0) {
        h += 360.0;
      } else if (h > 360.0) {
        h -= 360.0;
      }
    }

    s = s.clamp(0.0, 1.0);
    v = v.clamp(0.0, 1.0);

    return [h, s, v];
  }

  /// Converts RGB (0-255) values to a hex string.
  ///
  /// Returns a string representing the hex value. ffffffff
  @Deprecated('Use rgb2hex2 instead')
  static String rgb2hex(int r, int g, int b) {
    assert(r >= 0 && r <= 255,
        'r must be greater than or equal to 0 and less than or equal to 255');
    assert(g >= 0 && g <= 255,
        'g must be greater than or equal to 0 and less than or equal to 255');
    assert(b >= 0 && b <= 255,
        'b must be greater than or equal to 0 and less than or equal to 255');

    return rgb2hex2(r / 255.0, g / 255.0, b / 255.0);
  }

  /// Converts normalized RGB (0.0-1.0) values to a hex string.
  ///
  /// Returns a string representing the hex value. ffffffff
  static String rgb2hex2(double r, double g, double b) {
    assert(r >= 0.0 && r <= 1.0,
        'r must be greater than or equal to 0 and less than or equal to 1');
    assert(g >= 0.0 && g <= 1.0,
        'g must be greater than or equal to 0 and less than or equal to 1');
    assert(b >= 0.0 && b <= 1.0,
        'b must be greater than or equal to 0 and less than or equal to 1');

    final int integer = rgb2int2(r, g, b);
    return int2hex(integer);
  }

  /// Converts RGB (0-255) values to HSL values.
  ///
  /// Returns a list of doubles representing the HSL values. [h, s, l]
  @Deprecated('Use rgb2hsl2 instead')
  static List<double> rgb2hsl(int r, int g, int b) {
    assert(r >= 0 && r <= 255,
        'r must be greater than or equal to 0 and less than or equal to 255');
    assert(g >= 0 && g <= 255,
        'g must be greater than or equal to 0 and less than or equal to 255');
    assert(b >= 0 && b <= 255,
        'b must be greater than or equal to 0 and less than or equal to 255');

    final double R = r / 255.0;
    final double G = g / 255.0;
    final double B = b / 255.0;

    return rgb2hsl2(R, G, B);
  }

  /// Converts normalized RGB (0.0-1.0) values to HSL values.
  ///
  /// Returns a list of doubles representing the HSL values. [h, s, l]
  static List<double> rgb2hsl2(double r, double g, double b) {
    assert(r >= 0.0 && r <= 1.0,
        'r must be greater than or equal to 0 and less than or equal to 1');
    assert(g >= 0.0 && g <= 1.0,
        'g must be greater than or equal to 0 and less than or equal to 1');
    assert(b >= 0.0 && b <= 1.0,
        'b must be greater than or equal to 0 and less than or equal to 1');

    final double maximum = max(r, max(g, b));
    final double minimum = min(r, min(g, b));
    final double delta = maximum - minimum;

    double h = 0;
    double s = 0;
    double l = (maximum + minimum) / 2;

    if (delta != 0) {
      if (l < 0.5) {
        s = delta / (maximum + minimum);
      } else {
        s = delta / (2 - maximum - minimum);
      }

      if (r == maximum) {
        h = (g - b) / delta;
      } else if (g == maximum) {
        h = 2 + (b - r) / delta;
      } else if (b == maximum) {
        h = 4 + (r - g) / delta;
      }

      h *= 60.0;

      if (h < 0.0) {
        h += 360.0;
      } else if (h > 360.0) {
        h -= 360.0;
      }
    }

    s = s.clamp(0.0, 1.0);
    l = l.clamp(0.0, 1.0);

    return [h, s, l];
  }

  /// Converts RGB (0-255) values to a Flutter Color object.
  @Deprecated('Use rgb2color2 instead')
  static Color rgb2color(int r, int g, int b, [int a = 255]) {
    assert(r >= 0 && r <= 255,
        'r must be greater than or equal to 0 and less than or equal to 255');
    assert(g >= 0 && g <= 255,
        'g must be greater than or equal to 0 and less than or equal to 255');
    assert(b >= 0 && b <= 255,
        'b must be greater than or equal to 0 and less than or equal to 255');

    return rgb2color2(r / 255.0, g / 255.0, b / 255.0, a / 255.0);
  }

  /// Converts normalized RGB (0.0-1.0) values to a Flutter Color object.
  static Color rgb2color2(double r, double g, double b, [double a = 1.0]) {
    assert(r >= 0.0 && r <= 1.0,
        'r must be greater than or equal to 0 and less than or equal to 1');
    assert(g >= 0.0 && g <= 1.0,
        'g must be greater than or equal to 0 and less than or equal to 1');
    assert(b >= 0.0 && b <= 1.0,
        'b must be greater than or equal to 0 and less than or equal to 1');

    return Color.from(alpha: a, red: r, green: g, blue: b);
  }

  /// Converts RGB (0-255) values to an integer.
  @Deprecated('Use rgb2int2 instead')
  static int rgb2int(int r, int g, int b, [int a = 255]) {
    assert(r >= 0 && r <= 255,
        'r must be greater than or equal to 0 and less than or equal to 255');
    assert(g >= 0 && g <= 255,
        'g must be greater than or equal to 0 and less than or equal to 255');
    assert(b >= 0 && b <= 255,
        'b must be greater than or equal to 0 and less than or equal to 255');

    return rgb2int2(r / 255.0, g / 255.0, b / 255.0, a / 255.0);
  }

  /// Converts normalized RGB (0.0-1.0) values to an integer.
  static int rgb2int2(double r, double g, double b, [double a = 1.0]) {
    assert(r >= 0.0 && r <= 1.0,
        'r must be greater than or equal to 0 and less than or equal to 1');
    assert(g >= 0.0 && g <= 1.0,
        'g must be greater than or equal to 0 and less than or equal to 1');
    assert(b >= 0.0 && b <= 1.0,
        'b must be greater than or equal to 0 and less than or equal to 1');

    final int A = (a * 255).round() & 0xff;
    final int R = (r * 255).round() & 0xff;
    final int G = (g * 255).round() & 0xff;
    final int B = (b * 255).round() & 0xff;

    return A << 24 | R << 16 | G << 8 | B << 0;
  }

  /// Converts RGB (0-255) values to a [ColorXy] object.
  @Deprecated('Use rgb2colorXy2 instead')
  static ColorXy rgb2colorXy(int r, int g, int b) {
    assert(r >= 0 && r <= 255,
        'r must be greater than or equal to 0 and less than or equal to 255');
    assert(g >= 0 && g <= 255,
        'g must be greater than or equal to 0 and less than or equal to 255');
    assert(b >= 0 && b <= 255,
        'b must be greater than or equal to 0 and less than or equal to 255');

    return ColorXy.fromRgb(r, g, b);
  }

  /// Converts normalized RGB (0.0-1.0) values to a [ColorXy] object.
  static ColorXy rgb2colorXy2(double r, double g, double b) {
    assert(r >= 0.0 && r <= 1.0,
        'r must be greater than or equal to 0 and less than or equal to 1');
    assert(g >= 0.0 && g <= 1.0,
        'g must be greater than or equal to 0 and less than or equal to 1');
    assert(b >= 0.0 && b <= 1.0,
        'b must be greater than or equal to 0 and less than or equal to 1');

    return ColorXy.fromRgbNormalized(r, g, b);
  }

  /// Converts RGB (0-255) values to a [ColorRgb] object.
  @Deprecated('Use rgb2colorRgbNormalized2 instead')
  static ColorRgb rgb2colorRgb(int r, int g, int b) {
    assert(r >= 0 && r <= 255,
        'r must be greater than or equal to 0 and less than or equal to 255');
    assert(g >= 0 && g <= 255,
        'g must be greater than or equal to 0 and less than or equal to 255');
    assert(b >= 0 && b <= 255,
        'b must be greater than or equal to 0 and less than or equal to 255');

    return ColorRgb(r, g, b);
  }

  /// Converts normalized RGB (0.0-1.0) values to a [ColorRgb] object.
  @Deprecated('Use rgb2colorRgbNormalized2 instead')
  static ColorRgb rgb2colorRgb2(double r, double g, double b) {
    assert(r >= 0.0 && r <= 1.0,
        'r must be greater than or equal to 0 and less than or equal to 1');
    assert(g >= 0.0 && g <= 1.0,
        'g must be greater than or equal to 0 and less than or equal to 1');
    assert(b >= 0.0 && b <= 1.0,
        'b must be greater than or equal to 0 and less than or equal to 1');

    return ColorRgb.fromRgbNormalized(r, g, b);
  }

  /// Converts RGB (0-255) values to a [ColorRgbNormalized] object.
  @Deprecated('Use rgb2colorRgbNormalized2 instead')
  static ColorRgbNormalized rgb2colorRgbNormalized(int r, int g, int b) {
    assert(r >= 0 && r <= 255,
        'r must be greater than or equal to 0 and less than or equal to 255');
    assert(g >= 0 && g <= 255,
        'g must be greater than or equal to 0 and less than or equal to 255');
    assert(b >= 0 && b <= 255,
        'b must be greater than or equal to 0 and less than or equal to 255');

    return ColorRgbNormalized.fromRgb(r, g, b);
  }

  /// Converts normalized RGB (0.0-1.0) values to a [ColorRgbNormalized] object.
  static ColorRgbNormalized rgb2colorRgbNormalized2(
    double r,
    double g,
    double b,
  ) {
    assert(r >= 0.0 && r <= 1.0,
        'r must be greater than or equal to 0 and less than or equal to 1');
    assert(g >= 0.0 && g <= 1.0,
        'g must be greater than or equal to 0 and less than or equal to 1');
    assert(b >= 0.0 && b <= 1.0,
        'b must be greater than or equal to 0 and less than or equal to 1');

    return ColorRgbNormalized(r, g, b);
  }

  /// Converts HSV values to xy coordinates in the CIE 1931 color space.
  ///
  /// Returns a list of doubles representing the xy values. [x, y, brightness]
  static List<double> hsv2xy(int h, double s, double v) {
    assert(h >= 0 && h <= 360,
        'h must be greater than or equal to 0 and less than or equal to 360');
    assert(s >= 0.0 && s <= 1.0,
        's must be greater than or equal to 0 and less than or equal to 1');
    assert(v >= 0.0 && v <= 1.0,
        'v must be greater than or equal to 0 and less than or equal to 1');

    final List<double> rgb = hsv2rgb2(h, s, v);
    return rgb2xy2(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts HSV values to RGB (0-255) values.
  ///
  /// Returns a list of integers representing the RGB values. [r, g, b]
  @Deprecated('Use hsv2rgb2 instead')
  static List<int> hsv2rgb(int h, double s, double v) {
    assert(h >= 0 && h <= 360,
        'h must be greater than or equal to 0 and less than or equal to 360');
    assert(s >= 0.0 && s <= 1.0,
        's must be greater than or equal to 0 and less than or equal to 1');
    assert(v >= 0.0 && v <= 1.0,
        'v must be greater than or equal to 0 and less than or equal to 1');

    final List<double> rgb = hsv2rgb2(h, s, v);

    return [
      (rgb[0] * 255).round(),
      (rgb[1] * 255).round(),
      (rgb[2] * 255).round(),
    ];
  }

  /// Converts HSV values to normalized RGB (0.0-1.0) values.
  ///
  /// Returns a list of doubles representing the RGB values. [r, g, b]
  static List<double> hsv2rgb2(int h, double s, double v) {
    assert(h >= 0 && h <= 360,
        'h must be greater than or equal to 0 and less than or equal to 360');
    assert(s >= 0.0 && s <= 1.0,
        's must be greater than or equal to 0 and less than or equal to 1');
    assert(v >= 0.0 && v <= 1.0,
        'v must be greater than or equal to 0 and less than or equal to 1');

    if (h < 0) {
      h = 0;
    } else if (h > 360) {
      h = 360;
    }

    double S;
    if (s > 1.0) {
      S = s / 100;
    } else {
      S = s;
    }

    double V;
    if (v > 1.0) {
      V = v / 100;
    } else {
      V = v;
    }

    double c = V * S;
    double x = c * (1 - (((h / 60) % 2) - 1).abs());
    double m = V - c;

    double r = 0;
    double g = 0;
    double b = 0;

    // Calculate RGB values based on hue.
    if (h >= 0 && h < 60) {
      r = c;
      g = x;
      b = 0;
    } else if (h >= 60 && h < 120) {
      r = x;
      g = c;
      b = 0;
    } else if (h >= 120 && h < 180) {
      r = 0;
      g = c;
      b = x;
    } else if (h >= 180 && h < 240) {
      r = 0;
      g = x;
      b = c;
    } else if (h >= 240 && h < 300) {
      r = x;
      g = 0;
      b = c;
    } else if (h >= 300 && h < 360) {
      r = c;
      g = 0;
      b = x;
    }

    // Convert to a linear RGB color space.
    r = (r + m).clamp(0.0, 1.0);
    g = (g + m).clamp(0.0, 1.0);
    b = (b + m).clamp(0.0, 1.0);

    return [r, g, b];
  }

  /// Converts HSV values to a hex string.
  ///
  /// Returns a string representing the hex value. ffffffff
  static String hsv2hex(int h, double s, double v) {
    assert(h >= 0 && h <= 360,
        'h must be greater than or equal to 0 and less than or equal to 360');
    assert(s >= 0.0 && s <= 1.0,
        's must be greater than or equal to 0 and less than or equal to 1');
    assert(v >= 0.0 && v <= 1.0,
        'v must be greater than or equal to 0 and less than or equal to 1');

    final List<double> rgb = hsv2rgb2(h, s, v);
    return rgb2hex2(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts HSV values to HSL values.
  ///
  /// Returns a list of doubles representing the HSL values. [h, s, l]
  static List<double> hsv2hsl(int h, double s, double v) {
    assert(h >= 0 && h <= 360,
        'h must be greater than or equal to 0 and less than or equal to 360');
    assert(s >= 0.0 && s <= 1.0,
        's must be greater than or equal to 0 and less than or equal to 1');
    assert(v >= 0.0 && v <= 1.0,
        'v must be greater than or equal to 0 and less than or equal to 1');

    final List<double> rgb = hsv2rgb2(h, s, v);
    return rgb2hsl2(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts HSV values to a Flutter Color object.
  static Color hsv2color(int h, double s, double v) {
    assert(h >= 0 && h <= 360,
        'h must be greater than or equal to 0 and less than or equal to 360');
    assert(s >= 0.0 && s <= 1.0,
        's must be greater than or equal to 0 and less than or equal to 1');
    assert(v >= 0.0 && v <= 1.0,
        'v must be greater than or equal to 0 and less than or equal to 1');

    final List<double> rgb = hsv2rgb2(h, s, v);
    return rgb2color2(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts HSV values to an integer.
  static int hsv2int(int h, double s, double v) {
    assert(h >= 0 && h <= 360,
        'h must be greater than or equal to 0 and less than or equal to 360');
    assert(s >= 0.0 && s <= 1.0,
        's must be greater than or equal to 0 and less than or equal to 1');
    assert(v >= 0.0 && v <= 1.0,
        'v must be greater than or equal to 0 and less than or equal to 1');

    final List<double> rgb = hsv2rgb2(h, s, v);
    return rgb2int2(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts HSV values to a [ColorXy] object.
  static ColorXy hsv2colorXy(int h, double s, double v) {
    assert(h >= 0 && h <= 360,
        'h must be greater than or equal to 0 and less than or equal to 360');
    assert(s >= 0.0 && s <= 1.0,
        's must be greater than or equal to 0 and less than or equal to 1');
    assert(v >= 0.0 && v <= 1.0,
        'v must be greater than or equal to 0 and less than or equal to 1');

    final List<double> rgb = hsv2rgb2(h, s, v);
    return ColorXy.fromRgbNormalized(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts HSV values to a [ColorRgb] object.
  @Deprecated('Use hsv2colorRgbNormalized instead')
  static ColorRgb hsv2colorRgb(int h, double s, double v) {
    assert(h >= 0 && h <= 360,
        'h must be greater than or equal to 0 and less than or equal to 360');
    assert(s >= 0.0 && s <= 1.0,
        's must be greater than or equal to 0 and less than or equal to 1');
    assert(v >= 0.0 && v <= 1.0,
        'v must be greater than or equal to 0 and less than or equal to 1');

    final List<double> rgb = hsv2rgb2(h, s, v);
    return ColorRgb.fromRgbNormalized(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts HSV values to a [ColorRgbNormalized] object.
  static ColorRgbNormalized hsv2colorRgbNormalized(int h, double s, double v) {
    assert(h >= 0 && h <= 360,
        'h must be greater than or equal to 0 and less than or equal to 360');
    assert(s >= 0.0 && s <= 1.0,
        's must be greater than or equal to 0 and less than or equal to 1');
    assert(v >= 0.0 && v <= 1.0,
        'v must be greater than or equal to 0 and less than or equal to 1');

    final List<double> rgb = hsv2rgb2(h, s, v);
    return ColorRgbNormalized(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts a hex string to xy coordinates in the CIE 1931 color space.
  ///
  /// Returns a list of doubles representing the xy values. [x, y, brightness]
  static List<double> hex2xy(hex) {
    final List<double> rgb = hex2rgb2(hex);
    return rgb2xy2(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts a hex string to RGB (0-255) values.
  ///
  /// Returns a list of integers representing the RGB values. [r, g, b]
  @Deprecated('Use hex2rgb2 instead')
  static List<int> hex2rgb(hex) {
    final List<double> rgb = hex2rgb2(hex);

    return [
      (rgb[0] * 255).round(),
      (rgb[1] * 255).round(),
      (rgb[2] * 255).round(),
    ];
  }

  /// Converts a hex string to normalized RGB (0.0-1.0) values.
  ///
  /// Returns a list of doubles representing the RGB values. [r, g, b]
  static List<double> hex2rgb2(hex) {
    String hexString = hex.toString().replaceAll('#', '');
    hexString = hexString.replaceAll('0x', '');

    if (hexString.length == 3) {
      hexString = hexString.replaceAllMapped(
          RegExp(r'(.)(.)'), (Match m) => '${m[1]}${m[1]}${m[2]}${m[2]}');
    }

    if (hexString.length == 8) {
      hexString = hexString.substring(2);
    }

    final int r = int.parse(hexString.substring(0, 2), radix: 16).clamp(0, 255);
    final int g = int.parse(hexString.substring(2, 4), radix: 16).clamp(0, 255);
    final int b = int.parse(hexString.substring(4, 6), radix: 16).clamp(0, 255);

    return [r / 255.0, g / 255.0, b / 255.0];
  }

  /// Converts a hex string to HSV values.
  ///
  /// Returns a list of doubles representing the HSV values. [h, s, v]
  static List<double> hex2hsv(hex) {
    final List<double> rgb = hex2rgb2(hex);
    return rgb2hsv2(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts a hex string to HSL values.
  ///
  /// Returns a list of doubles representing the HSL values. [h, s, l]
  static List<double> hex2hsl(hex) {
    final List<double> rgb = hex2rgb2(hex);
    return rgb2hsl2(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts a hex string to a Flutter Color object.
  static Color hex2color(hex) {
    final List<double> rgb = hex2rgb2(hex);
    return rgb2color2(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts a hex string to an integer.
  static int hex2int(hex) {
    final List<double> rgb = hex2rgb2(hex);
    return rgb2int2(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts a hex string to a [ColorXy] object.
  static ColorXy hex2colorXy(hex) {
    final List<double> rgb = hex2rgb2(hex);
    return ColorXy.fromRgbNormalized(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts a hex string to a [ColorRgb] object.
  @Deprecated('Use hex2colorRgbNormalized instead')
  static ColorRgb hex2colorRgb(hex) {
    final List<double> rgb = hex2rgb2(hex);
    return ColorRgb.fromRgbNormalized(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts a hex string to a [ColorRgbNormalized] object.
  static ColorRgbNormalized hex2colorRgbNormalized(hex) {
    final List<double> rgb = hex2rgb2(hex);
    return ColorRgbNormalized(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts HSL values to xy coordinates in the CIE 1931 color space.
  ///
  /// Returns a list of doubles representing the xy values. [x, y, brightness]
  static List<double> hsl2xy(int h, double s, double l) {
    assert(h >= 0 && h <= 360,
        'h must be greater than or equal to 0 and less than or equal to 360');
    assert(s >= 0.0 && s <= 1.0,
        's must be greater than or equal to 0 and less than or equal to 1');
    assert(l >= 0.0 && l <= 1.0,
        'l must be greater than or equal to 0 and less than or equal to 1');

    final List<double> rgb = hsl2rgb2(h, s, l);
    return rgb2xy2(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts HSL values to RGB (0-255) values.
  ///
  /// Returns a list of integers representing the RGB values. [r, g, b]
  @Deprecated('Use hsl2rgb2 instead')
  static List<int> hsl2rgb(int h, double s, double l) {
    assert(h >= 0 && h <= 360,
        'h must be greater than or equal to 0 and less than or equal to 360');
    assert(s >= 0.0 && s <= 1.0,
        's must be greater than or equal to 0 and less than or equal to 1');
    assert(l >= 0.0 && l <= 1.0,
        'l must be greater than or equal to 0 and less than or equal to 1');

    final List<double> rgb = hsl2rgb2(h, s, l);

    return [
      (rgb[0] * 255).round(),
      (rgb[1] * 255).round(),
      (rgb[2] * 255).round(),
    ];
  }

  /// Converts HSL values to normalized RGB (0.0-1.0) values.
  ///
  /// Returns a list of doubles representing the RGB values. [r, g, b]
  static List<double> hsl2rgb2(int h, double s, double l) {
    assert(h >= 0 && h <= 360,
        'h must be greater than or equal to 0 and less than or equal to 360');
    assert(s >= 0.0 && s <= 1.0,
        's must be greater than or equal to 0 and less than or equal to 1');
    assert(l >= 0.0 && l <= 1.0,
        'l must be greater than or equal to 0 and less than or equal to 1');

    if (h < 0) {
      h = 0;
    } else if (h > 360) {
      h = 360;
    }

    double S;
    if (s > 1.0) {
      S = s / 100;
    } else {
      S = s;
    }

    double L;
    if (l > 1.0) {
      L = l / 100;
    } else {
      L = l;
    }

    double c = (1 - (2 * L - 1).abs()) * S;
    double x = c * (1 - (((h / 60) % 2) - 1).abs());
    double m = L - c / 2;

    double r = 0;
    double g = 0;
    double b = 0;

    // Calculate RGB values based on hue.
    if (h >= 0 && h < 60) {
      r = c;
      g = x;
      b = 0;
    } else if (h >= 60 && h < 120) {
      r = x;
      g = c;
      b = 0;
    } else if (h >= 120 && h < 180) {
      r = 0;
      g = c;
      b = x;
    } else if (h >= 180 && h < 240) {
      r = 0;
      g = x;
      b = c;
    } else if (h >= 240 && h < 300) {
      r = x;
      g = 0;
      b = c;
    } else if (h >= 300 && h < 360) {
      r = c;
      g = 0;
      b = x;
    }

    // Convert to a linear RGB color space.
    r = (r + m).clamp(0.0, 1.0);
    g = (g + m).clamp(0.0, 1.0);
    b = (b + m).clamp(0.0, 1.0);

    return [r, g, b];
  }

  /// Converts HSL values to HSV values.
  ///
  /// Returns a list of doubles representing the HSV values. [h, s, v]
  static List<double> hsl2hsv(int h, double s, double l) {
    assert(h >= 0 && h <= 360,
        'h must be greater than or equal to 0 and less than or equal to 360');
    assert(s >= 0.0 && s <= 1.0,
        's must be greater than or equal to 0 and less than or equal to 1');
    assert(l >= 0.0 && l <= 1.0,
        'l must be greater than or equal to 0 and less than or equal to 1');

    final List<double> rgb = hsl2rgb2(h, s, l);
    return rgb2hsv2(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts HSL values to a hex string.
  ///
  /// Returns a string representing the hex value. ffffffff
  static String hsl2hex(int h, double s, double l) {
    assert(h >= 0 && h <= 360,
        'h must be greater than or equal to 0 and less than or equal to 360');
    assert(s >= 0.0 && s <= 1.0,
        's must be greater than or equal to 0 and less than or equal to 1');
    assert(l >= 0.0 && l <= 1.0,
        'l must be greater than or equal to 0 and less than or equal to 1');

    final List<double> rgb = hsl2rgb2(h, s, l);
    return rgb2hex2(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts HSL values to a Flutter Color object.
  static Color hsl2color(int h, double s, double l) {
    assert(h >= 0 && h <= 360,
        'h must be greater than or equal to 0 and less than or equal to 360');
    assert(s >= 0.0 && s <= 1.0,
        's must be greater than or equal to 0 and less than or equal to 1');
    assert(l >= 0.0 && l <= 1.0,
        'l must be greater than or equal to 0 and less than or equal to 1');

    final List<double> rgb = hsl2rgb2(h, s, l);
    return rgb2color2(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts HSL values to an integer.
  static int hsl2int(int h, double s, double l) {
    assert(h >= 0 && h <= 360,
        'h must be greater than or equal to 0 and less than or equal to 360');
    assert(s >= 0.0 && s <= 1.0,
        's must be greater than or equal to 0 and less than or equal to 1');
    assert(l >= 0.0 && l <= 1.0,
        'l must be greater than or equal to 0 and less than or equal to 1');

    final List<double> rgb = hsl2rgb2(h, s, l);
    return rgb2int2(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts HSL values to a [ColorXy] object.
  static ColorXy hsl2colorXy(int h, double s, double l) {
    assert(h >= 0 && h <= 360,
        'h must be greater than or equal to 0 and less than or equal to 360');
    assert(s >= 0.0 && s <= 1.0,
        's must be greater than or equal to 0 and less than or equal to 1');
    assert(l >= 0.0 && l <= 1.0,
        'l must be greater than or equal to 0 and less than or equal to 1');

    final List<double> rgb = hsl2rgb2(h, s, l);
    return ColorXy.fromRgbNormalized(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts HSL values to a [ColorRgb] object.
  @Deprecated('Use hsl2colorRgbNormalized instead')
  static ColorRgb hsl2colorRgb(int h, double s, double l) {
    assert(h >= 0 && h <= 360,
        'h must be greater than or equal to 0 and less than or equal to 360');
    assert(s >= 0.0 && s <= 1.0,
        's must be greater than or equal to 0 and less than or equal to 1');
    assert(l >= 0.0 && l <= 1.0,
        'l must be greater than or equal to 0 and less than or equal to 1');

    final List<double> rgb = hsl2rgb2(h, s, l);
    return ColorRgb.fromRgbNormalized(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts HSL values to a [ColorRgbNormalized] object.
  static ColorRgbNormalized hsl2colorRgbNormalized(int h, double s, double l) {
    assert(h >= 0 && h <= 360,
        'h must be greater than or equal to 0 and less than or equal to 360');
    assert(s >= 0.0 && s <= 1.0,
        's must be greater than or equal to 0 and less than or equal to 1');
    assert(l >= 0.0 && l <= 1.0,
        'l must be greater than or equal to 0 and less than or equal to 1');

    final List<double> rgb = hsl2rgb2(h, s, l);
    return ColorRgbNormalized(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts a Flutter Color object to xy coordinates in the CIE 1931 color
  /// space.
  ///
  /// Returns a list of doubles representing the xy values. [x, y, brightness]
  static List<double> color2xy(Color color) {
    try {
      final dynamic colorObject = color as dynamic;
      return rgb2xy2(colorObject.r, colorObject.g, colorObject.b);
    } catch (e) {
      // ignore: deprecated_member_use, deprecated_member_use_from_same_package
      return rgb2xy(color.red, color.green, color.blue);
    }
  }

  /// Converts a Flutter Color object to RGB (0-255) values.
  ///
  /// Returns a list of integers representing the RGB values. [r, g, b]
  @Deprecated('Use color2rgb2 instead')
  static List<int> color2rgb(Color color) {
    // ignore: deprecated_member_use
    return [color.red, color.green, color.blue];
  }

  /// Converts a Flutter Color object to normalized RGB (0.0-1.0) values.
  ///
  /// Returns a list of doubles representing the RGB values. [r, g, b]
  static List<double> color2rgb2(Color color) {
    try {
      final dynamic colorObject = color as dynamic;
      return [
        colorObject.r,
        colorObject.g,
        colorObject.b,
      ];
    } catch (e) {
      // ignore: deprecated_member_use_from_same_package
      final List<int> oldVersion = color2rgb(color);
      return [
        oldVersion[0] / 255.0,
        oldVersion[1] / 255.0,
        oldVersion[2] / 255.0,
      ];
    }
  }

  /// Converts a Flutter Color object to HSV values.
  ///
  /// Returns a list of doubles representing the HSV values. [h, s, v]
  static List<double> color2hsv(Color color) {
    final List<double> rgb = color2rgb2(color);
    return rgb2hsv2(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts a Flutter Color object to a hex string.
  ///
  /// Returns a string representing the hex value. ffffffff
  static String color2hex(Color color) {
    final List<double> rgb = color2rgb2(color);
    return rgb2hex2(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts a Flutter Color object to HSL values.
  ///
  /// Returns a list of doubles representing the HSL values. [h, s, l]
  static List<double> color2hsl(Color color) {
    final List<double> rgb = color2rgb2(color);
    return rgb2hsl2(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts a Flutter Color object to an integer.
  static int color2int(Color color) {
    try {
      final dynamic colorObject = color as dynamic;

      final int a = (colorObject.a * 255).round() & 0xff;
      final int r = (colorObject.r * 255).round() & 0xff;
      final int g = (colorObject.g * 255).round() & 0xff;
      final int b = (colorObject.b * 255).round() & 0xff;

      return a << 24 | r << 16 | g << 8 | b << 0;
    } catch (e) {
      // ignore: deprecated_member_use
      return color.value;
    }
  }

  /// Converts a Flutter Color object to a [ColorXy] object.
  static ColorXy color2colorXy(Color color) {
    final List<double> rgb = color2rgb2(color);
    return ColorXy.fromRgbNormalized(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts a Flutter Color object to a [ColorRgb] object.
  @Deprecated('Use color2colorRgbNormalized instead')
  static ColorRgb color2colorRgb(Color color) {
    final List<double> rgb = color2rgb2(color);
    return ColorRgb.fromRgbNormalized(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts a Flutter Color object to a [ColorRgbNormalized] object.
  static ColorRgbNormalized color2colorRgbNormalized(Color color) {
    final List<double> rgb = color2rgb2(color);
    return ColorRgbNormalized(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts an integer to xy coordinates in the CIE 1931 color space.
  ///
  /// Returns a list of doubles representing the xy values. [x, y, brightness]
  static List<double> int2xy(int integer) {
    final List<double> rgb = int2rgb2(integer);
    return rgb2xy2(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts an integer to RGB (0-255) values.
  ///
  /// Returns a list of integers representing the RGB values. [r, g, b]
  @Deprecated('Use int2rgb2 instead')
  static List<int> int2rgb(int integer) {
    final List<double> rgb = int2rgb2(integer);

    return [
      (rgb[0] * 255).round(),
      (rgb[1] * 255).round(),
      (rgb[2] * 255).round(),
    ];
  }

  /// Converts an integer to normalized RGB (0.0-1.0) values.
  ///
  /// Returns a list of doubles representing the RGB values. [r, g, b]
  static List<double> int2rgb2(int integer) {
    final int r = integer >> 16 & 0xFF;
    final int g = integer >> 8 & 0xFF;
    final int b = integer & 0xFF;

    return [r / 255.0, g / 255.0, b / 255.0];
  }

  /// Converts an integer to HSV values.
  ///
  /// Returns a list of doubles representing the HSV values. [h, s, v]
  static List<double> int2hsv(int integer) {
    final List<double> rgb = int2rgb2(integer);
    return rgb2hsv2(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts an integer to a hex string.
  ///
  /// Returns a string representing the hex value. ffffffff
  static String int2hex(int integer) {
    String hex = integer.toRadixString(16);

    while (hex.length < 6) {
      hex = '0$hex';
    }

    return hex;
  }

  /// Converts an integer to HSL values.
  ///
  /// Returns a list of doubles representing the HSL values. [h, s, l]
  static List<double> int2hsl(int integer) {
    final List<double> rgb = int2rgb2(integer);
    return rgb2hsl2(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts an integer to a Flutter Color object.
  static Color int2color(int integer) {
    return Color(integer);
  }

  /// Converts an integer to a [ColorXy] object.
  static ColorXy int2colorXy(int integer) {
    final List<double> rgb = int2rgb2(integer);
    return ColorXy.fromRgbNormalized(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts an integer to a [ColorRgb] object.
  @Deprecated('Use int2colorRgbNormalized instead')
  static ColorRgb int2colorRgb(int integer) {
    final List<double> rgb = int2rgb2(integer);
    return ColorRgb.fromRgbNormalized(rgb[0], rgb[1], rgb[2]);
  }

  /// Converts an integer to a [ColorRgbNormalized] object.
  static ColorRgbNormalized int2colorRgbNormalized(int integer) {
    final List<double> rgb = int2rgb2(integer);
    return ColorRgbNormalized(rgb[0], rgb[1], rgb[2]);
  }

  /// Makes colors appear more natural on a screen.
  static double _gammaCorrection(double c) {
    double toReturn;

    if (c > 0.04045) {
      toReturn = pow((c + 0.055) / (1.0 + 0.055), 2.4).toDouble();
    } else {
      toReturn = c / 12.92;
    }

    return toReturn;
  }

  /// Makes colors appear more natural on a screen.
  static double _reverseGammaCorrection(double c) {
    double toReturn;

    if (c <= 0.0031308) {
      toReturn = 12.92 * c;
    } else {
      toReturn = (1.0 + 0.055) * pow(c, (1.0 / 2.4)) - 0.055;
    }

    return toReturn;
  }
}

/// A class that contains all the conversions for the [Color] object as
/// extensions.
extension Converters on Color {
  /// Converts a Flutter Color object to xy coordinates in the CIE 1931 color
  /// space.
  ///
  /// Returns a list of doubles representing the xy values. [x, y, brightness]
  List<double> toXy() {
    return ColorConverter.color2xy(this);
  }

  /// Converts a Flutter Color object to RGB (0-255) values.
  ///
  /// Returns a list of integers representing the RGB values. [r, g, b]
  @Deprecated('Use toRgb2 instead')
  List<int> toRgb() {
    final List<double> rgb = ColorConverter.color2rgb2(this);

    return [
      (rgb[0] * 255).round(),
      (rgb[1] * 255).round(),
      (rgb[2] * 255).round(),
    ];
  }

  /// Converts a Flutter Color object to normalized RGB (0.0-1.0) values.
  ///
  /// Returns a list of doubles representing the RGB values. [r, g, b]
  List<double> toRgb2() {
    return ColorConverter.color2rgb2(this);
  }

  /// Converts a Flutter Color object to HSV values.
  ///
  /// Returns a list of doubles representing the HSV values. [h, s, v]
  List<double> toHsv() {
    return ColorConverter.color2hsv(this);
  }

  /// Converts a Flutter Color object to a hex string.
  ///
  /// Returns a string representing the hex value. ffffffff
  String toHex() {
    return ColorConverter.color2hex(this);
  }

  /// Converts a Flutter Color object to HSL values.
  ///
  /// Returns a list of doubles representing the HSL values. [h, s, l]
  List<double> toHsl() {
    return ColorConverter.color2hsl(this);
  }

  /// Converts a Flutter Color object to an integer.
  int toInt() {
    return ColorConverter.color2int(this);
  }

  /// Converts a Flutter Color object to a [ColorXy] object.
  ColorXy toColorXy() {
    return ColorConverter.color2colorXy(this);
  }

  /// Converts a Flutter Color object to a [ColorRgb] object.
  @Deprecated('Use toColorRgbNormalized instead')
  ColorRgb toColorRgb() {
    return ColorConverter.color2colorRgb(this);
  }

  /// Converts a Flutter Color object to a [ColorRgbNormalized] object.
  ColorRgbNormalized toColorRgbNormalized() {
    return ColorConverter.color2colorRgbNormalized(this);
  }
}
