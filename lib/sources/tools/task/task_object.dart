import 'package:dynamic_tools/dynamic_tools.dart';

/// Receives two values [S] and [E]
/// as [E] is an error and [S] is a successful.
///
@sealed
abstract class TaskObject<S extends Object, E extends Object> {
  /// Build a [Task] that returns a [Successful].
  factory TaskObject.success(S s) => Successful(s);

  /// Build a [Task] that returns a [TaskError].
  factory TaskObject.error(E e) => TaskError(e);

  /// Returns the success value as a throwing expression.
  S getOrThrow();

  /// Returns the encapsulated value if this instance represents `Successful`
  /// or the result of `onError` function for
  /// the encapsulated a `TaskError` value.
  S getOrElse(S Function(E error) onError);

  /// Returns the encapsulated value if this instance represents
  /// `Success` or the `defaultValue` if it is `TaskError`.
  S getOrDefault(S defaultValue);

  /// Returns the value of [Successful] or null.
  S? getOrNull();

  /// Returns the value of [TaskError] or null.
  E? exceptionOrNull();

  /// Returns true if the current result is an [Failure].
  bool isError();

  /// Returns true if the current result is a [Success].
  bool isSuccess();

  /// Returns the result of onSuccess for the encapsulated value
  /// if this instance represents `Successful` or the result of onError function
  /// for the encapsulated value if it is `TaskError`.
  W fold<W>(
      W Function(S success) onSuccess,
      W Function(E error) onError,
      );

  /// Returns a new `Task`, mapping any `Successful` value
  /// using the given transformation.
  TaskObject<W, E> map<W extends Object>(W Function(S success) fn);

  /// Returns a new `Task`, mapping any `Error` value
  /// using the given transformation.
  TaskObject<S, W> mapError<W extends Object>(W Function(E error) fn);

  /// Returns a new `Task`, mapping any `Successful` value
  /// using the given transformation and unwrapping the produced `Task`.
  TaskObject<W, E> flatMap<W extends Object>(
      TaskObject<W, E> Function(S success) fn);

  /// Returns a new `Task`, mapping any `Error` value
  /// using the given transformation and unwrapping the produced `Task`.
  TaskObject<S, W> flatMapError<W extends Object>(
      TaskObject<S, W> Function(E error) fn,
      );

  /// Change the [Successful] value.
  TaskObject<W, E> pure<W extends Object>(W success);

  /// Change the [TaskError] value.
  TaskObject<S, W> pureError<W extends Object>(W error);

  /// Return a [Task].
  Task<S, E> toTask();

  /// Swap the values contained inside the [Successful] and [TaskError]
  /// of this [Result].
  TaskObject<E, S> swap();

  /// Returns the encapsulated `Task` of the given transform function
  /// applied to the encapsulated a `TaskError` or the original
  /// encapsulated value if it is success.
  TaskObject<S, E> recover(TaskObject<S, E> Function(E error) onError);
}
