// /// Receives two values [S] and [E]
// /// as [S] is a successful and [E] is an error.
// ///
// final class TaskObject<S, E> {
//   const TaskObject(S? success, E? error)
//       : _success = success,
//         _error = error;
//
//   final S? _success;
//   final E? _error;
//
//   bool isSuccessful() {
//     return _success != null;
//   }
//
//   T? result<T>() {
//     if (_success == null) {
//       return _error as T?;
//     }
//
//     return _success as T?;
//   }
// }
