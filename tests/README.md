# Tests

Place your tests here.

## Structure

Organize tests to mirror your source code structure:

**Node.js (Jest/Vitest):**
```
tests/
├── unit/
├── integration/
└── e2e/
```

**Python (pytest):**
```
tests/
├── unit/
├── integration/
├── conftest.py
└── __init__.py
```

**Go:**
```
tests/
├── unit/
└── integration/
```

**Rust:**
Tests typically live in `src/` with `#[cfg(test)]`, but you can also place integration tests here.

## Configuration

Update the `test` script in `package.json` to run your tests:

```json
{
  "scripts": {
    "test": "jest",           // Node.js
    "test": "pytest",         // Python
    "test": "go test ./...",  // Go
    "test": "cargo test"      // Rust
  }
}
```
