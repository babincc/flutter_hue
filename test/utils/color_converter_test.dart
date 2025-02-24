// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:ui';

import 'package:flutter_hue/flutter_hue.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'xy to',
    () {
      const List<double> xy1 = [0.0000000001, 0.0000000001];
      const List<double> xy2 = [0.5, 0.5];
      const List<double> xy3 = [1.0, 1.0];
      const List<double> xy4 = [0.0000000001, 1.0];
      const List<double> xy5 = [1.0, 0.0000000001];
      const List<double> xy6 = [0.23178, 0.54689];

      test(
        'rgb',
        () {
          expect(
            ColorConverter.xy2rgb(xy1[0], xy1[1]),
            [0, 64, 255],
          );
          expect(
            ColorConverter.xy2rgb(xy2[0], xy2[1]),
            [255, 222, 0],
          );
          expect(
            () => ColorConverter.xy2rgb(xy3[0], xy3[1]),
            throwsAssertionError,
          );
          expect(
            () => ColorConverter.xy2rgb(xy4[0], xy4[1]),
            throwsAssertionError,
          );
          expect(
            () => ColorConverter.xy2rgb(xy5[0], xy5[1]),
            throwsAssertionError,
          );
          expect(
            ColorConverter.xy2rgb(xy6[0], xy6[1]),
            [118, 255, 132],
          );
        },
      );

      test(
        'rgb2',
        () {
          expect(
            ColorConverter.xy2rgb2(xy1[0], xy1[1]),
            [0.0, 0.24954145368056627, 1.0],
          );
          expect(
            ColorConverter.xy2rgb2(xy2[0], xy2[1]),
            [1.0, 0.8702763507890375, 0.0],
          );
          expect(
            () => ColorConverter.xy2rgb2(xy3[0], xy3[1]),
            throwsAssertionError,
          );
          expect(
            () => ColorConverter.xy2rgb2(xy4[0], xy4[1]),
            throwsAssertionError,
          );
          expect(
            () => ColorConverter.xy2rgb2(xy5[0], xy5[1]),
            throwsAssertionError,
          );
          expect(
            ColorConverter.xy2rgb2(xy6[0], xy6[1]),
            [0.46264977976038774, 1.0, 0.5161695277671207],
          );
        },
      );

      test(
        'hsv',
        () {
          expect(
            ColorConverter.xy2hsv(xy1[0], xy1[1]),
            [225.02751277916602, 1.0, 1.0],
          );
          expect(
            ColorConverter.xy2hsv(xy2[0], xy2[1]),
            [52.21658104734225, 1.0, 1.0],
          );
          expect(
            () => ColorConverter.xy2hsv(xy3[0], xy3[1]),
            throwsAssertionError,
          );
          expect(
            () => ColorConverter.xy2hsv(xy4[0], xy4[1]),
            throwsAssertionError,
          );
          expect(
            () => ColorConverter.xy2hsv(xy5[0], xy5[1]),
            throwsAssertionError,
          );
          expect(
            ColorConverter.xy2hsv(xy6[0], xy6[1]),
            [125.97596271379969, 0.5373502202396123, 1.0],
          );
        },
      );

      test(
        'hex',
        () {
          expect(
            ColorConverter.xy2hex(xy1[0], xy1[1]),
            'ff0040ff',
          );
          expect(
            ColorConverter.xy2hex(xy2[0], xy2[1]),
            'ffffde00',
          );
          expect(
            () => ColorConverter.xy2hex(xy3[0], xy3[1]),
            throwsAssertionError,
          );
          expect(
            () => ColorConverter.xy2hex(xy4[0], xy4[1]),
            throwsAssertionError,
          );
          expect(
            () => ColorConverter.xy2hex(xy5[0], xy5[1]),
            throwsAssertionError,
          );
          expect(
            ColorConverter.xy2hex(xy6[0], xy6[1]),
            'ff76ff84',
          );
        },
      );

      test(
        'hsl',
        () {
          expect(
            ColorConverter.xy2hsl(xy1[0], xy1[1]),
            [225.02751277916602, 1.0, 0.5],
          );
          expect(
            ColorConverter.xy2hsl(xy2[0], xy2[1]),
            [52.21658104734225, 1.0, 0.5],
          );
          expect(
            () => ColorConverter.xy2hsl(xy3[0], xy3[1]),
            throwsAssertionError,
          );
          expect(
            () => ColorConverter.xy2hsl(xy4[0], xy4[1]),
            throwsAssertionError,
          );
          expect(
            () => ColorConverter.xy2hsl(xy5[0], xy5[1]),
            throwsAssertionError,
          );
          expect(
            ColorConverter.xy2hsl(xy6[0], xy6[1]),
            [125.97596271379969, 1.0, 0.7313248898801938],
          );
        },
      );

      test(
        'color',
        () {
          final Color expectedColor1 = const Color.from(
            alpha: 1.0,
            red: 0.0,
            green: 0.24954145368056627,
            blue: 1.0,
          );
          final Color actualColor1 = ColorConverter.xy2color(xy1[0], xy1[1]);
          expect(actualColor1.a, expectedColor1.a);
          expect(actualColor1.r, expectedColor1.r);
          expect(actualColor1.g, expectedColor1.g);
          expect(actualColor1.b, expectedColor1.b);

          final Color expectedColor2 = const Color.from(
            alpha: 1.0,
            red: 1.0,
            green: 0.8702763507890375,
            blue: 0.0,
          );
          final Color actualColor2 = ColorConverter.xy2color(xy2[0], xy2[1]);
          expect(actualColor2.a, expectedColor2.a);
          expect(actualColor2.r, expectedColor2.r);
          expect(actualColor2.g, expectedColor2.g);
          expect(actualColor2.b, expectedColor2.b);

          expect(
            () => ColorConverter.xy2color(xy3[0], xy3[1]),
            throwsAssertionError,
          );
          expect(
            () => ColorConverter.xy2color(xy4[0], xy4[1]),
            throwsAssertionError,
          );
          expect(
            () => ColorConverter.xy2color(xy5[0], xy5[1]),
            throwsAssertionError,
          );

          final Color expectedColor6 = const Color.from(
            alpha: 1.0,
            red: 0.46264977976038774,
            green: 1.0,
            blue: 0.5161695277671207,
          );
          final Color actualColor6 = ColorConverter.xy2color(xy6[0], xy6[1]);
          expect(actualColor6.a, expectedColor6.a);
          expect(actualColor6.r, expectedColor6.r);
          expect(actualColor6.g, expectedColor6.g);
          expect(actualColor6.b, expectedColor6.b);
        },
      );

      test(
        'int',
        () {
          expect(
            ColorConverter.xy2int(xy1[0], xy1[1]),
            4278206719,
          );
          expect(
            ColorConverter.xy2int(xy2[0], xy2[1]),
            4294958592,
          );
          expect(
            () => ColorConverter.xy2int(xy3[0], xy3[1]),
            throwsAssertionError,
          );
          expect(
            () => ColorConverter.xy2int(xy4[0], xy4[1]),
            throwsAssertionError,
          );
          expect(
            () => ColorConverter.xy2int(xy5[0], xy5[1]),
            throwsAssertionError,
          );
          expect(
            ColorConverter.xy2int(xy6[0], xy6[1]),
            4285988740,
          );
        },
      );

      test(
        'colorXy',
        () {
          expect(
            ColorConverter.xy2colorXy(xy1[0], xy1[1]),
            ColorXy(xy1[0], xy1[1], 1.0),
          );
          expect(
            ColorConverter.xy2colorXy(xy2[0], xy2[1]),
            ColorXy(xy2[0], xy2[1], 1.0),
          );
          expect(
            () => ColorConverter.xy2colorXy(xy3[0], xy3[1]),
            throwsAssertionError,
          );
          expect(
            () => ColorConverter.xy2colorXy(xy4[0], xy4[1]),
            throwsAssertionError,
          );
          expect(
            () => ColorConverter.xy2colorXy(xy5[0], xy5[1]),
            throwsAssertionError,
          );
          expect(
            ColorConverter.xy2colorXy(xy6[0], xy6[1]),
            ColorXy(xy6[0], xy6[1], 1.0),
          );
        },
      );

      test(
        'colorRgb',
        () {
          expect(
            ColorConverter.xy2colorRgb(xy1[0], xy1[1]),
            ColorRgb.fromXy(xy1[0], xy1[1], 1.0),
          );
          expect(
            ColorConverter.xy2colorRgb(xy2[0], xy2[1]),
            ColorRgb.fromXy(xy2[0], xy2[1], 1.0),
          );
          expect(
            () => ColorConverter.xy2colorRgb(xy3[0], xy3[1]),
            throwsAssertionError,
          );
          expect(
            () => ColorConverter.xy2colorRgb(xy4[0], xy4[1]),
            throwsAssertionError,
          );
          expect(
            () => ColorConverter.xy2colorRgb(xy5[0], xy5[1]),
            throwsAssertionError,
          );
          expect(
            ColorConverter.xy2colorRgb(xy6[0], xy6[1]),
            ColorRgb.fromXy(xy6[0], xy6[1], 1.0),
          );
        },
      );

      test(
        'colorRgbNormalized',
        () {
          expect(
            ColorConverter.xy2colorRgbNormalized(xy1[0], xy1[1]),
            ColorRgbNormalized.fromXy(xy1[0], xy1[1], 1.0),
          );
          expect(
            ColorConverter.xy2colorRgbNormalized(xy2[0], xy2[1]),
            ColorRgbNormalized.fromXy(xy2[0], xy2[1], 1.0),
          );
          expect(
            () => ColorConverter.xy2colorRgbNormalized(xy3[0], xy3[1]),
            throwsAssertionError,
          );
          expect(
            () => ColorConverter.xy2colorRgbNormalized(xy4[0], xy4[1]),
            throwsAssertionError,
          );
          expect(
            () => ColorConverter.xy2colorRgbNormalized(xy5[0], xy5[1]),
            throwsAssertionError,
          );
          expect(
            ColorConverter.xy2colorRgbNormalized(xy6[0], xy6[1]),
            ColorRgbNormalized.fromXy(xy6[0], xy6[1], 1.0),
          );
        },
      );
    },
  );

  group(
    'rgb to',
    () {
      const List<int> rgb1 = [255, 0, 0];
      const List<int> rgb2 = [0, 255, 0];
      const List<int> rgb3 = [0, 0, 255];
      const List<int> rgb4 = [128, 128, 128];
      const List<int> rgb5 = [0, 0, 0];
      const List<int> rgb6 = [255, 255, 255];
      const List<int> rgb7 = [138, 72, 136];

      test(
        'xy',
        () {
          expect(
            ColorConverter.rgb2xy(rgb1[0], rgb1[1], rgb1[2]),
            [0.6400744994567747, 0.32997051063169336, 0.2126],
          );
          expect(
            ColorConverter.rgb2xy(rgb2[0], rgb2[1], rgb2[2]),
            [0.3, 0.6, 0.7152],
          );
          expect(
            ColorConverter.rgb2xy(rgb3[0], rgb3[1], rgb3[2]),
            [0.1500166223404255, 0.060006648936170214, 0.0722],
          );
          expect(
            ColorConverter.rgb2xy(rgb4[0], rgb4[1], rgb4[2]),
            [0.3127159072215825, 0.3290014805066622, 0.21586050011389923],
          );
          expect(
            ColorConverter.rgb2xy(rgb5[0], rgb5[1], rgb5[2]),
            [0.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.rgb2xy(rgb6[0], rgb6[1], rgb6[2]),
            [0.3127159072215825, 0.3290014805066623, 1.0],
          );
          expect(
            ColorConverter.rgb2xy(rgb7[0], rgb7[1], rgb7[2]),
            [0.3209554122773742, 0.21993715851681886, 0.1181557673818057],
          );
        },
      );

      test(
        'hsv',
        () {
          expect(
            ColorConverter.rgb2hsv(rgb1[0], rgb1[1], rgb1[2]),
            [0.0, 1.0, 1.0],
          );
          expect(
            ColorConverter.rgb2hsv(rgb2[0], rgb2[1], rgb2[2]),
            [120.0, 1.0, 1.0],
          );
          expect(
            ColorConverter.rgb2hsv(rgb3[0], rgb3[1], rgb3[2]),
            [240.0, 1.0, 1.0],
          );
          expect(
            ColorConverter.rgb2hsv(rgb4[0], rgb4[1], rgb4[2]),
            [0.0, 0.0, 0.5019607843137255],
          );
          expect(
            ColorConverter.rgb2hsv(rgb5[0], rgb5[1], rgb5[2]),
            [0.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.rgb2hsv(rgb6[0], rgb6[1], rgb6[2]),
            [0.0, 0.0, 1.0],
          );
          expect(
            ColorConverter.rgb2hsv(rgb7[0], rgb7[1], rgb7[2]),
            [301.8181818181818, 0.47826086956521735, 0.5411764705882353],
          );
        },
      );

      test(
        'hex',
        () {
          expect(
            ColorConverter.rgb2hex(rgb1[0], rgb1[1], rgb1[2]),
            'ffff0000',
          );
          expect(
            ColorConverter.rgb2hex(rgb2[0], rgb2[1], rgb2[2]),
            'ff00ff00',
          );
          expect(
            ColorConverter.rgb2hex(rgb3[0], rgb3[1], rgb3[2]),
            'ff0000ff',
          );
          expect(
            ColorConverter.rgb2hex(rgb4[0], rgb4[1], rgb4[2]),
            'ff808080',
          );
          expect(
            ColorConverter.rgb2hex(rgb5[0], rgb5[1], rgb5[2]),
            'ff000000',
          );
          expect(
            ColorConverter.rgb2hex(rgb6[0], rgb6[1], rgb6[2]),
            'ffffffff',
          );
          expect(
            ColorConverter.rgb2hex(rgb7[0], rgb7[1], rgb7[2]),
            'ff8a4888',
          );
        },
      );

      test(
        'hsl',
        () {
          expect(
            ColorConverter.rgb2hsl(rgb1[0], rgb1[1], rgb1[2]),
            [0.0, 1.0, 0.5],
          );
          expect(
            ColorConverter.rgb2hsl(rgb2[0], rgb2[1], rgb2[2]),
            [120.0, 1.0, 0.5],
          );
          expect(
            ColorConverter.rgb2hsl(rgb3[0], rgb3[1], rgb3[2]),
            [240.0, 1.0, 0.5],
          );
          expect(
            ColorConverter.rgb2hsl(rgb4[0], rgb4[1], rgb4[2]),
            [0.0, 0.0, 0.5019607843137255],
          );
          expect(
            ColorConverter.rgb2hsl(rgb5[0], rgb5[1], rgb5[2]),
            [0.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.rgb2hsl(rgb6[0], rgb6[1], rgb6[2]),
            [0.0, 0.0, 1.0],
          );
          expect(
            ColorConverter.rgb2hsl(rgb7[0], rgb7[1], rgb7[2]),
            [301.8181818181818, 0.3142857142857143, 0.4117647058823529],
          );
        },
      );

      test(
        'color',
        () {
          expect(
            ColorConverter.rgb2color(rgb1[0], rgb1[1], rgb1[2]),
            const Color(0xffff0000),
          );
          expect(
            ColorConverter.rgb2color(rgb2[0], rgb2[1], rgb2[2]),
            const Color(0xff00ff00),
          );
          expect(
            ColorConverter.rgb2color(rgb3[0], rgb3[1], rgb3[2]),
            const Color(0xff0000ff),
          );
          expect(
            ColorConverter.rgb2color(rgb4[0], rgb4[1], rgb4[2]),
            const Color(0xff808080),
          );
          expect(
            ColorConverter.rgb2color(rgb5[0], rgb5[1], rgb5[2]),
            const Color(0xff000000),
          );
          expect(
            ColorConverter.rgb2color(rgb6[0], rgb6[1], rgb6[2]),
            const Color(0xffffffff),
          );
          expect(
            ColorConverter.rgb2color(rgb7[0], rgb7[1], rgb7[2]),
            const Color(0xff8a4888),
          );
        },
      );

      test(
        'int',
        () {
          expect(
            ColorConverter.rgb2int(rgb1[0], rgb1[1], rgb1[2]),
            4294901760,
          );
          expect(
            ColorConverter.rgb2int(rgb2[0], rgb2[1], rgb2[2]),
            4278255360,
          );
          expect(
            ColorConverter.rgb2int(rgb3[0], rgb3[1], rgb3[2]),
            4278190335,
          );
          expect(
            ColorConverter.rgb2int(rgb4[0], rgb4[1], rgb4[2]),
            4286611584,
          );
          expect(
            ColorConverter.rgb2int(rgb5[0], rgb5[1], rgb5[2]),
            4278190080,
          );
          expect(
            ColorConverter.rgb2int(rgb6[0], rgb6[1], rgb6[2]),
            4294967295,
          );
          expect(
            ColorConverter.rgb2int(rgb7[0], rgb7[1], rgb7[2]),
            4287252616,
          );
        },
      );

      test(
        'colorXy',
        () {
          expect(
            ColorConverter.rgb2colorXy(rgb1[0], rgb1[1], rgb1[2]),
            ColorXy.fromRgb(rgb1[0], rgb1[1], rgb1[2]),
          );
          expect(
            ColorConverter.rgb2colorXy(rgb2[0], rgb2[1], rgb2[2]),
            ColorXy.fromRgb(rgb2[0], rgb2[1], rgb2[2]),
          );
          expect(
            ColorConverter.rgb2colorXy(rgb3[0], rgb3[1], rgb3[2]),
            ColorXy.fromRgb(rgb3[0], rgb3[1], rgb3[2]),
          );
          expect(
            ColorConverter.rgb2colorXy(rgb4[0], rgb4[1], rgb4[2]),
            ColorXy.fromRgb(rgb4[0], rgb4[1], rgb4[2]),
          );
          expect(
            ColorConverter.rgb2colorXy(rgb5[0], rgb5[1], rgb5[2]),
            ColorXy.fromRgb(rgb5[0], rgb5[1], rgb5[2]),
          );
          expect(
            ColorConverter.rgb2colorXy(rgb6[0], rgb6[1], rgb6[2]),
            ColorXy.fromRgb(rgb6[0], rgb6[1], rgb6[2]),
          );
          expect(
            ColorConverter.rgb2colorXy(rgb7[0], rgb7[1], rgb7[2]),
            ColorXy.fromRgb(rgb7[0], rgb7[1], rgb7[2]),
          );
        },
      );

      test(
        'colorRgb',
        () {
          expect(
            ColorConverter.rgb2colorRgb(rgb1[0], rgb1[1], rgb1[2]),
            ColorRgb(rgb1[0], rgb1[1], rgb1[2]),
          );
          expect(
            ColorConverter.rgb2colorRgb(rgb2[0], rgb2[1], rgb2[2]),
            ColorRgb(rgb2[0], rgb2[1], rgb2[2]),
          );
          expect(
            ColorConverter.rgb2colorRgb(rgb3[0], rgb3[1], rgb3[2]),
            ColorRgb(rgb3[0], rgb3[1], rgb3[2]),
          );
          expect(
            ColorConverter.rgb2colorRgb(rgb4[0], rgb4[1], rgb4[2]),
            ColorRgb(rgb4[0], rgb4[1], rgb4[2]),
          );
          expect(
            ColorConverter.rgb2colorRgb(rgb5[0], rgb5[1], rgb5[2]),
            ColorRgb(rgb5[0], rgb5[1], rgb5[2]),
          );
          expect(
            ColorConverter.rgb2colorRgb(rgb6[0], rgb6[1], rgb6[2]),
            ColorRgb(rgb6[0], rgb6[1], rgb6[2]),
          );
          expect(
            ColorConverter.rgb2colorRgb(rgb7[0], rgb7[1], rgb7[2]),
            ColorRgb(rgb7[0], rgb7[1], rgb7[2]),
          );
        },
      );

      test(
        'colorRgbNormalized',
        () {
          expect(
            ColorConverter.rgb2colorRgbNormalized(rgb1[0], rgb1[1], rgb1[2]),
            ColorRgbNormalized.fromRgb(rgb1[0], rgb1[1], rgb1[2]),
          );
          expect(
            ColorConverter.rgb2colorRgbNormalized(rgb2[0], rgb2[1], rgb2[2]),
            ColorRgbNormalized.fromRgb(rgb2[0], rgb2[1], rgb2[2]),
          );
          expect(
            ColorConverter.rgb2colorRgbNormalized(rgb3[0], rgb3[1], rgb3[2]),
            ColorRgbNormalized.fromRgb(rgb3[0], rgb3[1], rgb3[2]),
          );
          expect(
            ColorConverter.rgb2colorRgbNormalized(rgb4[0], rgb4[1], rgb4[2]),
            ColorRgbNormalized.fromRgb(rgb4[0], rgb4[1], rgb4[2]),
          );
          expect(
            ColorConverter.rgb2colorRgbNormalized(rgb5[0], rgb5[1], rgb5[2]),
            ColorRgbNormalized.fromRgb(rgb5[0], rgb5[1], rgb5[2]),
          );
          expect(
            ColorConverter.rgb2colorRgbNormalized(rgb6[0], rgb6[1], rgb6[2]),
            ColorRgbNormalized.fromRgb(rgb6[0], rgb6[1], rgb6[2]),
          );
          expect(
            ColorConverter.rgb2colorRgbNormalized(rgb7[0], rgb7[1], rgb7[2]),
            ColorRgbNormalized.fromRgb(rgb7[0], rgb7[1], rgb7[2]),
          );
        },
      );
    },
  );

  group(
    'rgb2 to',
    () {
      const List<double> rgb1 = [255 / 255.0, 0, 0];
      const List<double> rgb2 = [0, 255 / 255.0, 0];
      const List<double> rgb3 = [0, 0, 255 / 255.0];
      const List<double> rgb4 = [128 / 255.0, 128 / 255.0, 128 / 255.0];
      const List<double> rgb5 = [0, 0, 0];
      const List<double> rgb6 = [255 / 255.0, 255 / 255.0, 255 / 255.0];
      const List<double> rgb7 = [138 / 255.0, 72 / 255.0, 136 / 255.0];

      test(
        'xy',
        () {
          expect(
            ColorConverter.rgb2xy2(rgb1[0], rgb1[1], rgb1[2]),
            [0.6400744994567747, 0.32997051063169336, 0.2126],
          );
          expect(
            ColorConverter.rgb2xy2(rgb2[0], rgb2[1], rgb2[2]),
            [0.3, 0.6, 0.7152],
          );
          expect(
            ColorConverter.rgb2xy2(rgb3[0], rgb3[1], rgb3[2]),
            [0.1500166223404255, 0.060006648936170214, 0.0722],
          );
          expect(
            ColorConverter.rgb2xy2(rgb4[0], rgb4[1], rgb4[2]),
            [0.3127159072215825, 0.3290014805066622, 0.21586050011389923],
          );
          expect(
            ColorConverter.rgb2xy2(rgb5[0], rgb5[1], rgb5[2]),
            [0.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.rgb2xy2(rgb6[0], rgb6[1], rgb6[2]),
            [0.3127159072215825, 0.3290014805066623, 1.0],
          );
          expect(
            ColorConverter.rgb2xy2(rgb7[0], rgb7[1], rgb7[2]),
            [0.3209554122773742, 0.21993715851681886, 0.1181557673818057],
          );
        },
      );

      test(
        'hsv',
        () {
          expect(
            ColorConverter.rgb2hsv2(rgb1[0], rgb1[1], rgb1[2]),
            [0.0, 1.0, 1.0],
          );
          expect(
            ColorConverter.rgb2hsv2(rgb2[0], rgb2[1], rgb2[2]),
            [120.0, 1.0, 1.0],
          );
          expect(
            ColorConverter.rgb2hsv2(rgb3[0], rgb3[1], rgb3[2]),
            [240.0, 1.0, 1.0],
          );
          expect(
            ColorConverter.rgb2hsv2(rgb4[0], rgb4[1], rgb4[2]),
            [0.0, 0.0, 0.5019607843137255],
          );
          expect(
            ColorConverter.rgb2hsv2(rgb5[0], rgb5[1], rgb5[2]),
            [0.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.rgb2hsv2(rgb6[0], rgb6[1], rgb6[2]),
            [0.0, 0.0, 1.0],
          );
          expect(
            ColorConverter.rgb2hsv2(rgb7[0], rgb7[1], rgb7[2]),
            [301.8181818181818, 0.47826086956521735, 0.5411764705882353],
          );
        },
      );

      test(
        'hex',
        () {
          expect(
            ColorConverter.rgb2hex2(rgb1[0], rgb1[1], rgb1[2]),
            'ffff0000',
          );
          expect(
            ColorConverter.rgb2hex2(rgb2[0], rgb2[1], rgb2[2]),
            'ff00ff00',
          );
          expect(
            ColorConverter.rgb2hex2(rgb3[0], rgb3[1], rgb3[2]),
            'ff0000ff',
          );
          expect(
            ColorConverter.rgb2hex2(rgb4[0], rgb4[1], rgb4[2]),
            'ff808080',
          );
          expect(
            ColorConverter.rgb2hex2(rgb5[0], rgb5[1], rgb5[2]),
            'ff000000',
          );
          expect(
            ColorConverter.rgb2hex2(rgb6[0], rgb6[1], rgb6[2]),
            'ffffffff',
          );
          expect(
            ColorConverter.rgb2hex2(rgb7[0], rgb7[1], rgb7[2]),
            'ff8a4888',
          );
        },
      );

      test(
        'hsl',
        () {
          expect(
            ColorConverter.rgb2hsl2(rgb1[0], rgb1[1], rgb1[2]),
            [0.0, 1.0, 0.5],
          );
          expect(
            ColorConverter.rgb2hsl2(rgb2[0], rgb2[1], rgb2[2]),
            [120.0, 1.0, 0.5],
          );
          expect(
            ColorConverter.rgb2hsl2(rgb3[0], rgb3[1], rgb3[2]),
            [240.0, 1.0, 0.5],
          );
          expect(
            ColorConverter.rgb2hsl2(rgb4[0], rgb4[1], rgb4[2]),
            [0.0, 0.0, 0.5019607843137255],
          );
          expect(
            ColorConverter.rgb2hsl2(rgb5[0], rgb5[1], rgb5[2]),
            [0.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.rgb2hsl2(rgb6[0], rgb6[1], rgb6[2]),
            [0.0, 0.0, 1.0],
          );
          expect(
            ColorConverter.rgb2hsl2(rgb7[0], rgb7[1], rgb7[2]),
            [301.8181818181818, 0.3142857142857143, 0.4117647058823529],
          );
        },
      );

      test(
        'color',
        () {
          expect(
            ColorConverter.rgb2color2(rgb1[0], rgb1[1], rgb1[2]),
            const Color(0xffff0000),
          );
          expect(
            ColorConverter.rgb2color2(rgb2[0], rgb2[1], rgb2[2]),
            const Color(0xff00ff00),
          );
          expect(
            ColorConverter.rgb2color2(rgb3[0], rgb3[1], rgb3[2]),
            const Color(0xff0000ff),
          );
          expect(
            ColorConverter.rgb2color2(rgb4[0], rgb4[1], rgb4[2]),
            const Color(0xff808080),
          );
          expect(
            ColorConverter.rgb2color2(rgb5[0], rgb5[1], rgb5[2]),
            const Color(0xff000000),
          );
          expect(
            ColorConverter.rgb2color2(rgb6[0], rgb6[1], rgb6[2]),
            const Color(0xffffffff),
          );
          expect(
            ColorConverter.rgb2color2(rgb7[0], rgb7[1], rgb7[2]),
            const Color(0xff8a4888),
          );
        },
      );

      test(
        'int',
        () {
          expect(
            ColorConverter.rgb2int2(rgb1[0], rgb1[1], rgb1[2]),
            4294901760,
          );
          expect(
            ColorConverter.rgb2int2(rgb2[0], rgb2[1], rgb2[2]),
            4278255360,
          );
          expect(
            ColorConverter.rgb2int2(rgb3[0], rgb3[1], rgb3[2]),
            4278190335,
          );
          expect(
            ColorConverter.rgb2int2(rgb4[0], rgb4[1], rgb4[2]),
            4286611584,
          );
          expect(
            ColorConverter.rgb2int2(rgb5[0], rgb5[1], rgb5[2]),
            4278190080,
          );
          expect(
            ColorConverter.rgb2int2(rgb6[0], rgb6[1], rgb6[2]),
            4294967295,
          );
          expect(
            ColorConverter.rgb2int2(rgb7[0], rgb7[1], rgb7[2]),
            4287252616,
          );
        },
      );

      test(
        'colorXy',
        () {
          expect(
            ColorConverter.rgb2colorXy2(rgb1[0], rgb1[1], rgb1[2]),
            ColorXy.fromRgbNormalized(rgb1[0], rgb1[1], rgb1[2]),
          );
          expect(
            ColorConverter.rgb2colorXy2(rgb2[0], rgb2[1], rgb2[2]),
            ColorXy.fromRgbNormalized(rgb2[0], rgb2[1], rgb2[2]),
          );
          expect(
            ColorConverter.rgb2colorXy2(rgb3[0], rgb3[1], rgb3[2]),
            ColorXy.fromRgbNormalized(rgb3[0], rgb3[1], rgb3[2]),
          );
          expect(
            ColorConverter.rgb2colorXy2(rgb4[0], rgb4[1], rgb4[2]),
            ColorXy.fromRgbNormalized(rgb4[0], rgb4[1], rgb4[2]),
          );
          expect(
            ColorConverter.rgb2colorXy2(rgb5[0], rgb5[1], rgb5[2]),
            ColorXy.fromRgbNormalized(rgb5[0], rgb5[1], rgb5[2]),
          );
          expect(
            ColorConverter.rgb2colorXy2(rgb6[0], rgb6[1], rgb6[2]),
            ColorXy.fromRgbNormalized(rgb6[0], rgb6[1], rgb6[2]),
          );
          expect(
            ColorConverter.rgb2colorXy2(rgb7[0], rgb7[1], rgb7[2]),
            ColorXy.fromRgbNormalized(rgb7[0], rgb7[1], rgb7[2]),
          );
        },
      );

      test(
        'colorRgb',
        () {
          expect(
            ColorConverter.rgb2colorRgb2(rgb1[0], rgb1[1], rgb1[2]),
            ColorRgb.fromRgbNormalized(rgb1[0], rgb1[1], rgb1[2]),
          );
          expect(
            ColorConverter.rgb2colorRgb2(rgb2[0], rgb2[1], rgb2[2]),
            ColorRgb.fromRgbNormalized(rgb2[0], rgb2[1], rgb2[2]),
          );
          expect(
            ColorConverter.rgb2colorRgb2(rgb3[0], rgb3[1], rgb3[2]),
            ColorRgb.fromRgbNormalized(rgb3[0], rgb3[1], rgb3[2]),
          );
          expect(
            ColorConverter.rgb2colorRgb2(rgb4[0], rgb4[1], rgb4[2]),
            ColorRgb.fromRgbNormalized(rgb4[0], rgb4[1], rgb4[2]),
          );
          expect(
            ColorConverter.rgb2colorRgb2(rgb5[0], rgb5[1], rgb5[2]),
            ColorRgb.fromRgbNormalized(rgb5[0], rgb5[1], rgb5[2]),
          );
          expect(
            ColorConverter.rgb2colorRgb2(rgb6[0], rgb6[1], rgb6[2]),
            ColorRgb.fromRgbNormalized(rgb6[0], rgb6[1], rgb6[2]),
          );
          expect(
            ColorConverter.rgb2colorRgb2(rgb7[0], rgb7[1], rgb7[2]),
            ColorRgb.fromRgbNormalized(rgb7[0], rgb7[1], rgb7[2]),
          );
        },
      );

      test(
        'colorRgbNormalized',
        () {
          expect(
            ColorConverter.rgb2colorRgbNormalized2(rgb1[0], rgb1[1], rgb1[2]),
            ColorRgbNormalized(rgb1[0], rgb1[1], rgb1[2]),
          );
          expect(
            ColorConverter.rgb2colorRgbNormalized2(rgb2[0], rgb2[1], rgb2[2]),
            ColorRgbNormalized(rgb2[0], rgb2[1], rgb2[2]),
          );
          expect(
            ColorConverter.rgb2colorRgbNormalized2(rgb3[0], rgb3[1], rgb3[2]),
            ColorRgbNormalized(rgb3[0], rgb3[1], rgb3[2]),
          );
          expect(
            ColorConverter.rgb2colorRgbNormalized2(rgb4[0], rgb4[1], rgb4[2]),
            ColorRgbNormalized(rgb4[0], rgb4[1], rgb4[2]),
          );
          expect(
            ColorConverter.rgb2colorRgbNormalized2(rgb5[0], rgb5[1], rgb5[2]),
            ColorRgbNormalized(rgb5[0], rgb5[1], rgb5[2]),
          );
          expect(
            ColorConverter.rgb2colorRgbNormalized2(rgb6[0], rgb6[1], rgb6[2]),
            ColorRgbNormalized(rgb6[0], rgb6[1], rgb6[2]),
          );
          expect(
            ColorConverter.rgb2colorRgbNormalized2(rgb7[0], rgb7[1], rgb7[2]),
            ColorRgbNormalized(rgb7[0], rgb7[1], rgb7[2]),
          );
        },
      );
    },
  );

  group(
    'hsv to',
    () {
      const List<double> hsv1 = [0.0, 1.0, 1.0];
      const List<double> hsv2 = [120.0, 1.0, 1.0];
      const List<double> hsv3 = [240.0, 1.0, 1.0];
      const List<double> hsv4 = [0.0, 0.0, 0.5019607843137255];
      const List<double> hsv5 = [0.0, 0.0, 0.0];
      const List<double> hsv6 = [0.0, 0.0, 1.0];
      const List<double> hsv7 = [
        302.0,
        0.47826086956521735,
        0.5411764705882353
      ];

      test(
        'xy',
        () {
          expect(
            ColorConverter.hsv2xy(hsv1[0].toInt(), hsv1[1], hsv1[2]),
            [0.6400744994567747, 0.32997051063169336, 0.2126],
          );
          expect(
            ColorConverter.hsv2xy(hsv2[0].toInt(), hsv2[1], hsv2[2]),
            [0.3, 0.6, 0.7152],
          );
          expect(
            ColorConverter.hsv2xy(hsv3[0].toInt(), hsv3[1], hsv3[2]),
            [0.1500166223404255, 0.060006648936170214, 0.0722],
          );
          expect(
            ColorConverter.hsv2xy(hsv4[0].toInt(), hsv4[1], hsv4[2]),
            [0.3127159072215825, 0.3290014805066622, 0.21586050011389923],
          );
          expect(
            ColorConverter.hsv2xy(hsv5[0].toInt(), hsv5[1], hsv5[2]),
            [0.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.hsv2xy(hsv6[0].toInt(), hsv6[1], hsv6[2]),
            [0.3127159072215825, 0.3290014805066623, 1.0],
          );
          expect(
            ColorConverter.hsv2xy(hsv7[0].toInt(), hsv7[1], hsv7[2]),
            [0.32125723426783265, 0.22021954348487954, 0.11809894756916556],
          );
        },
      );

      test(
        'rgb',
        () {
          expect(
            ColorConverter.hsv2rgb(hsv1[0].toInt(), hsv1[1], hsv1[2]),
            [255, 0, 0],
          );
          expect(
            ColorConverter.hsv2rgb(hsv2[0].toInt(), hsv2[1], hsv2[2]),
            [0, 255, 0],
          );
          expect(
            ColorConverter.hsv2rgb(hsv3[0].toInt(), hsv3[1], hsv3[2]),
            [0, 0, 255],
          );
          expect(
            ColorConverter.hsv2rgb(hsv4[0].toInt(), hsv4[1], hsv4[2]),
            [128, 128, 128],
          );
          expect(
            ColorConverter.hsv2rgb(hsv5[0].toInt(), hsv5[1], hsv5[2]),
            [0, 0, 0],
          );
          expect(
            ColorConverter.hsv2rgb(hsv6[0].toInt(), hsv6[1], hsv6[2]),
            [255, 255, 255],
          );
          expect(
            ColorConverter.hsv2rgb(hsv7[0].toInt(), hsv7[1], hsv7[2]),
            [138, 72, 136],
          );
        },
      );

      test(
        'rgb2',
        () {
          expect(
            ColorConverter.hsv2rgb2(hsv1[0].toInt(), hsv1[1], hsv1[2]),
            [1.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.hsv2rgb2(hsv2[0].toInt(), hsv2[1], hsv2[2]),
            [0.0, 1.0, 0.0],
          );
          expect(
            ColorConverter.hsv2rgb2(hsv3[0].toInt(), hsv3[1], hsv3[2]),
            [0.0, 0.0, 1.0],
          );
          expect(
            ColorConverter.hsv2rgb2(hsv4[0].toInt(), hsv4[1], hsv4[2]),
            [0.5019607843137255, 0.5019607843137255, 0.5019607843137255],
          );
          expect(
            ColorConverter.hsv2rgb2(hsv5[0].toInt(), hsv5[1], hsv5[2]),
            [0.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.hsv2rgb2(hsv6[0].toInt(), hsv6[1], hsv6[2]),
            [1.0, 1.0, 1.0],
          );
          expect(
            ColorConverter.hsv2rgb2(hsv7[0].toInt(), hsv7[1], hsv7[2]),
            [0.5411764705882353, 0.2823529411764706, 0.5325490196078431],
          );
        },
      );

      test(
        'hex',
        () {
          expect(
            ColorConverter.hsv2hex(hsv1[0].toInt(), hsv1[1], hsv1[2]),
            'ffff0000',
          );
          expect(
            ColorConverter.hsv2hex(hsv2[0].toInt(), hsv2[1], hsv2[2]),
            'ff00ff00',
          );
          expect(
            ColorConverter.hsv2hex(hsv3[0].toInt(), hsv3[1], hsv3[2]),
            'ff0000ff',
          );
          expect(
            ColorConverter.hsv2hex(hsv4[0].toInt(), hsv4[1], hsv4[2]),
            'ff808080',
          );
          expect(
            ColorConverter.hsv2hex(hsv5[0].toInt(), hsv5[1], hsv5[2]),
            'ff000000',
          );
          expect(
            ColorConverter.hsv2hex(hsv6[0].toInt(), hsv6[1], hsv6[2]),
            'ffffffff',
          );
          expect(
            ColorConverter.hsv2hex(hsv7[0].toInt(), hsv7[1], hsv7[2]),
            'ff8a4888',
          );
        },
      );

      test(
        'hsl',
        () {
          expect(
            ColorConverter.hsv2hsl(hsv1[0].toInt(), hsv1[1], hsv1[2]),
            [0.0, 1.0, 0.5],
          );
          expect(
            ColorConverter.hsv2hsl(hsv2[0].toInt(), hsv2[1], hsv2[2]),
            [120.0, 1.0, 0.5],
          );
          expect(
            ColorConverter.hsv2hsl(hsv3[0].toInt(), hsv3[1], hsv3[2]),
            [240.0, 1.0, 0.5],
          );
          expect(
            ColorConverter.hsv2hsl(hsv4[0].toInt(), hsv4[1], hsv4[2]),
            [0.0, 0.0, 0.5019607843137255],
          );
          expect(
            ColorConverter.hsv2hsl(hsv5[0].toInt(), hsv5[1], hsv5[2]),
            [0.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.hsv2hsl(hsv6[0].toInt(), hsv6[1], hsv6[2]),
            [0.0, 0.0, 1.0],
          );
          expect(
            ColorConverter.hsv2hsl(hsv7[0].toInt(), hsv7[1], hsv7[2]),
            [302.0, 0.3142857142857143, 0.4117647058823529],
          );
        },
      );

      test(
        'color',
        () {
          expect(
            ColorConverter.hsv2color(hsv1[0].toInt(), hsv1[1], hsv1[2]),
            const Color(0xffff0000),
          );
          expect(
            ColorConverter.hsv2color(hsv2[0].toInt(), hsv2[1], hsv2[2]),
            const Color(0xff00ff00),
          );
          expect(
            ColorConverter.hsv2color(hsv3[0].toInt(), hsv3[1], hsv3[2]),
            const Color(0xff0000ff),
          );
          expect(
            ColorConverter.hsv2color(hsv4[0].toInt(), hsv4[1], hsv4[2]),
            const Color(0xff808080),
          );
          expect(
            ColorConverter.hsv2color(hsv5[0].toInt(), hsv5[1], hsv5[2]),
            const Color(0xff000000),
          );
          expect(
            ColorConverter.hsv2color(hsv6[0].toInt(), hsv6[1], hsv6[2]),
            const Color(0xffffffff),
          );

          final Color expectedColor7 = const Color.from(
            alpha: 1.0,
            red: 0.5411764705882353,
            green: 0.2823529411764706,
            blue: 0.5325490196078431,
          );
          final Color actualColor7 =
              ColorConverter.hsv2color(hsv7[0].toInt(), hsv7[1], hsv7[2]);
          expect(actualColor7.a, expectedColor7.a);
          expect(actualColor7.r, expectedColor7.r);
          expect(actualColor7.g, expectedColor7.g);
          expect(actualColor7.b, expectedColor7.b);
        },
      );

      test(
        'int',
        () {
          expect(
            ColorConverter.hsv2int(hsv1[0].toInt(), hsv1[1], hsv1[2]),
            4294901760,
          );
          expect(
            ColorConverter.hsv2int(hsv2[0].toInt(), hsv2[1], hsv2[2]),
            4278255360,
          );
          expect(
            ColorConverter.hsv2int(hsv3[0].toInt(), hsv3[1], hsv3[2]),
            4278190335,
          );
          expect(
            ColorConverter.hsv2int(hsv4[0].toInt(), hsv4[1], hsv4[2]),
            4286611584,
          );
          expect(
            ColorConverter.hsv2int(hsv5[0].toInt(), hsv5[1], hsv5[2]),
            4278190080,
          );
          expect(
            ColorConverter.hsv2int(hsv6[0].toInt(), hsv6[1], hsv6[2]),
            4294967295,
          );
          expect(
            ColorConverter.hsv2int(hsv7[0].toInt(), hsv7[1], hsv7[2]),
            4287252616,
          );
        },
      );

      test(
        'colorXy',
        () {
          final List<double> rgb1 =
              ColorConverter.hsv2rgb2(hsv1[0].toInt(), hsv1[1], hsv1[2]);
          expect(
            ColorConverter.hsv2colorXy(hsv1[0].toInt(), hsv1[1], hsv1[2]),
            ColorXy.fromRgbNormalized(rgb1[0], rgb1[1], rgb1[2], 0.2126),
          );
          final List<double> rgb2 =
              ColorConverter.hsv2rgb2(hsv2[0].toInt(), hsv2[1], hsv2[2]);
          expect(
            ColorConverter.hsv2colorXy(hsv2[0].toInt(), hsv2[1], hsv2[2]),
            ColorXy.fromRgbNormalized(rgb2[0], rgb2[1], rgb2[2], 0.7152),
          );
          final List<double> rgb3 =
              ColorConverter.hsv2rgb2(hsv3[0].toInt(), hsv3[1], hsv3[2]);
          expect(
            ColorConverter.hsv2colorXy(hsv3[0].toInt(), hsv3[1], hsv3[2]),
            ColorXy.fromRgbNormalized(rgb3[0], rgb3[1], rgb3[2], 0.0722),
          );
          final List<double> rgb4 =
              ColorConverter.hsv2rgb2(hsv4[0].toInt(), hsv4[1], hsv4[2]);
          expect(
            ColorConverter.hsv2colorXy(hsv4[0].toInt(), hsv4[1], hsv4[2]),
            ColorXy.fromRgbNormalized(
                rgb4[0], rgb4[1], rgb4[2], 0.21586050011389923),
          );
          final List<double> rgb5 =
              ColorConverter.hsv2rgb2(hsv5[0].toInt(), hsv5[1], hsv5[2]);
          expect(
            ColorConverter.hsv2colorXy(hsv5[0].toInt(), hsv5[1], hsv5[2]),
            ColorXy.fromRgbNormalized(rgb5[0], rgb5[1], rgb5[2], 0.0),
          );
          final List<double> rgb6 =
              ColorConverter.hsv2rgb2(hsv6[0].toInt(), hsv6[1], hsv6[2]);
          expect(
            ColorConverter.hsv2colorXy(hsv6[0].toInt(), hsv6[1], hsv6[2]),
            ColorXy.fromRgbNormalized(rgb6[0], rgb6[1], rgb6[2], 1.0),
          );
          final List<double> rgb7 =
              ColorConverter.hsv2rgb2(hsv7[0].toInt(), hsv7[1], hsv7[2]);
          expect(
            ColorConverter.hsv2colorXy(hsv7[0].toInt(), hsv7[1], hsv7[2]),
            ColorXy.fromRgbNormalized(
                rgb7[0], rgb7[1], rgb7[2], 0.11809894756916556),
          );
        },
      );

      test(
        'colorRgb',
        () {
          final List<double> rgb1 =
              ColorConverter.hsv2rgb2(hsv1[0].toInt(), hsv1[1], hsv1[2]);
          expect(
            ColorConverter.hsv2colorRgb(hsv1[0].toInt(), hsv1[1], hsv1[2]),
            ColorRgb.fromRgbNormalized(rgb1[0], rgb1[1], rgb1[2]),
          );
          final List<double> rgb2 =
              ColorConverter.hsv2rgb2(hsv2[0].toInt(), hsv2[1], hsv2[2]);
          expect(
            ColorConverter.hsv2colorRgb(hsv2[0].toInt(), hsv2[1], hsv2[2]),
            ColorRgb.fromRgbNormalized(rgb2[0], rgb2[1], rgb2[2]),
          );
          final List<double> rgb3 =
              ColorConverter.hsv2rgb2(hsv3[0].toInt(), hsv3[1], hsv3[2]);
          expect(
            ColorConverter.hsv2colorRgb(hsv3[0].toInt(), hsv3[1], hsv3[2]),
            ColorRgb.fromRgbNormalized(rgb3[0], rgb3[1], rgb3[2]),
          );
          final List<double> rgb4 =
              ColorConverter.hsv2rgb2(hsv4[0].toInt(), hsv4[1], hsv4[2]);
          expect(
            ColorConverter.hsv2colorRgb(hsv4[0].toInt(), hsv4[1], hsv4[2]),
            ColorRgb.fromRgbNormalized(rgb4[0], rgb4[1], rgb4[2]),
          );
          final List<double> rgb5 =
              ColorConverter.hsv2rgb2(hsv5[0].toInt(), hsv5[1], hsv5[2]);
          expect(
            ColorConverter.hsv2colorRgb(hsv5[0].toInt(), hsv5[1], hsv5[2]),
            ColorRgb.fromRgbNormalized(rgb5[0], rgb5[1], rgb5[2]),
          );
          final List<double> rgb6 =
              ColorConverter.hsv2rgb2(hsv6[0].toInt(), hsv6[1], hsv6[2]);
          expect(
            ColorConverter.hsv2colorRgb(hsv6[0].toInt(), hsv6[1], hsv6[2]),
            ColorRgb.fromRgbNormalized(rgb6[0], rgb6[1], rgb6[2]),
          );
          final List<double> rgb7 =
              ColorConverter.hsv2rgb2(hsv7[0].toInt(), hsv7[1], hsv7[2]);
          expect(
            ColorConverter.hsv2colorRgb(hsv7[0].toInt(), hsv7[1], hsv7[2]),
            ColorRgb.fromRgbNormalized(rgb7[0], rgb7[1], rgb7[2]),
          );
        },
      );

      test(
        'colorRgbNormalized',
        () {
          final List<double> rgb1 =
              ColorConverter.hsv2rgb2(hsv1[0].toInt(), hsv1[1], hsv1[2]);
          expect(
            ColorConverter.hsv2colorRgbNormalized(
                hsv1[0].toInt(), hsv1[1], hsv1[2]),
            ColorRgbNormalized(rgb1[0], rgb1[1], rgb1[2]),
          );
          final List<double> rgb2 =
              ColorConverter.hsv2rgb2(hsv2[0].toInt(), hsv2[1], hsv2[2]);
          expect(
            ColorConverter.hsv2colorRgbNormalized(
                hsv2[0].toInt(), hsv2[1], hsv2[2]),
            ColorRgbNormalized(rgb2[0], rgb2[1], rgb2[2]),
          );
          final List<double> rgb3 =
              ColorConverter.hsv2rgb2(hsv3[0].toInt(), hsv3[1], hsv3[2]);
          expect(
            ColorConverter.hsv2colorRgbNormalized(
                hsv3[0].toInt(), hsv3[1], hsv3[2]),
            ColorRgbNormalized(rgb3[0], rgb3[1], rgb3[2]),
          );
          final List<double> rgb4 =
              ColorConverter.hsv2rgb2(hsv4[0].toInt(), hsv4[1], hsv4[2]);
          expect(
            ColorConverter.hsv2colorRgbNormalized(
                hsv4[0].toInt(), hsv4[1], hsv4[2]),
            ColorRgbNormalized(rgb4[0], rgb4[1], rgb4[2]),
          );
          final List<double> rgb5 =
              ColorConverter.hsv2rgb2(hsv5[0].toInt(), hsv5[1], hsv5[2]);
          expect(
            ColorConverter.hsv2colorRgbNormalized(
                hsv5[0].toInt(), hsv5[1], hsv5[2]),
            ColorRgbNormalized(rgb5[0], rgb5[1], rgb5[2]),
          );
          final List<double> rgb6 =
              ColorConverter.hsv2rgb2(hsv6[0].toInt(), hsv6[1], hsv6[2]);
          expect(
            ColorConverter.hsv2colorRgbNormalized(
                hsv6[0].toInt(), hsv6[1], hsv6[2]),
            ColorRgbNormalized(rgb6[0], rgb6[1], rgb6[2]),
          );
          final List<double> rgb7 =
              ColorConverter.hsv2rgb2(hsv7[0].toInt(), hsv7[1], hsv7[2]);
          expect(
            ColorConverter.hsv2colorRgbNormalized(
                hsv7[0].toInt(), hsv7[1], hsv7[2]),
            ColorRgbNormalized(rgb7[0], rgb7[1], rgb7[2]),
          );
        },
      );
    },
  );

  group(
    'hex to',
    () {
      const String hex1 = '0xffff0000';
      const String hex2 = '#ff00ff00';
      const String hex3 = 'ff0000ff';
      const String hex4 = 'ff808080';
      const String hex5 = 'ff000000';
      const String hex6 = 'ffffffff';
      const String hex7 = 'ff8a4888';

      const String hex8 = '0xff0000';
      const String hex9 = '#00ff00';
      const String hex10 = '0000ff';
      const String hex11 = '808080';
      const String hex12 = '000000';
      const String hex13 = 'ffffff';
      const String hex14 = '8a4888';

      const String hex15 = '0xf00';
      const String hex16 = '#0f0';
      const String hex17 = '00f';
      const String hex18 = '000';
      const String hex19 = 'fff';

      test(
        'xy',
        () {
          expect(
            ColorConverter.hex2xy(hex1),
            [0.6400744994567747, 0.32997051063169336, 0.2126],
          );
          expect(
            ColorConverter.hex2xy(hex2),
            [0.3, 0.6, 0.7152],
          );
          expect(
            ColorConverter.hex2xy(hex3),
            [0.1500166223404255, 0.060006648936170214, 0.0722],
          );
          expect(
            ColorConverter.hex2xy(hex4),
            [0.3127159072215825, 0.3290014805066622, 0.21586050011389923],
          );
          expect(
            ColorConverter.hex2xy(hex5),
            [0.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.hex2xy(hex6),
            [0.3127159072215825, 0.3290014805066623, 1.0],
          );
          expect(
            ColorConverter.hex2xy(hex7),
            [0.3209554122773742, 0.21993715851681886, 0.1181557673818057],
          );

          expect(
            ColorConverter.hex2xy(hex8),
            [0.6400744994567747, 0.32997051063169336, 0.2126],
          );
          expect(
            ColorConverter.hex2xy(hex9),
            [0.3, 0.6, 0.7152],
          );
          expect(
            ColorConverter.hex2xy(hex10),
            [0.1500166223404255, 0.060006648936170214, 0.0722],
          );
          expect(
            ColorConverter.hex2xy(hex11),
            [0.3127159072215825, 0.3290014805066622, 0.21586050011389923],
          );
          expect(
            ColorConverter.hex2xy(hex12),
            [0.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.hex2xy(hex13),
            [0.3127159072215825, 0.3290014805066623, 1.0],
          );
          expect(
            ColorConverter.hex2xy(hex14),
            [0.3209554122773742, 0.21993715851681886, 0.1181557673818057],
          );

          expect(
            ColorConverter.hex2xy(hex15),
            [0.6400744994567747, 0.32997051063169336, 0.2126],
          );
          expect(
            ColorConverter.hex2xy(hex16),
            [0.3, 0.6, 0.7152],
          );
          expect(
            ColorConverter.hex2xy(hex17),
            [0.1500166223404255, 0.060006648936170214, 0.0722],
          );
          expect(
            ColorConverter.hex2xy(hex18),
            [0.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.hex2xy(hex19),
            [0.3127159072215825, 0.3290014805066623, 1.0],
          );
        },
      );

      test(
        'rgb',
        () {
          expect(
            ColorConverter.hex2rgb(hex1),
            [255, 0, 0],
          );
          expect(
            ColorConverter.hex2rgb(hex2),
            [0, 255, 0],
          );
          expect(
            ColorConverter.hex2rgb(hex3),
            [0, 0, 255],
          );
          expect(
            ColorConverter.hex2rgb(hex4),
            [128, 128, 128],
          );
          expect(
            ColorConverter.hex2rgb(hex5),
            [0, 0, 0],
          );
          expect(
            ColorConverter.hex2rgb(hex6),
            [255, 255, 255],
          );
          expect(
            ColorConverter.hex2rgb(hex7),
            [138, 72, 136],
          );

          expect(
            ColorConverter.hex2rgb(hex8),
            [255, 0, 0],
          );
          expect(
            ColorConverter.hex2rgb(hex9),
            [0, 255, 0],
          );
          expect(
            ColorConverter.hex2rgb(hex10),
            [0, 0, 255],
          );
          expect(
            ColorConverter.hex2rgb(hex11),
            [128, 128, 128],
          );
          expect(
            ColorConverter.hex2rgb(hex12),
            [0, 0, 0],
          );
          expect(
            ColorConverter.hex2rgb(hex13),
            [255, 255, 255],
          );
          expect(
            ColorConverter.hex2rgb(hex14),
            [138, 72, 136],
          );

          expect(
            ColorConverter.hex2rgb(hex15),
            [255, 0, 0],
          );
          expect(
            ColorConverter.hex2rgb(hex16),
            [0, 255, 0],
          );
          expect(
            ColorConverter.hex2rgb(hex17),
            [0, 0, 255],
          );
          expect(
            ColorConverter.hex2rgb(hex18),
            [0, 0, 0],
          );
          expect(
            ColorConverter.hex2rgb(hex19),
            [255, 255, 255],
          );
        },
      );

      test(
        'rgb2',
        () {
          expect(
            ColorConverter.hex2rgb2(hex1),
            [1.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.hex2rgb2(hex2),
            [0.0, 1.0, 0.0],
          );
          expect(
            ColorConverter.hex2rgb2(hex3),
            [0.0, 0.0, 1.0],
          );
          expect(
            ColorConverter.hex2rgb2(hex4),
            [0.5019607843137255, 0.5019607843137255, 0.5019607843137255],
          );
          expect(
            ColorConverter.hex2rgb2(hex5),
            [0.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.hex2rgb2(hex6),
            [1.0, 1.0, 1.0],
          );
          expect(
            ColorConverter.hex2rgb2(hex7),
            [0.5411764705882353, 0.2823529411764706, 0.5333333333333333],
          );

          expect(
            ColorConverter.hex2rgb2(hex8),
            [1.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.hex2rgb2(hex9),
            [0.0, 1.0, 0.0],
          );
          expect(
            ColorConverter.hex2rgb2(hex10),
            [0.0, 0.0, 1.0],
          );
          expect(
            ColorConverter.hex2rgb2(hex11),
            [0.5019607843137255, 0.5019607843137255, 0.5019607843137255],
          );
          expect(
            ColorConverter.hex2rgb2(hex12),
            [0.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.hex2rgb2(hex13),
            [1.0, 1.0, 1.0],
          );
          expect(
            ColorConverter.hex2rgb2(hex14),
            [0.5411764705882353, 0.2823529411764706, 0.5333333333333333],
          );

          expect(
            ColorConverter.hex2rgb2(hex15),
            [1.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.hex2rgb2(hex16),
            [0.0, 1.0, 0.0],
          );
          expect(
            ColorConverter.hex2rgb2(hex17),
            [0.0, 0.0, 1.0],
          );
          expect(
            ColorConverter.hex2rgb2(hex18),
            [0.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.hex2rgb2(hex19),
            [1.0, 1.0, 1.0],
          );
        },
      );

      test(
        'hsv',
        () {
          expect(
            ColorConverter.hex2hsv(hex1),
            [0.0, 1.0, 1.0],
          );
          expect(
            ColorConverter.hex2hsv(hex2),
            [120.0, 1.0, 1.0],
          );
          expect(
            ColorConverter.hex2hsv(hex3),
            [240.0, 1.0, 1.0],
          );
          expect(
            ColorConverter.hex2hsv(hex4),
            [0.0, 0.0, 0.5019607843137255],
          );
          expect(
            ColorConverter.hex2hsv(hex5),
            [0.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.hex2hsv(hex6),
            [0.0, 0.0, 1.0],
          );
          expect(
            ColorConverter.hex2hsv(hex7),
            [301.8181818181818, 0.47826086956521735, 0.5411764705882353],
          );

          expect(
            ColorConverter.hex2hsv(hex8),
            [0.0, 1.0, 1.0],
          );
          expect(
            ColorConverter.hex2hsv(hex9),
            [120.0, 1.0, 1.0],
          );
          expect(
            ColorConverter.hex2hsv(hex10),
            [240.0, 1.0, 1.0],
          );
          expect(
            ColorConverter.hex2hsv(hex11),
            [0.0, 0.0, 0.5019607843137255],
          );
          expect(
            ColorConverter.hex2hsv(hex12),
            [0.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.hex2hsv(hex13),
            [0.0, 0.0, 1.0],
          );
          expect(
            ColorConverter.hex2hsv(hex14),
            [301.8181818181818, 0.47826086956521735, 0.5411764705882353],
          );

          expect(
            ColorConverter.hex2hsv(hex15),
            [0.0, 1.0, 1.0],
          );
          expect(
            ColorConverter.hex2hsv(hex16),
            [120.0, 1.0, 1.0],
          );
          expect(
            ColorConverter.hex2hsv(hex17),
            [240.0, 1.0, 1.0],
          );
          expect(
            ColorConverter.hex2hsv(hex18),
            [0.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.hex2hsv(hex19),
            [0.0, 0.0, 1.0],
          );
        },
      );

      test(
        'hsl',
        () {
          expect(
            ColorConverter.hex2hsl(hex1),
            [0.0, 1.0, 0.5],
          );
          expect(
            ColorConverter.hex2hsl(hex2),
            [120.0, 1.0, 0.5],
          );
          expect(
            ColorConverter.hex2hsl(hex3),
            [240.0, 1.0, 0.5],
          );
          expect(
            ColorConverter.hex2hsl(hex4),
            [0.0, 0.0, 0.5019607843137255],
          );
          expect(
            ColorConverter.hex2hsl(hex5),
            [0.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.hex2hsl(hex6),
            [0.0, 0.0, 1.0],
          );
          expect(
            ColorConverter.hex2hsl(hex7),
            [301.8181818181818, 0.3142857142857143, 0.4117647058823529],
          );

          expect(
            ColorConverter.hex2hsl(hex8),
            [0.0, 1.0, 0.5],
          );
          expect(
            ColorConverter.hex2hsl(hex9),
            [120.0, 1.0, 0.5],
          );
          expect(
            ColorConverter.hex2hsl(hex10),
            [240.0, 1.0, 0.5],
          );
          expect(
            ColorConverter.hex2hsl(hex11),
            [0.0, 0.0, 0.5019607843137255],
          );
          expect(
            ColorConverter.hex2hsl(hex12),
            [0.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.hex2hsl(hex13),
            [0.0, 0.0, 1.0],
          );
          expect(
            ColorConverter.hex2hsl(hex14),
            [301.8181818181818, 0.3142857142857143, 0.4117647058823529],
          );

          expect(
            ColorConverter.hex2hsl(hex15),
            [0.0, 1.0, 0.5],
          );
          expect(
            ColorConverter.hex2hsl(hex16),
            [120.0, 1.0, 0.5],
          );
          expect(
            ColorConverter.hex2hsl(hex17),
            [240.0, 1.0, 0.5],
          );
          expect(
            ColorConverter.hex2hsl(hex18),
            [0.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.hex2hsl(hex19),
            [0.0, 0.0, 1.0],
          );
        },
      );

      test(
        'color',
        () {
          expect(
            ColorConverter.hex2color(hex1),
            const Color(0xffff0000),
          );
          expect(
            ColorConverter.hex2color(hex2),
            const Color(0xff00ff00),
          );
          expect(
            ColorConverter.hex2color(hex3),
            const Color(0xff0000ff),
          );
          expect(
            ColorConverter.hex2color(hex4),
            const Color(0xff808080),
          );
          expect(
            ColorConverter.hex2color(hex5),
            const Color(0xff000000),
          );
          expect(
            ColorConverter.hex2color(hex6),
            const Color(0xffffffff),
          );
          expect(
            ColorConverter.hex2color(hex7),
            const Color(0xff8a4888),
          );

          expect(
            ColorConverter.hex2color(hex8),
            const Color(0xffff0000),
          );
          expect(
            ColorConverter.hex2color(hex9),
            const Color(0xff00ff00),
          );
          expect(
            ColorConverter.hex2color(hex10),
            const Color(0xff0000ff),
          );
          expect(
            ColorConverter.hex2color(hex11),
            const Color(0xff808080),
          );
          expect(
            ColorConverter.hex2color(hex12),
            const Color(0xff000000),
          );
          expect(
            ColorConverter.hex2color(hex13),
            const Color(0xffffffff),
          );
          expect(
            ColorConverter.hex2color(hex14),
            const Color(0xff8a4888),
          );

          expect(
            ColorConverter.hex2color(hex15),
            const Color(0xffff0000),
          );
          expect(
            ColorConverter.hex2color(hex16),
            const Color(0xff00ff00),
          );
          expect(
            ColorConverter.hex2color(hex17),
            const Color(0xff0000ff),
          );
          expect(
            ColorConverter.hex2color(hex18),
            const Color(0xff000000),
          );
          expect(
            ColorConverter.hex2color(hex19),
            const Color(0xffffffff),
          );
        },
      );

      test(
        'int',
        () {
          expect(
            ColorConverter.hex2int(hex1),
            4294901760,
          );
          expect(
            ColorConverter.hex2int(hex2),
            4278255360,
          );
          expect(
            ColorConverter.hex2int(hex3),
            4278190335,
          );
          expect(
            ColorConverter.hex2int(hex4),
            4286611584,
          );
          expect(
            ColorConverter.hex2int(hex5),
            4278190080,
          );
          expect(
            ColorConverter.hex2int(hex6),
            4294967295,
          );
          expect(
            ColorConverter.hex2int(hex7),
            4287252616,
          );

          expect(
            ColorConverter.hex2int(hex8),
            4294901760,
          );
          expect(
            ColorConverter.hex2int(hex9),
            4278255360,
          );
          expect(
            ColorConverter.hex2int(hex10),
            4278190335,
          );
          expect(
            ColorConverter.hex2int(hex11),
            4286611584,
          );
          expect(
            ColorConverter.hex2int(hex12),
            4278190080,
          );
          expect(
            ColorConverter.hex2int(hex13),
            4294967295,
          );
          expect(
            ColorConverter.hex2int(hex14),
            4287252616,
          );

          expect(
            ColorConverter.hex2int(hex15),
            4294901760,
          );
          expect(
            ColorConverter.hex2int(hex16),
            4278255360,
          );
          expect(
            ColorConverter.hex2int(hex17),
            4278190335,
          );
          expect(
            ColorConverter.hex2int(hex18),
            4278190080,
          );
          expect(
            ColorConverter.hex2int(hex19),
            4294967295,
          );
        },
      );

      test(
        'colorXy',
        () {
          final List<double> rgb1 = ColorConverter.hex2rgb2(hex1);
          final ColorXy expectedColor1 =
              ColorXy.fromRgbNormalized(rgb1[0], rgb1[1], rgb1[2]);
          final List<double> rgb2 = ColorConverter.hex2rgb2(hex2);
          final ColorXy expectedColor2 =
              ColorXy.fromRgbNormalized(rgb2[0], rgb2[1], rgb2[2]);
          final List<double> rgb3 = ColorConverter.hex2rgb2(hex3);
          final ColorXy expectedColor3 =
              ColorXy.fromRgbNormalized(rgb3[0], rgb3[1], rgb3[2]);
          final List<double> rgb4 = ColorConverter.hex2rgb2(hex4);
          final ColorXy expectedColor4 =
              ColorXy.fromRgbNormalized(rgb4[0], rgb4[1], rgb4[2]);
          final List<double> rgb5 = ColorConverter.hex2rgb2(hex5);
          final ColorXy expectedColor5 =
              ColorXy.fromRgbNormalized(rgb5[0], rgb5[1], rgb5[2]);
          final List<double> rgb6 = ColorConverter.hex2rgb2(hex6);
          final ColorXy expectedColor6 =
              ColorXy.fromRgbNormalized(rgb6[0], rgb6[1], rgb6[2]);
          final List<double> rgb7 = ColorConverter.hex2rgb2(hex7);
          final ColorXy expectedColor7 =
              ColorXy.fromRgbNormalized(rgb7[0], rgb7[1], rgb7[2]);

          expect(
            ColorConverter.hex2colorXy(hex1),
            expectedColor1,
          );
          expect(
            ColorConverter.hex2colorXy(hex2),
            expectedColor2,
          );
          expect(
            ColorConverter.hex2colorXy(hex3),
            expectedColor3,
          );
          expect(
            ColorConverter.hex2colorXy(hex4),
            expectedColor4,
          );
          expect(
            ColorConverter.hex2colorXy(hex5),
            expectedColor5,
          );
          expect(
            ColorConverter.hex2colorXy(hex6),
            expectedColor6,
          );
          expect(
            ColorConverter.hex2colorXy(hex7),
            expectedColor7,
          );

          expect(
            ColorConverter.hex2colorXy(hex8),
            expectedColor1,
          );
          expect(
            ColorConverter.hex2colorXy(hex9),
            expectedColor2,
          );
          expect(
            ColorConverter.hex2colorXy(hex10),
            expectedColor3,
          );
          expect(
            ColorConverter.hex2colorXy(hex11),
            expectedColor4,
          );
          expect(
            ColorConverter.hex2colorXy(hex12),
            expectedColor5,
          );
          expect(
            ColorConverter.hex2colorXy(hex13),
            expectedColor6,
          );
          expect(
            ColorConverter.hex2colorXy(hex14),
            expectedColor7,
          );

          expect(
            ColorConverter.hex2colorXy(hex15),
            expectedColor1,
          );
          expect(
            ColorConverter.hex2colorXy(hex16),
            expectedColor2,
          );
          expect(
            ColorConverter.hex2colorXy(hex17),
            expectedColor3,
          );
          expect(
            ColorConverter.hex2colorXy(hex18),
            expectedColor5,
          );
          expect(
            ColorConverter.hex2colorXy(hex19),
            expectedColor6,
          );
        },
      );

      test(
        'colorRgb',
        () {
          final List<double> rgb1 = ColorConverter.hex2rgb2(hex1);
          final ColorRgb expectedColor1 =
              ColorRgb.fromRgbNormalized(rgb1[0], rgb1[1], rgb1[2]);
          final List<double> rgb2 = ColorConverter.hex2rgb2(hex2);
          final ColorRgb expectedColor2 =
              ColorRgb.fromRgbNormalized(rgb2[0], rgb2[1], rgb2[2]);
          final List<double> rgb3 = ColorConverter.hex2rgb2(hex3);
          final ColorRgb expectedColor3 =
              ColorRgb.fromRgbNormalized(rgb3[0], rgb3[1], rgb3[2]);
          final List<double> rgb4 = ColorConverter.hex2rgb2(hex4);
          final ColorRgb expectedColor4 =
              ColorRgb.fromRgbNormalized(rgb4[0], rgb4[1], rgb4[2]);
          final List<double> rgb5 = ColorConverter.hex2rgb2(hex5);
          final ColorRgb expectedColor5 =
              ColorRgb.fromRgbNormalized(rgb5[0], rgb5[1], rgb5[2]);
          final List<double> rgb6 = ColorConverter.hex2rgb2(hex6);
          final ColorRgb expectedColor6 =
              ColorRgb.fromRgbNormalized(rgb6[0], rgb6[1], rgb6[2]);
          final List<double> rgb7 = ColorConverter.hex2rgb2(hex7);
          final ColorRgb expectedColor7 =
              ColorRgb.fromRgbNormalized(rgb7[0], rgb7[1], rgb7[2]);

          expect(
            ColorConverter.hex2colorRgb(hex1),
            expectedColor1,
          );
          expect(
            ColorConverter.hex2colorRgb(hex2),
            expectedColor2,
          );
          expect(
            ColorConverter.hex2colorRgb(hex3),
            expectedColor3,
          );
          expect(
            ColorConverter.hex2colorRgb(hex4),
            expectedColor4,
          );
          expect(
            ColorConverter.hex2colorRgb(hex5),
            expectedColor5,
          );
          expect(
            ColorConverter.hex2colorRgb(hex6),
            expectedColor6,
          );
          expect(
            ColorConverter.hex2colorRgb(hex7),
            expectedColor7,
          );

          expect(
            ColorConverter.hex2colorRgb(hex8),
            expectedColor1,
          );
          expect(
            ColorConverter.hex2colorRgb(hex9),
            expectedColor2,
          );
          expect(
            ColorConverter.hex2colorRgb(hex10),
            expectedColor3,
          );
          expect(
            ColorConverter.hex2colorRgb(hex11),
            expectedColor4,
          );
          expect(
            ColorConverter.hex2colorRgb(hex12),
            expectedColor5,
          );
          expect(
            ColorConverter.hex2colorRgb(hex13),
            expectedColor6,
          );
          expect(
            ColorConverter.hex2colorRgb(hex14),
            expectedColor7,
          );

          expect(
            ColorConverter.hex2colorRgb(hex15),
            expectedColor1,
          );
          expect(
            ColorConverter.hex2colorRgb(hex16),
            expectedColor2,
          );
          expect(
            ColorConverter.hex2colorRgb(hex17),
            expectedColor3,
          );
          expect(
            ColorConverter.hex2colorRgb(hex18),
            expectedColor5,
          );
          expect(
            ColorConverter.hex2colorRgb(hex19),
            expectedColor6,
          );
        },
      );

      test(
        'colorRgbNormalized',
        () {
          final List<double> rgb1 = ColorConverter.hex2rgb2(hex1);
          final ColorRgbNormalized expectedColor1 =
              ColorRgbNormalized(rgb1[0], rgb1[1], rgb1[2]);
          final List<double> rgb2 = ColorConverter.hex2rgb2(hex2);
          final ColorRgbNormalized expectedColor2 =
              ColorRgbNormalized(rgb2[0], rgb2[1], rgb2[2]);
          final List<double> rgb3 = ColorConverter.hex2rgb2(hex3);
          final ColorRgbNormalized expectedColor3 =
              ColorRgbNormalized(rgb3[0], rgb3[1], rgb3[2]);
          final List<double> rgb4 = ColorConverter.hex2rgb2(hex4);
          final ColorRgbNormalized expectedColor4 =
              ColorRgbNormalized(rgb4[0], rgb4[1], rgb4[2]);
          final List<double> rgb5 = ColorConverter.hex2rgb2(hex5);
          final ColorRgbNormalized expectedColor5 =
              ColorRgbNormalized(rgb5[0], rgb5[1], rgb5[2]);
          final List<double> rgb6 = ColorConverter.hex2rgb2(hex6);
          final ColorRgbNormalized expectedColor6 =
              ColorRgbNormalized(rgb6[0], rgb6[1], rgb6[2]);
          final List<double> rgb7 = ColorConverter.hex2rgb2(hex7);
          final ColorRgbNormalized expectedColor7 =
              ColorRgbNormalized(rgb7[0], rgb7[1], rgb7[2]);

          expect(
            ColorConverter.hex2colorRgbNormalized(hex1),
            expectedColor1,
          );
          expect(
            ColorConverter.hex2colorRgbNormalized(hex2),
            expectedColor2,
          );
          expect(
            ColorConverter.hex2colorRgbNormalized(hex3),
            expectedColor3,
          );
          expect(
            ColorConverter.hex2colorRgbNormalized(hex4),
            expectedColor4,
          );
          expect(
            ColorConverter.hex2colorRgbNormalized(hex5),
            expectedColor5,
          );
          expect(
            ColorConverter.hex2colorRgbNormalized(hex6),
            expectedColor6,
          );
          expect(
            ColorConverter.hex2colorRgbNormalized(hex7),
            expectedColor7,
          );

          expect(
            ColorConverter.hex2colorRgbNormalized(hex8),
            expectedColor1,
          );
          expect(
            ColorConverter.hex2colorRgbNormalized(hex9),
            expectedColor2,
          );
          expect(
            ColorConverter.hex2colorRgbNormalized(hex10),
            expectedColor3,
          );
          expect(
            ColorConverter.hex2colorRgbNormalized(hex11),
            expectedColor4,
          );
          expect(
            ColorConverter.hex2colorRgbNormalized(hex12),
            expectedColor5,
          );
          expect(
            ColorConverter.hex2colorRgbNormalized(hex13),
            expectedColor6,
          );
          expect(
            ColorConverter.hex2colorRgbNormalized(hex14),
            expectedColor7,
          );

          expect(
            ColorConverter.hex2colorRgbNormalized(hex15),
            expectedColor1,
          );
          expect(
            ColorConverter.hex2colorRgbNormalized(hex16),
            expectedColor2,
          );
          expect(
            ColorConverter.hex2colorRgbNormalized(hex17),
            expectedColor3,
          );
          expect(
            ColorConverter.hex2colorRgbNormalized(hex18),
            expectedColor5,
          );
          expect(
            ColorConverter.hex2colorRgbNormalized(hex19),
            expectedColor6,
          );
        },
      );
    },
  );

  group(
    'hsl to',
    () {
      const List<double> hsl1 = [0.0, 1.0, 0.5];
      const List<double> hsl2 = [120.0, 1.0, 0.5];
      const List<double> hsl3 = [240.0, 1.0, 0.5];
      const List<double> hsl4 = [0.0, 0.0, 0.5019607843137255];
      const List<double> hsl5 = [0.0, 0.0, 0.0];
      const List<double> hsl6 = [0.0, 0.0, 1.0];
      const List<double> hsl7 = [302.0, 0.3142857142857143, 0.4117647058823529];

      test(
        'xy',
        () {
          expect(
            ColorConverter.hsl2xy(hsl1[0].toInt(), hsl1[1], hsl1[2]),
            [0.6400744994567747, 0.32997051063169336, 0.2126],
          );
          expect(
            ColorConverter.hsl2xy(hsl2[0].toInt(), hsl2[1], hsl2[2]),
            [0.3, 0.6, 0.7152],
          );
          expect(
            ColorConverter.hsl2xy(hsl3[0].toInt(), hsl3[1], hsl3[2]),
            [0.1500166223404255, 0.060006648936170214, 0.0722],
          );
          expect(
            ColorConverter.hsl2xy(hsl4[0].toInt(), hsl4[1], hsl4[2]),
            [0.3127159072215825, 0.3290014805066622, 0.21586050011389923],
          );
          expect(
            ColorConverter.hsl2xy(hsl5[0].toInt(), hsl5[1], hsl5[2]),
            [0.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.hsl2xy(hsl6[0].toInt(), hsl6[1], hsl6[2]),
            [0.3127159072215825, 0.3290014805066623, 1.0],
          );
          expect(
            ColorConverter.hsl2xy(hsl7[0].toInt(), hsl7[1], hsl7[2]),
            [0.32125723426783265, 0.22021954348487954, 0.11809894756916556],
          );
        },
      );

      test(
        'rgb',
        () {
          expect(
            ColorConverter.hsl2rgb(hsl1[0].toInt(), hsl1[1], hsl1[2]),
            [255, 0, 0],
          );
          expect(
            ColorConverter.hsl2rgb(hsl2[0].toInt(), hsl2[1], hsl2[2]),
            [0, 255, 0],
          );
          expect(
            ColorConverter.hsl2rgb(hsl3[0].toInt(), hsl3[1], hsl3[2]),
            [0, 0, 255],
          );
          expect(
            ColorConverter.hsl2rgb(hsl4[0].toInt(), hsl4[1], hsl4[2]),
            [128, 128, 128],
          );
          expect(
            ColorConverter.hsl2rgb(hsl5[0].toInt(), hsl5[1], hsl5[2]),
            [0, 0, 0],
          );
          expect(
            ColorConverter.hsl2rgb(hsl6[0].toInt(), hsl6[1], hsl6[2]),
            [255, 255, 255],
          );
          expect(
            ColorConverter.hsl2rgb(hsl7[0].toInt(), hsl7[1], hsl7[2]),
            [138, 72, 136],
          );
        },
      );

      test(
        'rgb2',
        () {
          expect(
            ColorConverter.hsl2rgb2(hsl1[0].toInt(), hsl1[1], hsl1[2]),
            [1.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.hsl2rgb2(hsl2[0].toInt(), hsl2[1], hsl2[2]),
            [0.0, 1.0, 0.0],
          );
          expect(
            ColorConverter.hsl2rgb2(hsl3[0].toInt(), hsl3[1], hsl3[2]),
            [0.0, 0.0, 1.0],
          );
          expect(
            ColorConverter.hsl2rgb2(hsl4[0].toInt(), hsl4[1], hsl4[2]),
            [0.5019607843137255, 0.5019607843137255, 0.5019607843137255],
          );
          expect(
            ColorConverter.hsl2rgb2(hsl5[0].toInt(), hsl5[1], hsl5[2]),
            [0.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.hsl2rgb2(hsl6[0].toInt(), hsl6[1], hsl6[2]),
            [1.0, 1.0, 1.0],
          );
          expect(
            ColorConverter.hsl2rgb2(hsl7[0].toInt(), hsl7[1], hsl7[2]),
            [0.5411764705882353, 0.2823529411764706, 0.5325490196078431],
          );
        },
      );

      test(
        'hsv',
        () {
          expect(
            ColorConverter.hsl2hsv(hsl1[0].toInt(), hsl1[1], hsl1[2]),
            [0.0, 1.0, 1.0],
          );
          expect(
            ColorConverter.hsl2hsv(hsl2[0].toInt(), hsl2[1], hsl2[2]),
            [120.0, 1.0, 1.0],
          );
          expect(
            ColorConverter.hsl2hsv(hsl3[0].toInt(), hsl3[1], hsl3[2]),
            [240.0, 1.0, 1.0],
          );
          expect(
            ColorConverter.hsl2hsv(hsl4[0].toInt(), hsl4[1], hsl4[2]),
            [0.0, 0.0, 0.5019607843137255],
          );
          expect(
            ColorConverter.hsl2hsv(hsl5[0].toInt(), hsl5[1], hsl5[2]),
            [0.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.hsl2hsv(hsl6[0].toInt(), hsl6[1], hsl6[2]),
            [0.0, 0.0, 1.0],
          );
          expect(
            ColorConverter.hsl2hsv(hsl7[0].toInt(), hsl7[1], hsl7[2]),
            [302.0, 0.47826086956521735, 0.5411764705882353],
          );
        },
      );

      test(
        'hex',
        () {
          expect(
            ColorConverter.hsl2hex(hsl1[0].toInt(), hsl1[1], hsl1[2]),
            'ffff0000',
          );
          expect(
            ColorConverter.hsl2hex(hsl2[0].toInt(), hsl2[1], hsl2[2]),
            'ff00ff00',
          );
          expect(
            ColorConverter.hsl2hex(hsl3[0].toInt(), hsl3[1], hsl3[2]),
            'ff0000ff',
          );
          expect(
            ColorConverter.hsl2hex(hsl4[0].toInt(), hsl4[1], hsl4[2]),
            'ff808080',
          );
          expect(
            ColorConverter.hsl2hex(hsl5[0].toInt(), hsl5[1], hsl5[2]),
            'ff000000',
          );
          expect(
            ColorConverter.hsl2hex(hsl6[0].toInt(), hsl6[1], hsl6[2]),
            'ffffffff',
          );
          expect(
            ColorConverter.hsl2hex(hsl7[0].toInt(), hsl7[1], hsl7[2]),
            'ff8a4888',
          );
        },
      );

      test(
        'color',
        () {
          expect(
            ColorConverter.hsl2color(hsl1[0].toInt(), hsl1[1], hsl1[2]),
            const Color(0xffff0000),
          );
          expect(
            ColorConverter.hsl2color(hsl2[0].toInt(), hsl2[1], hsl2[2]),
            const Color(0xff00ff00),
          );
          expect(
            ColorConverter.hsl2color(hsl3[0].toInt(), hsl3[1], hsl3[2]),
            const Color(0xff0000ff),
          );
          expect(
            ColorConverter.hsl2color(hsl4[0].toInt(), hsl4[1], hsl4[2]),
            const Color(0xff808080),
          );
          expect(
            ColorConverter.hsl2color(hsl5[0].toInt(), hsl5[1], hsl5[2]),
            const Color(0xff000000),
          );
          expect(
            ColorConverter.hsl2color(hsl6[0].toInt(), hsl6[1], hsl6[2]),
            const Color(0xffffffff),
          );

          final Color expectedColor7 = const Color.from(
            alpha: 1.0,
            red: 0.5411764705882353,
            green: 0.2823529411764706,
            blue: 0.5325490196078431,
          );
          final Color actualColor7 =
              ColorConverter.hsl2color(hsl7[0].toInt(), hsl7[1], hsl7[2]);
          expect(actualColor7.a, expectedColor7.a);
          expect(actualColor7.r, expectedColor7.r);
          expect(actualColor7.g, expectedColor7.g);
          expect(actualColor7.b, expectedColor7.b);
        },
      );

      test(
        'int',
        () {
          expect(
            ColorConverter.hsl2int(hsl1[0].toInt(), hsl1[1], hsl1[2]),
            4294901760,
          );
          expect(
            ColorConverter.hsl2int(hsl2[0].toInt(), hsl2[1], hsl2[2]),
            4278255360,
          );
          expect(
            ColorConverter.hsl2int(hsl3[0].toInt(), hsl3[1], hsl3[2]),
            4278190335,
          );
          expect(
            ColorConverter.hsl2int(hsl4[0].toInt(), hsl4[1], hsl4[2]),
            4286611584,
          );
          expect(
            ColorConverter.hsl2int(hsl5[0].toInt(), hsl5[1], hsl5[2]),
            4278190080,
          );
          expect(
            ColorConverter.hsl2int(hsl6[0].toInt(), hsl6[1], hsl6[2]),
            4294967295,
          );
          expect(
            ColorConverter.hsl2int(hsl7[0].toInt(), hsl7[1], hsl7[2]),
            4287252616,
          );
        },
      );

      test(
        'colorXy',
        () {
          final List<double> rgb1 =
              ColorConverter.hsl2rgb2(hsl1[0].toInt(), hsl1[1], hsl1[2]);
          expect(
            ColorConverter.hsl2colorXy(hsl1[0].toInt(), hsl1[1], hsl1[2]),
            ColorXy.fromRgbNormalized(rgb1[0], rgb1[1], rgb1[2]),
          );
          final List<double> rgb2 =
              ColorConverter.hsl2rgb2(hsl2[0].toInt(), hsl2[1], hsl2[2]);
          expect(
            ColorConverter.hsl2colorXy(hsl2[0].toInt(), hsl2[1], hsl2[2]),
            ColorXy.fromRgbNormalized(rgb2[0], rgb2[1], rgb2[2]),
          );
          final List<double> rgb3 =
              ColorConverter.hsl2rgb2(hsl3[0].toInt(), hsl3[1], hsl3[2]);
          expect(
            ColorConverter.hsl2colorXy(hsl3[0].toInt(), hsl3[1], hsl3[2]),
            ColorXy.fromRgbNormalized(rgb3[0], rgb3[1], rgb3[2]),
          );
          final List<double> rgb4 =
              ColorConverter.hsl2rgb2(hsl4[0].toInt(), hsl4[1], hsl4[2]);
          expect(
            ColorConverter.hsl2colorXy(hsl4[0].toInt(), hsl4[1], hsl4[2]),
            ColorXy.fromRgbNormalized(rgb4[0], rgb4[1], rgb4[2]),
          );
          final List<double> rgb5 =
              ColorConverter.hsl2rgb2(hsl5[0].toInt(), hsl5[1], hsl5[2]);
          expect(
            ColorConverter.hsl2colorXy(hsl5[0].toInt(), hsl5[1], hsl5[2]),
            ColorXy.fromRgbNormalized(rgb5[0], rgb5[1], rgb5[2]),
          );
          final List<double> rgb6 =
              ColorConverter.hsl2rgb2(hsl6[0].toInt(), hsl6[1], hsl6[2]);
          expect(
            ColorConverter.hsl2colorXy(hsl6[0].toInt(), hsl6[1], hsl6[2]),
            ColorXy.fromRgbNormalized(rgb6[0], rgb6[1], rgb6[2]),
          );
          final List<double> rgb7 =
              ColorConverter.hsl2rgb2(hsl7[0].toInt(), hsl7[1], hsl7[2]);
          expect(
            ColorConverter.hsl2colorXy(hsl7[0].toInt(), hsl7[1], hsl7[2]),
            ColorXy.fromRgbNormalized(rgb7[0], rgb7[1], rgb7[2]),
          );
        },
      );

      test(
        'colorRgb',
        () {
          final List<double> rgb1 =
              ColorConverter.hsl2rgb2(hsl1[0].toInt(), hsl1[1], hsl1[2]);
          expect(
            ColorConverter.hsl2colorRgb(hsl1[0].toInt(), hsl1[1], hsl1[2]),
            ColorRgb.fromRgbNormalized(rgb1[0], rgb1[1], rgb1[2]),
          );
          final List<double> rgb2 =
              ColorConverter.hsl2rgb2(hsl2[0].toInt(), hsl2[1], hsl2[2]);
          expect(
            ColorConverter.hsl2colorRgb(hsl2[0].toInt(), hsl2[1], hsl2[2]),
            ColorRgb.fromRgbNormalized(rgb2[0], rgb2[1], rgb2[2]),
          );
          final List<double> rgb3 =
              ColorConverter.hsl2rgb2(hsl3[0].toInt(), hsl3[1], hsl3[2]);
          expect(
            ColorConverter.hsl2colorRgb(hsl3[0].toInt(), hsl3[1], hsl3[2]),
            ColorRgb.fromRgbNormalized(rgb3[0], rgb3[1], rgb3[2]),
          );
          final List<double> rgb4 =
              ColorConverter.hsl2rgb2(hsl4[0].toInt(), hsl4[1], hsl4[2]);
          expect(
            ColorConverter.hsl2colorRgb(hsl4[0].toInt(), hsl4[1], hsl4[2]),
            ColorRgb.fromRgbNormalized(rgb4[0], rgb4[1], rgb4[2]),
          );
          final List<double> rgb5 =
              ColorConverter.hsl2rgb2(hsl5[0].toInt(), hsl5[1], hsl5[2]);
          expect(
            ColorConverter.hsl2colorRgb(hsl5[0].toInt(), hsl5[1], hsl5[2]),
            ColorRgb.fromRgbNormalized(rgb5[0], rgb5[1], rgb5[2]),
          );
          final List<double> rgb6 =
              ColorConverter.hsl2rgb2(hsl6[0].toInt(), hsl6[1], hsl6[2]);
          expect(
            ColorConverter.hsl2colorRgb(hsl6[0].toInt(), hsl6[1], hsl6[2]),
            ColorRgb.fromRgbNormalized(rgb6[0], rgb6[1], rgb6[2]),
          );
          final List<double> rgb7 =
              ColorConverter.hsl2rgb2(hsl7[0].toInt(), hsl7[1], hsl7[2]);
          expect(
            ColorConverter.hsl2colorRgb(hsl7[0].toInt(), hsl7[1], hsl7[2]),
            ColorRgb.fromRgbNormalized(rgb7[0], rgb7[1], rgb7[2]),
          );
        },
      );

      test(
        'colorRgbNormalized',
        () {
          final List<double> rgb1 =
              ColorConverter.hsl2rgb2(hsl1[0].toInt(), hsl1[1], hsl1[2]);
          expect(
            ColorConverter.hsl2colorRgbNormalized(
                hsl1[0].toInt(), hsl1[1], hsl1[2]),
            ColorRgbNormalized(rgb1[0], rgb1[1], rgb1[2]),
          );
          final List<double> rgb2 =
              ColorConverter.hsl2rgb2(hsl2[0].toInt(), hsl2[1], hsl2[2]);
          expect(
            ColorConverter.hsl2colorRgbNormalized(
                hsl2[0].toInt(), hsl2[1], hsl2[2]),
            ColorRgbNormalized(rgb2[0], rgb2[1], rgb2[2]),
          );
          final List<double> rgb3 =
              ColorConverter.hsl2rgb2(hsl3[0].toInt(), hsl3[1], hsl3[2]);
          expect(
            ColorConverter.hsl2colorRgbNormalized(
                hsl3[0].toInt(), hsl3[1], hsl3[2]),
            ColorRgbNormalized(rgb3[0], rgb3[1], rgb3[2]),
          );
          final List<double> rgb4 =
              ColorConverter.hsl2rgb2(hsl4[0].toInt(), hsl4[1], hsl4[2]);
          expect(
            ColorConverter.hsl2colorRgbNormalized(
                hsl4[0].toInt(), hsl4[1], hsl4[2]),
            ColorRgbNormalized(rgb4[0], rgb4[1], rgb4[2]),
          );
          final List<double> rgb5 =
              ColorConverter.hsl2rgb2(hsl5[0].toInt(), hsl5[1], hsl5[2]);
          expect(
            ColorConverter.hsl2colorRgbNormalized(
                hsl5[0].toInt(), hsl5[1], hsl5[2]),
            ColorRgbNormalized(rgb5[0], rgb5[1], rgb5[2]),
          );
          final List<double> rgb6 =
              ColorConverter.hsl2rgb2(hsl6[0].toInt(), hsl6[1], hsl6[2]);
          expect(
            ColorConverter.hsl2colorRgbNormalized(
                hsl6[0].toInt(), hsl6[1], hsl6[2]),
            ColorRgbNormalized(rgb6[0], rgb6[1], rgb6[2]),
          );
          final List<double> rgb7 =
              ColorConverter.hsl2rgb2(hsl7[0].toInt(), hsl7[1], hsl7[2]);
          expect(
            ColorConverter.hsl2colorRgbNormalized(
                hsl7[0].toInt(), hsl7[1], hsl7[2]),
            ColorRgbNormalized(rgb7[0], rgb7[1], rgb7[2]),
          );
        },
      );
    },
  );

  group(
    'color to',
    () {
      const Color color1 = Color(0xffff0000);
      const Color color2 = Color(0xff00ff00);
      const Color color3 = Color(0xff0000ff);
      const Color color4 = Color(0xff808080);
      const Color color5 = Color(0xff000000);
      const Color color6 = Color(0xffffffff);
      const Color color7 = Color(0xff8a4888);

      test(
        'xy',
        () {
          expect(
            ColorConverter.color2xy(color1),
            [0.6400744994567747, 0.32997051063169336, 0.2126],
          );
          expect(
            ColorConverter.color2xy(color2),
            [0.3, 0.6, 0.7152],
          );
          expect(
            ColorConverter.color2xy(color3),
            [0.1500166223404255, 0.060006648936170214, 0.0722],
          );
          expect(
            ColorConverter.color2xy(color4),
            [0.3127159072215825, 0.3290014805066622, 0.21586050011389923],
          );
          expect(
            ColorConverter.color2xy(color5),
            [0.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.color2xy(color6),
            [0.3127159072215825, 0.3290014805066623, 1.0],
          );
          expect(
            ColorConverter.color2xy(color7),
            [0.3209554122773742, 0.21993715851681886, 0.1181557673818057],
          );
        },
      );

      test(
        'rgb',
        () {
          expect(
            ColorConverter.color2rgb(color1),
            [255, 0, 0],
          );
          expect(
            ColorConverter.color2rgb(color2),
            [0, 255, 0],
          );
          expect(
            ColorConverter.color2rgb(color3),
            [0, 0, 255],
          );
          expect(
            ColorConverter.color2rgb(color4),
            [128, 128, 128],
          );
          expect(
            ColorConverter.color2rgb(color5),
            [0, 0, 0],
          );
          expect(
            ColorConverter.color2rgb(color6),
            [255, 255, 255],
          );
          expect(
            ColorConverter.color2rgb(color7),
            [138, 72, 136],
          );
        },
      );

      test(
        'rgb2',
        () {
          expect(
            ColorConverter.color2rgb2(color1),
            [1.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.color2rgb2(color2),
            [0.0, 1.0, 0.0],
          );
          expect(
            ColorConverter.color2rgb2(color3),
            [0.0, 0.0, 1.0],
          );
          expect(
            ColorConverter.color2rgb2(color4),
            [0.5019607843137255, 0.5019607843137255, 0.5019607843137255],
          );
          expect(
            ColorConverter.color2rgb2(color5),
            [0.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.color2rgb2(color6),
            [1.0, 1.0, 1.0],
          );
          expect(
            ColorConverter.color2rgb2(color7),
            [0.5411764705882353, 0.2823529411764706, 0.5333333333333333],
          );
        },
      );

      test(
        'hsv',
        () {
          expect(
            ColorConverter.color2hsv(color1),
            [0.0, 1.0, 1.0],
          );
          expect(
            ColorConverter.color2hsv(color2),
            [120.0, 1.0, 1.0],
          );
          expect(
            ColorConverter.color2hsv(color3),
            [240.0, 1.0, 1.0],
          );
          expect(
            ColorConverter.color2hsv(color4),
            [0.0, 0.0, 0.5019607843137255],
          );
          expect(
            ColorConverter.color2hsv(color5),
            [0.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.color2hsv(color6),
            [0.0, 0.0, 1.0],
          );
          expect(
            ColorConverter.color2hsv(color7),
            [301.8181818181818, 0.47826086956521735, 0.5411764705882353],
          );
        },
      );

      test(
        'hex',
        () {
          expect(
            ColorConverter.color2hex(color1),
            'ffff0000',
          );
          expect(
            ColorConverter.color2hex(color2),
            'ff00ff00',
          );
          expect(
            ColorConverter.color2hex(color3),
            'ff0000ff',
          );
          expect(
            ColorConverter.color2hex(color4),
            'ff808080',
          );
          expect(
            ColorConverter.color2hex(color5),
            'ff000000',
          );
          expect(
            ColorConverter.color2hex(color6),
            'ffffffff',
          );
          expect(
            ColorConverter.color2hex(color7),
            'ff8a4888',
          );
        },
      );

      test(
        'hsl',
        () {
          expect(
            ColorConverter.color2hsl(color1),
            [0.0, 1.0, 0.5],
          );
          expect(
            ColorConverter.color2hsl(color2),
            [120.0, 1.0, 0.5],
          );
          expect(
            ColorConverter.color2hsl(color3),
            [240.0, 1.0, 0.5],
          );
          expect(
            ColorConverter.color2hsl(color4),
            [0.0, 0.0, 0.5019607843137255],
          );
          expect(
            ColorConverter.color2hsl(color5),
            [0.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.color2hsl(color6),
            [0.0, 0.0, 1.0],
          );
          expect(
            ColorConverter.color2hsl(color7),
            [301.8181818181818, 0.3142857142857143, 0.4117647058823529],
          );
        },
      );

      test(
        'int',
        () {
          expect(
            ColorConverter.color2int(color1),
            4294901760,
          );
          expect(
            ColorConverter.color2int(color2),
            4278255360,
          );
          expect(
            ColorConverter.color2int(color3),
            4278190335,
          );
          expect(
            ColorConverter.color2int(color4),
            4286611584,
          );
          expect(
            ColorConverter.color2int(color5),
            4278190080,
          );
          expect(
            ColorConverter.color2int(color6),
            4294967295,
          );
          expect(
            ColorConverter.color2int(color7),
            4287252616,
          );
        },
      );

      test(
        'colorXy',
        () {
          final List<double> rgb1 = ColorConverter.color2rgb2(color1);
          expect(
            ColorConverter.color2colorXy(color1),
            ColorXy.fromRgbNormalized(rgb1[0], rgb1[1], rgb1[2]),
          );
          final List<double> rgb2 = ColorConverter.color2rgb2(color2);
          expect(
            ColorConverter.color2colorXy(color2),
            ColorXy.fromRgbNormalized(rgb2[0], rgb2[1], rgb2[2]),
          );
          final List<double> rgb3 = ColorConverter.color2rgb2(color3);
          expect(
            ColorConverter.color2colorXy(color3),
            ColorXy.fromRgbNormalized(rgb3[0], rgb3[1], rgb3[2]),
          );
          final List<double> rgb4 = ColorConverter.color2rgb2(color4);
          expect(
            ColorConverter.color2colorXy(color4),
            ColorXy.fromRgbNormalized(rgb4[0], rgb4[1], rgb4[2]),
          );
          final List<double> rgb5 = ColorConverter.color2rgb2(color5);
          expect(
            ColorConverter.color2colorXy(color5),
            ColorXy.fromRgbNormalized(rgb5[0], rgb5[1], rgb5[2]),
          );
          final List<double> rgb6 = ColorConverter.color2rgb2(color6);
          expect(
            ColorConverter.color2colorXy(color6),
            ColorXy.fromRgbNormalized(rgb6[0], rgb6[1], rgb6[2]),
          );
          final List<double> rgb7 = ColorConverter.color2rgb2(color7);
          expect(
            ColorConverter.color2colorXy(color7),
            ColorXy.fromRgbNormalized(rgb7[0], rgb7[1], rgb7[2]),
          );
        },
      );

      test(
        'colorRgb',
        () {
          final List<double> rgb1 = ColorConverter.color2rgb2(color1);
          expect(
            ColorConverter.color2colorRgb(color1),
            ColorRgb.fromRgbNormalized(rgb1[0], rgb1[1], rgb1[2]),
          );
          final List<double> rgb2 = ColorConverter.color2rgb2(color2);
          expect(
            ColorConverter.color2colorRgb(color2),
            ColorRgb.fromRgbNormalized(rgb2[0], rgb2[1], rgb2[2]),
          );
          final List<double> rgb3 = ColorConverter.color2rgb2(color3);
          expect(
            ColorConverter.color2colorRgb(color3),
            ColorRgb.fromRgbNormalized(rgb3[0], rgb3[1], rgb3[2]),
          );
          final List<double> rgb4 = ColorConverter.color2rgb2(color4);
          expect(
            ColorConverter.color2colorRgb(color4),
            ColorRgb.fromRgbNormalized(rgb4[0], rgb4[1], rgb4[2]),
          );
          final List<double> rgb5 = ColorConverter.color2rgb2(color5);
          expect(
            ColorConverter.color2colorRgb(color5),
            ColorRgb.fromRgbNormalized(rgb5[0], rgb5[1], rgb5[2]),
          );
          final List<double> rgb6 = ColorConverter.color2rgb2(color6);
          expect(
            ColorConverter.color2colorRgb(color6),
            ColorRgb.fromRgbNormalized(rgb6[0], rgb6[1], rgb6[2]),
          );
          final List<double> rgb7 = ColorConverter.color2rgb2(color7);
          expect(
            ColorConverter.color2colorRgb(color7),
            ColorRgb.fromRgbNormalized(rgb7[0], rgb7[1], rgb7[2]),
          );
        },
      );

      test(
        'colorRgbNormalized',
        () {
          final List<double> rgb1 = ColorConverter.color2rgb2(color1);
          expect(
            ColorConverter.color2colorRgbNormalized(color1),
            ColorRgbNormalized(rgb1[0], rgb1[1], rgb1[2]),
          );
          final List<double> rgb2 = ColorConverter.color2rgb2(color2);
          expect(
            ColorConverter.color2colorRgbNormalized(color2),
            ColorRgbNormalized(rgb2[0], rgb2[1], rgb2[2]),
          );
          final List<double> rgb3 = ColorConverter.color2rgb2(color3);
          expect(
            ColorConverter.color2colorRgbNormalized(color3),
            ColorRgbNormalized(rgb3[0], rgb3[1], rgb3[2]),
          );
          final List<double> rgb4 = ColorConverter.color2rgb2(color4);
          expect(
            ColorConverter.color2colorRgbNormalized(color4),
            ColorRgbNormalized(rgb4[0], rgb4[1], rgb4[2]),
          );
          final List<double> rgb5 = ColorConverter.color2rgb2(color5);
          expect(
            ColorConverter.color2colorRgbNormalized(color5),
            ColorRgbNormalized(rgb5[0], rgb5[1], rgb5[2]),
          );
          final List<double> rgb6 = ColorConverter.color2rgb2(color6);
          expect(
            ColorConverter.color2colorRgbNormalized(color6),
            ColorRgbNormalized(rgb6[0], rgb6[1], rgb6[2]),
          );
          final List<double> rgb7 = ColorConverter.color2rgb2(color7);
          expect(
            ColorConverter.color2colorRgbNormalized(color7),
            ColorRgbNormalized(rgb7[0], rgb7[1], rgb7[2]),
          );
        },
      );

      group(
        'extensions',
        () {
          test(
            'xy',
            () {
              expect(
                color1.toXy(),
                [0.6400744994567747, 0.32997051063169336, 0.2126],
              );
              expect(
                color2.toXy(),
                [0.3, 0.6, 0.7152],
              );
              expect(
                color3.toXy(),
                [0.1500166223404255, 0.060006648936170214, 0.0722],
              );
              expect(
                color4.toXy(),
                [0.3127159072215825, 0.3290014805066622, 0.21586050011389923],
              );
              expect(
                color5.toXy(),
                [0.0, 0.0, 0.0],
              );
              expect(
                color6.toXy(),
                [0.3127159072215825, 0.3290014805066623, 1.0],
              );
              expect(
                color7.toXy(),
                [0.3209554122773742, 0.21993715851681886, 0.1181557673818057],
              );
            },
          );

          test(
            'rgb',
            () {
              expect(
                color1.toRgb(),
                [255, 0, 0],
              );
              expect(
                color2.toRgb(),
                [0, 255, 0],
              );
              expect(
                color3.toRgb(),
                [0, 0, 255],
              );
              expect(
                color4.toRgb(),
                [128, 128, 128],
              );
              expect(
                color5.toRgb(),
                [0, 0, 0],
              );
              expect(
                color6.toRgb(),
                [255, 255, 255],
              );
              expect(
                color7.toRgb(),
                [138, 72, 136],
              );
            },
          );

          test(
            'rgb2',
            () {
              expect(
                color1.toRgb2(),
                [1.0, 0.0, 0.0],
              );
              expect(
                color2.toRgb2(),
                [0.0, 1.0, 0.0],
              );
              expect(
                color3.toRgb2(),
                [0.0, 0.0, 1.0],
              );
              expect(
                color4.toRgb2(),
                [0.5019607843137255, 0.5019607843137255, 0.5019607843137255],
              );
              expect(
                color5.toRgb2(),
                [0.0, 0.0, 0.0],
              );
              expect(
                color6.toRgb2(),
                [1.0, 1.0, 1.0],
              );
              expect(
                color7.toRgb2(),
                [0.5411764705882353, 0.2823529411764706, 0.5333333333333333],
              );
            },
          );

          test(
            'hsv',
            () {
              expect(
                color1.toHsv(),
                [0.0, 1.0, 1.0],
              );
              expect(
                color2.toHsv(),
                [120.0, 1.0, 1.0],
              );
              expect(
                color3.toHsv(),
                [240.0, 1.0, 1.0],
              );
              expect(
                color4.toHsv(),
                [0.0, 0.0, 0.5019607843137255],
              );
              expect(
                color5.toHsv(),
                [0.0, 0.0, 0.0],
              );
              expect(
                color6.toHsv(),
                [0.0, 0.0, 1.0],
              );
              expect(
                color7.toHsv(),
                [301.8181818181818, 0.47826086956521735, 0.5411764705882353],
              );
            },
          );

          test(
            'hex',
            () {
              expect(
                color1.toHex(),
                'ffff0000',
              );
              expect(
                color2.toHex(),
                'ff00ff00',
              );
              expect(
                color3.toHex(),
                'ff0000ff',
              );
              expect(
                color4.toHex(),
                'ff808080',
              );
              expect(
                color5.toHex(),
                'ff000000',
              );
              expect(
                color6.toHex(),
                'ffffffff',
              );
              expect(
                color7.toHex(),
                'ff8a4888',
              );
            },
          );

          test(
            'hsl',
            () {
              expect(
                color1.toHsl(),
                [0.0, 1.0, 0.5],
              );
              expect(
                color2.toHsl(),
                [120.0, 1.0, 0.5],
              );
              expect(
                color3.toHsl(),
                [240.0, 1.0, 0.5],
              );
              expect(
                color4.toHsl(),
                [0.0, 0.0, 0.5019607843137255],
              );
              expect(
                color5.toHsl(),
                [0.0, 0.0, 0.0],
              );
              expect(
                color6.toHsl(),
                [0.0, 0.0, 1.0],
              );
              expect(
                color7.toHsl(),
                [301.8181818181818, 0.3142857142857143, 0.4117647058823529],
              );
            },
          );

          test(
            'int',
            () {
              expect(
                color1.toInt(),
                4294901760,
              );
              expect(
                color2.toInt(),
                4278255360,
              );
              expect(
                color3.toInt(),
                4278190335,
              );
              expect(
                color4.toInt(),
                4286611584,
              );
              expect(
                color5.toInt(),
                4278190080,
              );
              expect(
                color6.toInt(),
                4294967295,
              );
              expect(
                color7.toInt(),
                4287252616,
              );
            },
          );

          test(
            'colorXy',
            () {
              final List<double> rgb1 = ColorConverter.color2rgb2(color1);
              expect(
                color1.toColorXy(),
                ColorXy.fromRgbNormalized(rgb1[0], rgb1[1], rgb1[2]),
              );
              final List<double> rgb2 = ColorConverter.color2rgb2(color2);
              expect(
                color2.toColorXy(),
                ColorXy.fromRgbNormalized(rgb2[0], rgb2[1], rgb2[2]),
              );
              final List<double> rgb3 = ColorConverter.color2rgb2(color3);
              expect(
                color3.toColorXy(),
                ColorXy.fromRgbNormalized(rgb3[0], rgb3[1], rgb3[2]),
              );
              final List<double> rgb4 = ColorConverter.color2rgb2(color4);
              expect(
                color4.toColorXy(),
                ColorXy.fromRgbNormalized(rgb4[0], rgb4[1], rgb4[2]),
              );
              final List<double> rgb5 = ColorConverter.color2rgb2(color5);
              expect(
                color5.toColorXy(),
                ColorXy.fromRgbNormalized(rgb5[0], rgb5[1], rgb5[2]),
              );
              final List<double> rgb6 = ColorConverter.color2rgb2(color6);
              expect(
                color6.toColorXy(),
                ColorXy.fromRgbNormalized(rgb6[0], rgb6[1], rgb6[2]),
              );
              final List<double> rgb7 = ColorConverter.color2rgb2(color7);
              expect(
                color7.toColorXy(),
                ColorXy.fromRgbNormalized(rgb7[0], rgb7[1], rgb7[2]),
              );
            },
          );

          test(
            'colorRgb',
            () {
              final List<double> rgb1 = ColorConverter.color2rgb2(color1);
              expect(
                color1.toColorRgb(),
                ColorRgb.fromRgbNormalized(rgb1[0], rgb1[1], rgb1[2]),
              );
              final List<double> rgb2 = ColorConverter.color2rgb2(color2);
              expect(
                color2.toColorRgb(),
                ColorRgb.fromRgbNormalized(rgb2[0], rgb2[1], rgb2[2]),
              );
              final List<double> rgb3 = ColorConverter.color2rgb2(color3);
              expect(
                color3.toColorRgb(),
                ColorRgb.fromRgbNormalized(rgb3[0], rgb3[1], rgb3[2]),
              );
              final List<double> rgb4 = ColorConverter.color2rgb2(color4);
              expect(
                color4.toColorRgb(),
                ColorRgb.fromRgbNormalized(rgb4[0], rgb4[1], rgb4[2]),
              );
              final List<double> rgb5 = ColorConverter.color2rgb2(color5);
              expect(
                color5.toColorRgb(),
                ColorRgb.fromRgbNormalized(rgb5[0], rgb5[1], rgb5[2]),
              );
              final List<double> rgb6 = ColorConverter.color2rgb2(color6);
              expect(
                color6.toColorRgb(),
                ColorRgb.fromRgbNormalized(rgb6[0], rgb6[1], rgb6[2]),
              );
              final List<double> rgb7 = ColorConverter.color2rgb2(color7);
              expect(
                color7.toColorRgb(),
                ColorRgb.fromRgbNormalized(rgb7[0], rgb7[1], rgb7[2]),
              );
            },
          );

          test(
            'colorRgbNormalized',
            () {
              final List<double> rgb1 = ColorConverter.color2rgb2(color1);
              expect(
                color1.toColorRgbNormalized(),
                ColorRgbNormalized(rgb1[0], rgb1[1], rgb1[2]),
              );
              final List<double> rgb2 = ColorConverter.color2rgb2(color2);
              expect(
                color2.toColorRgbNormalized(),
                ColorRgbNormalized(rgb2[0], rgb2[1], rgb2[2]),
              );
              final List<double> rgb3 = ColorConverter.color2rgb2(color3);
              expect(
                color3.toColorRgbNormalized(),
                ColorRgbNormalized(rgb3[0], rgb3[1], rgb3[2]),
              );
              final List<double> rgb4 = ColorConverter.color2rgb2(color4);
              expect(
                color4.toColorRgbNormalized(),
                ColorRgbNormalized(rgb4[0], rgb4[1], rgb4[2]),
              );
              final List<double> rgb5 = ColorConverter.color2rgb2(color5);
              expect(
                color5.toColorRgbNormalized(),
                ColorRgbNormalized(rgb5[0], rgb5[1], rgb5[2]),
              );
              final List<double> rgb6 = ColorConverter.color2rgb2(color6);
              expect(
                color6.toColorRgbNormalized(),
                ColorRgbNormalized(rgb6[0], rgb6[1], rgb6[2]),
              );
              final List<double> rgb7 = ColorConverter.color2rgb2(color7);
              expect(
                color7.toColorRgbNormalized(),
                ColorRgbNormalized(rgb7[0], rgb7[1], rgb7[2]),
              );
            },
          );
        },
      );
    },
  );

  group(
    'int to',
    () {
      const int int1 = 4294901760;
      const int int2 = 4278255360;
      const int int3 = 4278190335;
      const int int4 = 4286611584;
      const int int5 = 4278190080;
      const int int6 = 4294967295;
      const int int7 = 4287252616;

      test(
        'xy',
        () {
          expect(
            ColorConverter.int2xy(int1),
            [0.6400744994567747, 0.32997051063169336, 0.2126],
          );
          expect(
            ColorConverter.int2xy(int2),
            [0.3, 0.6, 0.7152],
          );
          expect(
            ColorConverter.int2xy(int3),
            [0.1500166223404255, 0.060006648936170214, 0.0722],
          );
          expect(
            ColorConverter.int2xy(int4),
            [0.3127159072215825, 0.3290014805066622, 0.21586050011389923],
          );
          expect(
            ColorConverter.int2xy(int5),
            [0.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.int2xy(int6),
            [0.3127159072215825, 0.3290014805066623, 1.0],
          );
          expect(
            ColorConverter.int2xy(int7),
            [0.3209554122773742, 0.21993715851681886, 0.1181557673818057],
          );
        },
      );

      test(
        'rgb',
        () {
          expect(
            ColorConverter.int2rgb(int1),
            [255, 0, 0],
          );
          expect(
            ColorConverter.int2rgb(int2),
            [0, 255, 0],
          );
          expect(
            ColorConverter.int2rgb(int3),
            [0, 0, 255],
          );
          expect(
            ColorConverter.int2rgb(int4),
            [128, 128, 128],
          );
          expect(
            ColorConverter.int2rgb(int5),
            [0, 0, 0],
          );
          expect(
            ColorConverter.int2rgb(int6),
            [255, 255, 255],
          );
          expect(
            ColorConverter.int2rgb(int7),
            [138, 72, 136],
          );
        },
      );

      test(
        'rgb2',
        () {
          expect(
            ColorConverter.int2rgb2(int1),
            [1.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.int2rgb2(int2),
            [0.0, 1.0, 0.0],
          );
          expect(
            ColorConverter.int2rgb2(int3),
            [0.0, 0.0, 1.0],
          );
          expect(
            ColorConverter.int2rgb2(int4),
            [0.5019607843137255, 0.5019607843137255, 0.5019607843137255],
          );
          expect(
            ColorConverter.int2rgb2(int5),
            [0.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.int2rgb2(int6),
            [1.0, 1.0, 1.0],
          );
          expect(
            ColorConverter.int2rgb2(int7),
            [0.5411764705882353, 0.2823529411764706, 0.5333333333333333],
          );
        },
      );

      test(
        'hsv',
        () {
          expect(
            ColorConverter.int2hsv(int1),
            [0.0, 1.0, 1.0],
          );
          expect(
            ColorConverter.int2hsv(int2),
            [120.0, 1.0, 1.0],
          );
          expect(
            ColorConverter.int2hsv(int3),
            [240.0, 1.0, 1.0],
          );
          expect(
            ColorConverter.int2hsv(int4),
            [0.0, 0.0, 0.5019607843137255],
          );
          expect(
            ColorConverter.int2hsv(int5),
            [0.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.int2hsv(int6),
            [0.0, 0.0, 1.0],
          );
          expect(
            ColorConverter.int2hsv(int7),
            [301.8181818181818, 0.47826086956521735, 0.5411764705882353],
          );
        },
      );

      test(
        'hex',
        () {
          expect(
            ColorConverter.int2hex(int1),
            'ffff0000',
          );
          expect(
            ColorConverter.int2hex(int2),
            'ff00ff00',
          );
          expect(
            ColorConverter.int2hex(int3),
            'ff0000ff',
          );
          expect(
            ColorConverter.int2hex(int4),
            'ff808080',
          );
          expect(
            ColorConverter.int2hex(int5),
            'ff000000',
          );
          expect(
            ColorConverter.int2hex(int6),
            'ffffffff',
          );
          expect(
            ColorConverter.int2hex(int7),
            'ff8a4888',
          );
        },
      );

      test(
        'hsl',
        () {
          expect(
            ColorConverter.int2hsl(int1),
            [0.0, 1.0, 0.5],
          );
          expect(
            ColorConverter.int2hsl(int2),
            [120.0, 1.0, 0.5],
          );
          expect(
            ColorConverter.int2hsl(int3),
            [240.0, 1.0, 0.5],
          );
          expect(
            ColorConverter.int2hsl(int4),
            [0.0, 0.0, 0.5019607843137255],
          );
          expect(
            ColorConverter.int2hsl(int5),
            [0.0, 0.0, 0.0],
          );
          expect(
            ColorConverter.int2hsl(int6),
            [0.0, 0.0, 1.0],
          );
          expect(
            ColorConverter.int2hsl(int7),
            [301.8181818181818, 0.3142857142857143, 0.4117647058823529],
          );
        },
      );

      test(
        'color',
        () {
          expect(
            ColorConverter.int2color(int1),
            const Color(0xffff0000),
          );
          expect(
            ColorConverter.int2color(int2),
            const Color(0xff00ff00),
          );
          expect(
            ColorConverter.int2color(int3),
            const Color(0xff0000ff),
          );
          expect(
            ColorConverter.int2color(int4),
            const Color(0xff808080),
          );
          expect(
            ColorConverter.int2color(int5),
            const Color(0xff000000),
          );
          expect(
            ColorConverter.int2color(int6),
            const Color(0xffffffff),
          );
          expect(
            ColorConverter.int2color(int7),
            const Color(0xff8a4888),
          );
        },
      );

      test(
        'colorXy',
        () {
          final List<double> rgb1 = ColorConverter.int2rgb2(int1);
          expect(
            ColorConverter.int2colorXy(int1),
            ColorXy.fromRgbNormalized(rgb1[0], rgb1[1], rgb1[2]),
          );
          final List<double> rgb2 = ColorConverter.int2rgb2(int2);
          expect(
            ColorConverter.int2colorXy(int2),
            ColorXy.fromRgbNormalized(rgb2[0], rgb2[1], rgb2[2]),
          );
          final List<double> rgb3 = ColorConverter.int2rgb2(int3);
          expect(
            ColorConverter.int2colorXy(int3),
            ColorXy.fromRgbNormalized(rgb3[0], rgb3[1], rgb3[2]),
          );
          final List<double> rgb4 = ColorConverter.int2rgb2(int4);
          expect(
            ColorConverter.int2colorXy(int4),
            ColorXy.fromRgbNormalized(rgb4[0], rgb4[1], rgb4[2]),
          );
          final List<double> rgb5 = ColorConverter.int2rgb2(int5);
          expect(
            ColorConverter.int2colorXy(int5),
            ColorXy.fromRgbNormalized(rgb5[0], rgb5[1], rgb5[2]),
          );
          final List<double> rgb6 = ColorConverter.int2rgb2(int6);
          expect(
            ColorConverter.int2colorXy(int6),
            ColorXy.fromRgbNormalized(rgb6[0], rgb6[1], rgb6[2]),
          );
          final List<double> rgb7 = ColorConverter.int2rgb2(int7);
          expect(
            ColorConverter.int2colorXy(int7),
            ColorXy.fromRgbNormalized(rgb7[0], rgb7[1], rgb7[2]),
          );
        },
      );

      test(
        'colorRgb',
        () {
          final List<double> rgb1 = ColorConverter.int2rgb2(int1);
          expect(
            ColorConverter.int2colorRgb(int1),
            ColorRgb.fromRgbNormalized(rgb1[0], rgb1[1], rgb1[2]),
          );
          final List<double> rgb2 = ColorConverter.int2rgb2(int2);
          expect(
            ColorConverter.int2colorRgb(int2),
            ColorRgb.fromRgbNormalized(rgb2[0], rgb2[1], rgb2[2]),
          );
          final List<double> rgb3 = ColorConverter.int2rgb2(int3);
          expect(
            ColorConverter.int2colorRgb(int3),
            ColorRgb.fromRgbNormalized(rgb3[0], rgb3[1], rgb3[2]),
          );
          final List<double> rgb4 = ColorConverter.int2rgb2(int4);
          expect(
            ColorConverter.int2colorRgb(int4),
            ColorRgb.fromRgbNormalized(rgb4[0], rgb4[1], rgb4[2]),
          );
          final List<double> rgb5 = ColorConverter.int2rgb2(int5);
          expect(
            ColorConverter.int2colorRgb(int5),
            ColorRgb.fromRgbNormalized(rgb5[0], rgb5[1], rgb5[2]),
          );
          final List<double> rgb6 = ColorConverter.int2rgb2(int6);
          expect(
            ColorConverter.int2colorRgb(int6),
            ColorRgb.fromRgbNormalized(rgb6[0], rgb6[1], rgb6[2]),
          );
          final List<double> rgb7 = ColorConverter.int2rgb2(int7);
          expect(
            ColorConverter.int2colorRgb(int7),
            ColorRgb.fromRgbNormalized(rgb7[0], rgb7[1], rgb7[2]),
          );
        },
      );

      test(
        'colorRgbNormalized',
        () {
          final List<double> rgb1 = ColorConverter.int2rgb2(int1);
          expect(
            ColorConverter.int2colorRgbNormalized(int1),
            ColorRgbNormalized(rgb1[0], rgb1[1], rgb1[2]),
          );
          final List<double> rgb2 = ColorConverter.int2rgb2(int2);
          expect(
            ColorConverter.int2colorRgbNormalized(int2),
            ColorRgbNormalized(rgb2[0], rgb2[1], rgb2[2]),
          );
          final List<double> rgb3 = ColorConverter.int2rgb2(int3);
          expect(
            ColorConverter.int2colorRgbNormalized(int3),
            ColorRgbNormalized(rgb3[0], rgb3[1], rgb3[2]),
          );
          final List<double> rgb4 = ColorConverter.int2rgb2(int4);
          expect(
            ColorConverter.int2colorRgbNormalized(int4),
            ColorRgbNormalized(rgb4[0], rgb4[1], rgb4[2]),
          );
          final List<double> rgb5 = ColorConverter.int2rgb2(int5);
          expect(
            ColorConverter.int2colorRgbNormalized(int5),
            ColorRgbNormalized(rgb5[0], rgb5[1], rgb5[2]),
          );
          final List<double> rgb6 = ColorConverter.int2rgb2(int6);
          expect(
            ColorConverter.int2colorRgbNormalized(int6),
            ColorRgbNormalized(rgb6[0], rgb6[1], rgb6[2]),
          );
          final List<double> rgb7 = ColorConverter.int2rgb2(int7);
          expect(
            ColorConverter.int2colorRgbNormalized(int7),
            ColorRgbNormalized(rgb7[0], rgb7[1], rgb7[2]),
          );
        },
      );
    },
  );
}
