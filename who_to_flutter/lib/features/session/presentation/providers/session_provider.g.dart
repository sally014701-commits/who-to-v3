// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SessionNotifier)
final sessionProvider = SessionNotifierFamily._();

final class SessionNotifierProvider
    extends $StreamNotifierProvider<SessionNotifier, SessionModel?> {
  SessionNotifierProvider._({
    required SessionNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'sessionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sessionNotifierHash();

  @override
  String toString() {
    return r'sessionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SessionNotifier create() => SessionNotifier();

  @override
  bool operator ==(Object other) {
    return other is SessionNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sessionNotifierHash() => r'19c14dea5335a8b63977b6b4684147e460d04f22';

final class SessionNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          SessionNotifier,
          AsyncValue<SessionModel?>,
          SessionModel?,
          Stream<SessionModel?>,
          String
        > {
  SessionNotifierFamily._()
    : super(
        retry: null,
        name: r'sessionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SessionNotifierProvider call(String code) =>
      SessionNotifierProvider._(argument: code, from: this);

  @override
  String toString() => r'sessionProvider';
}

abstract class _$SessionNotifier extends $StreamNotifier<SessionModel?> {
  late final _$args = ref.$arg as String;
  String get code => _$args;

  Stream<SessionModel?> build(String code);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<SessionModel?>, SessionModel?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SessionModel?>, SessionModel?>,
              AsyncValue<SessionModel?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
