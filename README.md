# License Existence Checker (LEC) 📝

[![GitHub Marketplace](https://img.shields.io/badge/Marketplace-License%20Existence%20Checker-blue.svg?colorA=24292e&colorB=0366d6&style=flat&longCache=true&logo=github)](https://github.com/marketplace/actions/license-existence-checker)

License Existence Checker is a GitHub Action with a simple purpose - to check for the _existence_ of a LICENSE file.

This is particularly useful in large organisations, with many repositories which should all adhere to a common licensing standard.

### Conditions:

- the Action only looks in the root of the repository and checks for the existence of the LICENSE file there.
- the Action does not care about the contents of the LICENSE file, as such an empty file called LICENSE will result in the Action running successfully.
- the Action is case sensitive and only tests for "LICENSE".

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
