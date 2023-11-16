enum StatusState { initial, loading, success, error }

class BaseState<T> {
  StatusState status;
  T? data;
  dynamic message;
  BaseState({
    this.status = StatusState.initial,
    this.data,
    this.message,
  });

  BaseState<T> copyWith({
    StatusState? status,
    bool? isLoading,
    T? data,
    dynamic message,
  }) {
    return BaseState<T>(
      status: status ?? this.status,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
