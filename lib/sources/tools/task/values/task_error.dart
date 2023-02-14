import 'package:dynamic_tools/dynamic_tools.dart';
import 'package:dynamic_tools/sources/tools/task/values/unit.dart' as type_unit;


/// Return it when the result of a [TaskObject] is
/// not the expected value.
///
@immutable
class TaskError<S extends Object, E extends Object>
    implements TaskObject<S, E> {
  /// Receives the [E] param as
  /// the error return.
  const TaskError(this._error);

  /// Build a `TaskError` with `Unit` value.
  /// ```dart
  /// Failure.unit() == Failure(unit)
  /// ```
  static TaskError<S, type_unit.Unit> unit<S extends Object>() {
    return TaskError<S, type_unit.Unit>(type_unit.unit);
  }

  final E _error;

  @override
  bool isError() => true;

  @override
  bool isSuccess() => false;

  @override
  int get hashCode => _error.hashCode;

  @override
  bool operator ==(Object other) => //
  other is TaskError && other._error == _error;

  @override
  W fold<W>(
      W Function(S succcess) onSuccess,
      W Function(E error) onError,
      ) {
    return onError(_error);
  }

  @override
  E exceptionOrNull() => _error;

  @override
  S? getOrNull() => null;

  @override
  TaskObject<W, E> flatMap<W extends Object>(
      TaskObject<W, E> Function(S success) fn,
      ) {
    return TaskError<W, E>(_error);
  }

  @override
  TaskObject<S, W> flatMapError<W extends Object>(
      TaskObject<S, W> Function(E error) fn,
      ) {
    return fn(_error);
  }

  @override
  TaskObject<E, S> swap() {
    return Successful(_error);
  }

  @override
  S getOrThrow() {
    throw _error!;
  }

  @override
  S getOrElse(S Function(E failure) onError) {
    return onError(_error);
  }

  @override
  S getOrDefault(S defaultValue) => defaultValue;

  @override
  TaskObject<W, E> map<W extends Object>(W Function(S successful) fn) {
    return TaskError<W, E>(_error);
  }

  @override
  TaskObject<S, W> mapError<W extends Object>(W Function(E error) fn) {
    final newError = fn(_error);
    return TaskError(newError);
  }

  @override
  TaskObject<W, E> pure<W extends Object>(W success) {
    return TaskError<W, E>(_error);
  }

  @override
  TaskObject<S, W> pureError<W extends Object>(W error) {
    return mapError((e) => error);
  }

  @override
  TaskObject<S, E> recover(TaskObject<S, E> Function(E error) onError) {
    return onError(_error);
  }

  @override
  Task<S, E> toTask() async => this;
}
