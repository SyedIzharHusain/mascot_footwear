class ApiResponse<Type> {
  Status status;
  Type? data;
  String? message;

  ApiResponse.initial(this.message) : status = Status.initial;

  ApiResponse.loading(this.message) : status = Status.loading;

  ApiResponse.completed(this.data) : status = Status.completed;

  ApiResponse.error(this.message) : status = Status.error;

  ApiResponse.empty(this.message) : status = Status.empty;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { initial, loading, completed, error,empty}
