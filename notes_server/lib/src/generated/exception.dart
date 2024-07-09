/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class CustomException
    implements
        _i1.SerializableException,
        _i1.SerializableModel,
        _i1.ProtocolSerialization {
  CustomException._({required this.message});

  factory CustomException({required String message}) = _CustomExceptionImpl;

  factory CustomException.fromJson(Map<String, dynamic> jsonSerialization) {
    return CustomException(message: jsonSerialization['message'] as String);
  }

  String message;

  CustomException copyWith({String? message});
  @override
  Map<String, dynamic> toJson() {
    return {'message': message};
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {'message': message};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CustomExceptionImpl extends CustomException {
  _CustomExceptionImpl({required String message}) : super._(message: message);

  @override
  CustomException copyWith({String? message}) {
    return CustomException(message: message ?? this.message);
  }
}
