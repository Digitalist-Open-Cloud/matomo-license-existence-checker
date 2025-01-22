# Matomo License Existence Checker

Matomo License Existence Checker is a GitHub Action with a simple purpose - to check for the _existence_ of a LICENSE file and a license key in plugin.json.

### Conditions:

- the action only looks in the root of the repository and checks for the existence of the LICENSE file there.
- the action does not care about the contents of the LICENSE file, as such an empty file called LICENSE will result in the Action running successfully.
- the action looks for an license key in plugin.json

### Prerequisites

To use this Action first call the [checkout](https://github.com/actions/checkout) action. For example:

```yaml
on:
  pull_request: {}
  workflow_dispatch: {}
  push:
    branches: ["main"]
jobs:
  existence:
    runs-on: ubuntu-24.04
    steps:
      - uses: actions/checkout@v4
      - name: Matomo license existence checker
        uses: Digitalist-Open-Cloud/matomo-license-existence-checker@main
```
