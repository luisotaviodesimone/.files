---
name: typescript-quality
description: Enforces quality standards for TypeScript projects: correct test/lint/typecheck commands, forbidden TS keywords, factory-based test patterns, no ESLint directives, and package manager priority order.
triggers:
  - always
---

# TypeScript Quality Standards

Apply every rule below whenever working in a TypeScript project (any repo containing a `tsconfig.json` or `package.json` with TypeScript as a dependency).

---

## 1. Package Manager Priority

Before running any script or installing packages, detect the package manager in this order:

1. `yarn` — if `yarn.lock` or `"packageManager": "yarn"` is present
2. `bun` — if `bun.lockb` or `"packageManager": "bun"` is present
3. `npx` — fallback for one-off CLI tools when no lock file is found
4. `npm` — last resort only

Never mix managers within the same project (e.g., don't run `npm install` in a Yarn workspace).

---

## 2. Running Tests

### Unit tests
```
yarn test:unit          # or the project's specific yarn test:* variant
yarn test:unit:watch
yarn test:unit:coverage
```

### E2E tests
```
yarn test:e2e           # or the project's specific yarn test:e2e:* variant
yarn test:e2e:watch
```

**Rules:**
- Always use `yarn test:*` or `yarn test:e2e:*` — never `jest` or `vitest` directly.
- If the exact script name is uncertain, read `package.json` scripts first and pick the closest match.
- Do not add `--testPathPattern` or other raw Jest/Vitest flags unless the `yarn test:*` script explicitly supports them.

---

## 3. Type Checking and Linting

Run in this order when validating the codebase:

```bash
yarn lint:fix          # lint + auto-fix
npx tsc --noEmit       # type check (no output files)
```

- Never run `eslint` or `prettier` directly — always go through `yarn lint:fix`.
- Never skip `--noEmit` on the tsc call; this is a check, not a build.
- Fix every error reported before marking a task complete.

---

## 4. Forbidden TypeScript Patterns

**Never** introduce the following in source or test code:

| Forbidden | Reason |
|-----------|--------|
| `as SomeType` | Masks real type errors; use proper narrowing or generics |
| `as unknown` | Double-cast escape hatch — find the real type instead |
| `any` | Defeats the type system entirely |
| `@ts-ignore` | Silences errors without fixing them |
| `@ts-expect-error` | Acceptable only in test files asserting intentional type errors; never in source |
| `// eslint-disable` | Do not suppress ESLint warnings or errors with directives |
| `/* eslint-disable */` | Same — fix the underlying issue instead |

**Preferred alternatives:**
- Use type guards (`if (typeof x === 'string')`, `instanceof`, discriminated unions).
- Use generics to propagate types without casting.
- Use `satisfies` operator for object literal checks without widening.
- Narrow with `in` operator or custom type predicates.

---

## 5. Test Patterns

### Use factories, not inline literals

Bad:
```ts
const user = { id: 1, name: 'Alice', email: 'alice@example.com', role: 'admin' }
```

Good:
```ts
const user = userFactory({ role: 'admin' })
```

**Rules:**
- Create or reuse factory functions for any entity used in more than one test.
- Factories should provide sensible defaults and accept a partial override argument.
- Place factories in a `__factories__/` or `test/factories/` directory alongside the tests that use them.
- Never duplicate fixture objects across test files — extract to a shared factory.

### No ESLint directives in tests

Test files follow the same no-directive rule as source files. Fix the root cause instead of silencing the linter.

---

## Checklist Before Marking a Task Complete

- [ ] `yarn lint:fix` passes with zero errors
- [ ] `npx tsc --noEmit` passes with zero errors
- [ ] No `as`, `unknown` (as a cast target), or `any` introduced
- [ ] No `@ts-ignore`, `eslint-disable`, or similar directives added
- [ ] Tests use factory functions, not inline object literals
- [ ] Tests run via `yarn test:*` / `yarn test:e2e:*` and pass
