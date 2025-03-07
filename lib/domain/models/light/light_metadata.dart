import 'package:flutter_hue/constants/api_fields.dart';
import 'package:flutter_hue/domain/models/light/light_archetype.dart';
import 'package:flutter_hue/exceptions/invalid_name_exception.dart';
import 'package:flutter_hue/utils/json_tool.dart';
import 'package:flutter_hue/utils/validators.dart';

/// Represents a light's metadata.
class LightMetadata {
  /// Creates a [LightMetadata] object.
  LightMetadata({
    required String name,
    required this.archetype,
    required this.fixedMired,
  })  : assert(name.isEmpty || Validators.isValidName(name),
            '`name` must have a length between 1 and 32 characters (inclusive).'),
        assert(Validators.isValidMired(fixedMired),
            '`fixedMired` must be between 153 and 500 (inclusive).'),
        _originalName = name,
        _name = name,
        _originalArchetype = archetype;

  /// Creates a [LightMetadata] object from the JSON response to a GET request.
  factory LightMetadata.fromJson(Map<String, dynamic> dataMap) {
    return LightMetadata(
      name: dataMap[ApiFields.name] ?? '',
      archetype: LightArchetype.fromString(dataMap[ApiFields.archetype] ?? ''),
      fixedMired: dataMap[ApiFields.fixedMired] ?? 153,
    );
  }

  /// Creates an empty [LightMetadata] object.
  LightMetadata.empty()
      : _name = '',
        archetype = LightArchetype.fromString(''),
        fixedMired = 153,
        _originalName = '',
        _originalArchetype = LightArchetype.fromString('');

  String _name;

  /// Human readable name of a resource.
  ///
  /// minLength: 1 – maxLength: 32
  ///
  /// Throws [InvalidNameException] if `name` is set to a string that does not
  /// have a length of 1 - 32 (inclusive).
  String get name => _name;
  set name(String name) {
    if (Validators.isValidName(name)) {
      _name = name;
    } else {
      throw InvalidNameException.withValue(name);
    }
  }

  /// The value of [name] when this object was instantiated.
  String _originalName;

  /// Light archetype.
  LightArchetype archetype;

  /// The value of [archetype] when this object was instantiated.
  LightArchetype _originalArchetype;

  /// A fixed mired value of the white lamp.
  ///
  /// Range: 153 – 500
  final int fixedMired;

  /// Whether or not this object has been updated.
  ///
  /// If `true`, then the data in this object differs from what is on the
  /// bridge.
  bool get hasUpdate =>
      name != _originalName || !identical(archetype, _originalArchetype);

  /// Called after a successful PUT request, this method refreshed the
  /// "original" data in this object.
  ///
  /// This way, on the next PUT request, the program will know what data is
  /// actually new.
  void refreshOriginals() {
    _originalName = name;
    _originalArchetype = archetype;
  }

  /// Returns a copy of this object with its field values replaced by the
  /// ones provided to this method.
  ///
  /// `copyOriginalValues` is true if you want to maintain the original object's
  /// initial values. This is useful if you plan on using this object in a PUT
  /// request.
  LightMetadata copyWith({
    String? name,
    LightArchetype? archetype,
    int? fixedMired,
    bool copyOriginalValues = true,
  }) {
    LightMetadata toReturn = LightMetadata(
      name: copyOriginalValues ? _originalName : (name ?? this.name),
      archetype: copyOriginalValues
          ? _originalArchetype
          : (archetype ?? this.archetype),
      fixedMired: fixedMired ?? this.fixedMired,
    );

    if (copyOriginalValues) {
      toReturn.name = name ?? this.name;
      toReturn.archetype = archetype ?? this.archetype;
    }

    return toReturn;
  }

  /// Converts this object into JSON format.
  ///
  /// `optimizeFor` lets the program know what information to include in the
  /// JSON data map.
  /// * [OptimizeFor.put] (the default value) is used when making a data map
  /// that is being placed in a PUT request. This only includes data that has
  /// changed.
  /// * [OptimizeFor.putFull] is used when a parent object updates; so, all of
  /// the children are required to be present for the PUT request.
  /// * [OptimizeFor.post] is used when making a data map for a POST request.
  /// * [OptimizeFor.dontOptimize] is used to get all of the data contained in
  /// this object.
  ///
  /// Throws [InvalidNameException] if [name] doesn't have 1 to 32 characters
  /// (inclusive), and `optimizeFor` is not set to [OptimizeFor.dontOptimize].
  Map<String, dynamic> toJson({OptimizeFor optimizeFor = OptimizeFor.put}) {
    // Validate [name].
    if (!identical(optimizeFor, OptimizeFor.dontOptimize)) {
      if (!Validators.isValidName(name)) {
        if (!identical(optimizeFor, OptimizeFor.put) || name != _originalName) {
          throw InvalidNameException.withValue(name);
        }
      }
    }

    // PUT
    if (identical(optimizeFor, OptimizeFor.put)) {
      Map<String, dynamic> toReturn = {};

      if (name != _originalName) {
        toReturn[ApiFields.name] = name;
      }

      if (!identical(archetype, _originalArchetype)) {
        toReturn[ApiFields.archetype] = archetype.value;
      }

      return toReturn;
    }

    // PUT FULL
    if (identical(optimizeFor, OptimizeFor.putFull)) {
      return {
        ApiFields.name: name,
        ApiFields.archetype: archetype.value,
      };
    }

    // DEFAULT
    return {
      ApiFields.name: name,
      ApiFields.archetype: archetype.value,
      ApiFields.fixedMired: fixedMired,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    if (other.runtimeType != runtimeType) return false;

    return other is LightMetadata &&
        other.name == name &&
        other.archetype == archetype &&
        other.fixedMired == fixedMired;
  }

  @override
  int get hashCode => Object.hash(name, archetype, fixedMired);

  @override
  String toString() =>
      "Instance of 'LightMetadata' ${toJson(optimizeFor: OptimizeFor.dontOptimize).toString()}";
}
