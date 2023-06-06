// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getDocumentsHash() => r'ece5a60fdf5937372a0d588e384b97e21382fbca';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef GetDocumentsRef
    = AutoDisposeFutureProviderRef<List<ConsultantDocumentsEntity>>;

/// See also [getDocuments].
@ProviderFor(getDocuments)
const getDocumentsProvider = GetDocumentsFamily();

/// See also [getDocuments].
class GetDocumentsFamily
    extends Family<AsyncValue<List<ConsultantDocumentsEntity>>> {
  /// See also [getDocuments].
  const GetDocumentsFamily();

  /// See also [getDocuments].
  GetDocumentsProvider call(
    int personType,
  ) {
    return GetDocumentsProvider(
      personType,
    );
  }

  @override
  GetDocumentsProvider getProviderOverride(
    covariant GetDocumentsProvider provider,
  ) {
    return call(
      provider.personType,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getDocumentsProvider';
}

/// See also [getDocuments].
class GetDocumentsProvider
    extends AutoDisposeFutureProvider<List<ConsultantDocumentsEntity>> {
  /// See also [getDocuments].
  GetDocumentsProvider(
    this.personType,
  ) : super.internal(
          (ref) => getDocuments(
            ref,
            personType,
          ),
          from: getDocumentsProvider,
          name: r'getDocumentsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getDocumentsHash,
          dependencies: GetDocumentsFamily._dependencies,
          allTransitiveDependencies:
              GetDocumentsFamily._allTransitiveDependencies,
        );

  final int personType;

  @override
  bool operator ==(Object other) {
    return other is GetDocumentsProvider && other.personType == personType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, personType.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$uploadDocumentHash() => r'95f8cac2ee3f8e7c24eb5d484e9d70766ef719f1';
typedef UploadDocumentRef = AutoDisposeFutureProviderRef<dynamic>;

/// See also [uploadDocument].
@ProviderFor(uploadDocument)
const uploadDocumentProvider = UploadDocumentFamily();

/// See also [uploadDocument].
class UploadDocumentFamily extends Family<AsyncValue<dynamic>> {
  /// See also [uploadDocument].
  const UploadDocumentFamily();

  /// See also [uploadDocument].
  UploadDocumentProvider call(
    Map<dynamic, dynamic> map,
    ConsultantDocumentsEntity doc,
    BuildContext context,
  ) {
    return UploadDocumentProvider(
      map,
      doc,
      context,
    );
  }

  @override
  UploadDocumentProvider getProviderOverride(
    covariant UploadDocumentProvider provider,
  ) {
    return call(
      provider.map,
      provider.doc,
      provider.context,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'uploadDocumentProvider';
}

/// See also [uploadDocument].
class UploadDocumentProvider extends AutoDisposeFutureProvider<dynamic> {
  /// See also [uploadDocument].
  UploadDocumentProvider(
    this.map,
    this.doc,
    this.context,
  ) : super.internal(
          (ref) => uploadDocument(
            ref,
            map,
            doc,
            context,
          ),
          from: uploadDocumentProvider,
          name: r'uploadDocumentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$uploadDocumentHash,
          dependencies: UploadDocumentFamily._dependencies,
          allTransitiveDependencies:
              UploadDocumentFamily._allTransitiveDependencies,
        );

  final Map<dynamic, dynamic> map;
  final ConsultantDocumentsEntity doc;
  final BuildContext context;

  @override
  bool operator ==(Object other) {
    return other is UploadDocumentProvider &&
        other.map == map &&
        other.doc == doc &&
        other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, map.hashCode);
    hash = _SystemHash.combine(hash, doc.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$documentControllerHash() =>
    r'c319337ab67b659db34ae2ee065c54ca3ff384fb';

/// See also [DocumentController].
@ProviderFor(DocumentController)
final documentControllerProvider =
    AutoDisposeNotifierProvider<DocumentController, File>.internal(
  DocumentController.new,
  name: r'documentControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$documentControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DocumentController = AutoDisposeNotifier<File>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
