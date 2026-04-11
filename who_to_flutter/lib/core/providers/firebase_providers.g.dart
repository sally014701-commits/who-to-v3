// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(firebaseAuth)
final firebaseAuthProvider = FirebaseAuthProvider._();

final class FirebaseAuthProvider
    extends $FunctionalProvider<FirebaseAuth, FirebaseAuth, FirebaseAuth>
    with $Provider<FirebaseAuth> {
  FirebaseAuthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'firebaseAuthProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$firebaseAuthHash();

  @$internal
  @override
  $ProviderElement<FirebaseAuth> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FirebaseAuth create(Ref ref) {
    return firebaseAuth(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FirebaseAuth value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FirebaseAuth>(value),
    );
  }
}

String _$firebaseAuthHash() => r'7791bf70ce0f01bf991a53a76abc915478673c0b';

@ProviderFor(firebaseDatabase)
final firebaseDatabaseProvider = FirebaseDatabaseProvider._();

final class FirebaseDatabaseProvider
    extends
        $FunctionalProvider<
          FirebaseDatabase,
          FirebaseDatabase,
          FirebaseDatabase
        >
    with $Provider<FirebaseDatabase> {
  FirebaseDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'firebaseDatabaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$firebaseDatabaseHash();

  @$internal
  @override
  $ProviderElement<FirebaseDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FirebaseDatabase create(Ref ref) {
    return firebaseDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FirebaseDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FirebaseDatabase>(value),
    );
  }
}

String _$firebaseDatabaseHash() => r'2fc0d15b0ac43f604f8a71a90d71ac47842ff0bd';
