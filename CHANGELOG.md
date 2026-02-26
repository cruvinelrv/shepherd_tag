## 0.0.2

* Fixed `ShepherdPageTag` to allow its use as a metadata annotation by making the `child` parameter optional.
* When used as a widget without a child, it now defaults to `SizedBox.shrink()`.

## 0.0.1

* Initial release.
* Added `@ShepherdTag` annotation with `id` and `description` fields.
* Added `ShepherdPageTag` widget with `id`, `child`, and `isReady` fields.
