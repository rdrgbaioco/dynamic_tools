import 'package:dynamic_tools/dynamic_tools.dart';
import 'package:dynamic_tools/sources/tools/task/values/unit.dart' as type_unit;

/// Return it when the result of a [TaskObject] is
/// the expected value.
///
@immutable
class Successful<S extends Object, E extends Object>
    implements TaskObject<S, E> {
  /// Receives the [S] param as
  /// the successful result.
  const Successful(
      this._successful,
      );

  /// Build a `Successful` with `Unit` value.
  /// ```dart
  /// Successful.unit() == Successful(unit)
  /// ```
  static Successful<type_unit.Unit, E> unit<E extends Object>() {
    return Successful<type_unit.Unit, E>(type_unit.unit);
  }

  final S _successful;

  @override
  bool isError() => false;

  @override
  bool isSuccess() => true;

  @override
  int get hashCode => _successful.hashCode;

  @override
  bool operator ==(Object other) {
    return other is Successful && other._successful == _successful;
  }

  @override
  W fold<W>(
      W Function(S success) onSuccess,
      W Function(E error) onFailure,
      ) {
    return onSuccess(_successful);
  }

  @override
  E? exceptionOrNull() => null;

  @override
  S getOrNull() => _successful;

  @override
  TaskObject<W, E> flatMap<W extends Object>(
      TaskObject<W, E> Function(S success) fn,
      ) {
    return fn(_successful);
  }

  @override
  TaskObject<S, W> flatMapError<W extends Object>(
      TaskObject<S, W> Function(E error) fn,
      ) {
    return Successful<S, W>(_successful);
  }

  @override
  TaskObject<E, S> swap() {
    return TaskError(_successful);
  }

  @override
  S getOrThrow() {
    return _successful;
  }

  @override
  S getOrElse(S Function(E error) onError) {
    return _successful;
  }

  @override
  S getOrDefault(S defaultValue) => _successful;

  @override
  TaskObject<W, E> map<W extends Object>(W Function(S success) fn) {
    final newSuccess = fn(_successful);
    return Successful<W, E>(newSuccess);
  }

  @override
  TaskObject<S, W> mapError<W extends Object>(W Function(E error) fn) {
    return Successful<S, W>(_successful);
  }

  @override
  TaskObject<W, E> pure<W extends Object>(W success) {
    return map((_) => success);
  }

  @override
  TaskObject<S, W> pureError<W extends Object>(W error) {
    return Successful<S, W>(_successful);
  }

  @override
  TaskObject<S, E> recover(TaskObject<S, E> Function(E error) onError) {
    return Successful<S, E>(_successful);
  }

  @override
  Task<S, E> toTask() async => this;
}
