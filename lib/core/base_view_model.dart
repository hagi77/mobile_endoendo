abstract class BaseViewModel {
  void Function()? callback;

  void addListener(void Function() listener) {
    callback = listener;
  }

  void removeListener() {
    callback = null;
  }

  void updateView() {
    callback?.call();
  }
}
