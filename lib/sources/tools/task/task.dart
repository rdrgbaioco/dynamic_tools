import 'dart:async';
import 'package:dynamic_tools/dynamic_tools.dart';

/// `AsyncTask<S, E>` represents an asynchronous computation.
typedef Task<S extends Object, E extends Object> = Future<TaskObject<S, E>>;

/// `AsyncResult<S, E>` represents an asynchronous computation.
extension AsyncTaskExtension<S extends Object, E extends Object> on Task<S, E> {
  /// Returns a new `Task`, mapping any `Successful` value
  /// using the given transformation and unwrapping the produced `Task`.
  Task<W, E> flatMap<W extends Object>(
      FutureOr<TaskObject<W, E>> Function(S successful) fn,
      ) {
    return then((result) => result.fold(fn, TaskError.new));
  }

  /// Returns a new `Task`, mapping any `Error` value
  /// using the given transformation and unwrapping the produced `Task`.
  Task<S, W> flatMapError<W extends Object>(
      FutureOr<TaskObject<S, W>> Function(E error) fn,
      ) {
    return then((result) => result.fold(Successful.new, fn));
  }

  /// Returns a new `Task`, mapping any `Successful` value
  /// using the given transformation.
  Task<W, E> map<W extends Object>(W Function(S success) fn) {
    return then((result) => result.map(fn));
  }

  /// Returns a new `Task`, mapping any `Error` value
  /// using the given transformation.
  Task<S, W> mapError<W extends Object>(W Function(E error) fn) {
    return then((result) => result.mapError(fn));
  }

  /// Change a [Success] value.
  Task<W, E> pure<W extends Object>(W success) {
    return then((result) => result.pure(success));
  }

  /// Change the [Failure] value.
  Task<S, W> pureError<W extends Object>(W error) {
    return mapError((_) => error);
  }

  /// Swap the values contained inside the [Success] and [TaskError]
  /// of this [AsyncResult].
  Task<E, S> swap() {
    return then((result) => result.swap());
  }

  /// Returns the Future task of onSuccess for the encapsulated value
  /// if this instance represents `Success` or the task of onError function
  /// for the encapsulated value if it is `Error`.
  Future<W> fold<W>(
      W Function(S success) onSuccess,
      W Function(E error) onError,
      ) {
    return then<W>((result) => result.fold(onSuccess, onError));
  }

  /// Returns the future value of [S] if any.
  Future<S?> getOrNull() {
    return then((result) => result.getOrNull());
  }

  /// Returns the future value of [F] if any.
  Future<E?> exceptionOrNull() {
    return then((result) => result.exceptionOrNull());
  }

  /// Returns true if the current task is an [TaskError].
  Future<bool> isError() {
    return then((result) => result.isError());
  }

  /// Returns true if the current task is a [Success].
  Future<bool> isSuccess() {
    return then((result) => result.isSuccess());
  }

  /// Returns the success value as a throwing expression.
  Future<S> getOrThrow() {
    return then((result) => result.getOrThrow());
  }

  /// Returns the encapsulated value if this instance represents `Successful`
  /// or the result of `onError` function for
  /// the encapsulated a `TaskError` value.
  Future<S> getOrElse(S Function(E) onError) {
    return then((result) => result.getOrElse(onError));
  }

  /// Returns the encapsulated value if this instance represents
  /// `Success` or the `defaultValue` if it is `TaskError`.
  Future<S> getOrDefault(S defaultValue) {
    return then((result) => result.getOrDefault(defaultValue));
  }

  /// Returns the encapsulated `Task` of the given transform function
  /// applied to the encapsulated a `TaskError` or the original
  /// encapsulated value if it is success.
  Task<S, E> recover(
      FutureOr<TaskObject<S, E>> Function(E error) onError,
      ) {
    return then((result) => result.fold(Successful.new, onError));
  }
}
