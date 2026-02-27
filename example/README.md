# Shepherd Tag Example

This example demonstrates how to use the `shepherd_tag` package to implement lightweight tagging in your Flutter applications. It also shows how the Shepherd automation suite uses these tags to generate automated tests.

## Structure

- `lib/tags.dart`: Definition of feature/story tags using `@ShepherdTag` and semantic constants.
- `main.dart`: Implementation of a simple Login Page wrapped in `ShepherdPageKey`.
- `.shepherd/`: Official Shepherd configuration folder. This is where the CLI looks for project metadata to enrich test generation.

## How it Works

### 1. Tag Discovery (@ShepherdTag)
The Shepherd CLI scans your `lib/` folder for classes annotated with `@ShepherdTag`. It uses the `id` to link the code to a specific User Story.

### 2. Context Enrichment (.shepherd/)
The CLI reads the files in the `.shepherd/` folder to add more context to the generated tests:
- **shepherd_activity.yaml**: Provides real titles, descriptions, and lists of tasks for each story.
- **feature_toggles.yaml**: Allows the CLI to know if a feature is behind a toggle.
- **domains.yaml**: Maps features to specific business domains.

### 3. Execution (ShepherdPageKey)
In the widget tree, `ShepherdPageKey` ensures that the story ID is exposed via **Flutter Semantics**. This allows tools like **Maestro** to find and interact with the page during test execution.

The generated flows are saved in `.shepherd/maestro/flows/` to keep your project root clean and centralized.

## Running the Example

1. Ensure you have Flutter installed.
2. Run `flutter pub get`.
3. Try running the Shepherd CLI on this folder to see the test generation in action!
