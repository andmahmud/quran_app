sealed class Result<T> {
  const Result();

  const factory Result.success(T data) = Success<T>;
  const factory Result.failure(String message) = ResultFailure<T>;
  const factory Result.loading() = Loading<T>;

  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is ResultFailure<T>;
  bool get isLoading => this is Loading<T>;

  T? get data => switch (this) {
    Success<T> s => s.data,
    _ => null,
  };

  String? get errorMessage => switch (this) {
    ResultFailure<T> f => f.message,
    _ => null,
  };
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

class ResultFailure<T> extends Result<T> {
  final String message;
  const ResultFailure(this.message);
}

class Loading<T> extends Result<T> {
  const Loading();
}
