# Contributing to Animated Habit Heatmap

Thank you for your interest in contributing! This document provides guidelines and instructions for contributing to the project.

## Code of Conduct

Please be respectful and constructive in all interactions with other contributors.

## Getting Started

1. **Fork the repository** on GitHub
2. **Clone your fork** locally:
   ```bash
   git clone https://github.com/yourusername/animated_habit_heatmap.git
   cd animated_habit_heatmap
   ```
3. **Install dependencies**:
   ```bash
   flutter pub get
   ```
4. **Create a feature branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```

## Development Workflow

### Running Tests
```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/animated_habit_heatmap_test.dart

# Run with coverage
flutter test --coverage
```

### Code Style
- Follow [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Use `flutter analyze` to check for issues:
  ```bash
  flutter analyze
  ```
- Format your code:
  ```bash
  dart format lib/
  ```

### Documentation
- Add comprehensive dartdoc comments to all public APIs
- Update README.md if adding user-facing features
- Update FEATURES.md for capability changes
- Include code examples in documentation

## Submitting Changes

### Before Submitting
- [ ] Tests pass: `flutter test`
- [ ] No analysis warnings: `flutter analyze`
- [ ] Code follows linting rules: `flutter analyze --no-preamble`
- [ ] CI checks pass (GitHub Actions)
- [ ] Code is formatted: `dart format lib/`
- [ ] Documentation is updated
- [ ] CHANGELOG.md is updated
- [ ] Changes are focused and well-motivated

### Pull Request Process

1. **Write a clear PR title** that describes your changes
2. **Fill in the PR template** with:
   - Description of changes
   - Related issue (if any)
   - Type of change (bugfix, feature, documentation, etc.)
   - Testing performed
3. **Keep commits clean and atomic**
4. **Respond to review feedback** promptly

## Types of Contributions

### Bug Reports
- Use GitHub Issues to report bugs
- Include reproduction steps
- Attach minimal example code if possible
- Note your Flutter and Dart versions

### Feature Requests
- Describe the use case and benefit
- Provide code examples if applicable
- Explain how it fits with existing features
- Consider backward compatibility

### Documentation
- Fix typos and improve clarity
- Add examples for better understanding
- Improve API documentation
- Create tutorials or guides

### Code Improvements
- Performance optimizations
- Code refactoring for clarity
- Better error handling
- Test coverage improvements

## Testing Guidelines

### Unit Tests
- Test utilities functions thoroughly
- Include edge cases
- Test with empty data
- Test with large datasets

### Widget Tests
- Test rendering with different configurations
- Verify callback functionality
- Test with various data sizes
- Test responsive behavior

### Example Coverage
- Basic usage example
- Custom configuration example
- Interactive example
- Analytics example

## Documentation Guidelines

### Dartdoc Comments
```dart
/// Brief description of the feature.
///
/// More detailed explanation if needed.
///
/// Example:
/// ```dart
/// // Code example here
/// ```
///
/// Parameters:
/// - [param1]: Description of param1
///
/// Returns: Description of return value
```

### README Sections
- Feature overview with emojis
- Installation instructions
- Basic usage example
- API reference
- Color scheme examples
- Troubleshooting
- Contributing section

## Project Structure

```
animated_habit_heatmap/
├── lib/
│   ├── animated_habit_heatmap.dart       # Main library export
│   └── src/
│       ├── models/
│       │   └── heatmap_day.dart          # Data model
│       ├── widgets/
│       │   ├── heatmap_grid.dart         # Main heatmap widget
│       │   └── heatmap_cell.dart         # Individual cell widget
│       └── utils/
│           ├── heatmap_utils.dart        # Utility functions
│           └── heatmap_color_scheme.dart # Color palettes
├── test/
│   └── animated_habit_heatmap_test.dart  # Test suite
├── example/
│   ├── lib/
│   │   └── main.dart                     # Example app
│   └── pubspec.yaml
├── README.md
├── CHANGELOG.md
├── FEATURES.md
├── CONTRIBUTING.md
└── pubspec.yaml
```

## Versioning

We follow [Semantic Versioning](https://semver.org/):
- **MAJOR**: Breaking changes
- **MINOR**: New features (backward compatible)
- **PATCH**: Bug fixes (backward compatible)

Update version in `pubspec.yaml` and document changes in `CHANGELOG.md`.

## Performance Considerations

- Minimize widget rebuilds
- Use const constructors where possible
- Avoid unnecessary calculations in build methods
- Cache computed values
- Profile with Flutter DevTools

## Accessibility

- Ensure color choices have sufficient contrast
- Add semantic labels to interactive elements
- Test with screen readers
- Provide text alternatives for visual information

## Questions?

- Check existing [Issues](https://github.com/mayankthakur/animated_habit_heatmap/issues)
- Read the [README.md](README.md)
- Review the [FEATURES.md](FEATURES.md)
- Start a new Issue for questions

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

Thank you for contributing to make this project better! 🚀
