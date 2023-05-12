module.exports = {
  root: true,
  env: {
    browser: true,
    es2022: true,
    node: true,
  },
  extends: [
    "eslint:recommended",
    // LANGS
    "plugin:json/recommended",
    "plugin:mdx/recommended",
    "plugin:yaml/recommended",
    // PRETTIER
    "plugin:prettier/recommended",
    "prettier", // prettier-config
  ],
  overrides: [
    {
      files: ["*.md"],
      rules: {
        "prettier/prettier": ["warn", { parser: "markdown" }],
      },
    },
  ],
  parserOptions: {
    ecmaVersion: "latest",
    ecmaFeatures: {
      impliedStrict: true,
    },
  },
  plugins: ["json", "prettier", "yaml"],
  rules: {
    "prettier/prettier": "warn",
  },
  ignorePatterns: [
    "*~",
    "**/__pycache__",
    ".git",
    "!.circleci",
    ".mypy_cache",
    ".pytest_cache",
    ".venv*",
    "dist",
    "package-lock.json",
    "test-results",
    "typings",
  ],
};
