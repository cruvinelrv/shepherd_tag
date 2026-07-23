## 0.0.8 - 2026-07-23

* Set `HitTestBehavior.translucent` on `MetaData` in `ShepherdPageKey` and `ShepherdElementKey` to ensure hit testing reliably captures metadata during click interactions.

## 0.0.7 - 2026-06-29

* Expose public metadata classes (`ShepherdPageMetaData` and `ShepherdElementMetaData`) to support hit-testing and pointer interaction tracking (e.g. for heatmap analysis).

## 0.0.6 - 2026-02-27

* Fixed `README.md` documentation to correctly reflect the `Key` nomenclature and current versioning.

## 0.0.5 - 2026-02-27

* Aligned nomenclature to `Key` across the package (`ShepherdPageKey`, `ShepherdElementKey`) for consistency.
* Replaced direct `Semantics` usage in documentation and examples with `ShepherdElementKey`.
* Standardized `ShepherdPageKey` with explicit `label` and `identifier` for enhanced Maestro visibility on Web.

## 0.0.4 - 2026-02-27

* Added `label` parameter to `ShepherdPageTag` widget to improve visibility during automated tests (Maestro) on Flutter Web.
* Improved accessibility by mapping shepherd IDs to `aria-label` in the web DOM.

## 0.0.3

* Updated documentation and examples to match version 0.0.3.
* Internal package maintenance.

## 0.0.2

* Fixed `ShepherdPageTag` to allow its use as a metadata annotation by making the `child` parameter optional.
* When used as a widget without a child, it now defaults to `SizedBox.shrink()`.

## 0.0.1

* Initial release.
* Added `@ShepherdTag` annotation with `id` and `description` fields.
* Added `ShepherdPageTag` widget with `id`, `child`, and `isReady` fields.
