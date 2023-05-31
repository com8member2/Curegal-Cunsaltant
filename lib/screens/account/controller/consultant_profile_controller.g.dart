// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultant_profile_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addConsultantHash() => r'cc2d492c3ac14295ab0ac6ce35de4aa697552287';

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

typedef AddConsultantRef = AutoDisposeFutureProviderRef<void>;

/// See also [addConsultant].
@ProviderFor(addConsultant)
const addConsultantProvider = AddConsultantFamily();

/// See also [addConsultant].
class AddConsultantFamily extends Family<AsyncValue<void>> {
  /// See also [addConsultant].
  const AddConsultantFamily();

  /// See also [addConsultant].
  AddConsultantProvider call(
    String userNameController,
    String emailController,
    String dateController,
    String selectedGender,
    String stateController,
    String cityController,
    String phoneNumber,
    String consulting_price,
    BuildContext context,
  ) {
    return AddConsultantProvider(
      userNameController,
      emailController,
      dateController,
      selectedGender,
      stateController,
      cityController,
      phoneNumber,
      consulting_price,
      context,
    );
  }

  @override
  AddConsultantProvider getProviderOverride(
    covariant AddConsultantProvider provider,
  ) {
    return call(
      provider.userNameController,
      provider.emailController,
      provider.dateController,
      provider.selectedGender,
      provider.stateController,
      provider.cityController,
      provider.phoneNumber,
      provider.consulting_price,
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
  String? get name => r'addConsultantProvider';
}

/// See also [addConsultant].
class AddConsultantProvider extends AutoDisposeFutureProvider<void> {
  /// See also [addConsultant].
  AddConsultantProvider(
    this.userNameController,
    this.emailController,
    this.dateController,
    this.selectedGender,
    this.stateController,
    this.cityController,
    this.phoneNumber,
    this.consulting_price,
    this.context,
  ) : super.internal(
          (ref) => addConsultant(
            ref,
            userNameController,
            emailController,
            dateController,
            selectedGender,
            stateController,
            cityController,
            phoneNumber,
            consulting_price,
            context,
          ),
          from: addConsultantProvider,
          name: r'addConsultantProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addConsultantHash,
          dependencies: AddConsultantFamily._dependencies,
          allTransitiveDependencies:
              AddConsultantFamily._allTransitiveDependencies,
        );

  final String userNameController;
  final String emailController;
  final String dateController;
  final String selectedGender;
  final String stateController;
  final String cityController;
  final String phoneNumber;
  final String consulting_price;
  final BuildContext context;

  @override
  bool operator ==(Object other) {
    return other is AddConsultantProvider &&
        other.userNameController == userNameController &&
        other.emailController == emailController &&
        other.dateController == dateController &&
        other.selectedGender == selectedGender &&
        other.stateController == stateController &&
        other.cityController == cityController &&
        other.phoneNumber == phoneNumber &&
        other.consulting_price == consulting_price &&
        other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userNameController.hashCode);
    hash = _SystemHash.combine(hash, emailController.hashCode);
    hash = _SystemHash.combine(hash, dateController.hashCode);
    hash = _SystemHash.combine(hash, selectedGender.hashCode);
    hash = _SystemHash.combine(hash, stateController.hashCode);
    hash = _SystemHash.combine(hash, cityController.hashCode);
    hash = _SystemHash.combine(hash, phoneNumber.hashCode);
    hash = _SystemHash.combine(hash, consulting_price.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$getConsultantProfileHash() =>
    r'ec8afccc524a7e2ac8698585196a3cda67c476bd';

/// See also [getConsultantProfile].
@ProviderFor(getConsultantProfile)
final getConsultantProfileProvider =
    AutoDisposeFutureProvider<List<dynamic>>.internal(
  getConsultantProfile,
  name: r'getConsultantProfileProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getConsultantProfileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetConsultantProfileRef = AutoDisposeFutureProviderRef<List<dynamic>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
