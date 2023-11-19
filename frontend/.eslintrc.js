/** @type {import('eslint').Linter.Config} */
const [off, warn, error] = ["off", "warn", "error"]
module.exports = {
  extends: ["@remix-run/eslint-config", "@remix-run/eslint-config/node"],
};
