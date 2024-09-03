# ACT (beta)

ACT (Automated Conformance Testing) tests your software solution against the [PACT Technical
Specifications](https://wbcsd.github.io/data-exchange-protocol/v2/) as part of your CI/CD pipeline.

ACT performs the tests included in [PACT's checklist](https://wbcsd.github.io/pact-conformance-testing/checklist.html), ensuring that your software is ready for bilateral conformance testing. Having ACT in your CI/CD pipeline saves you time and money, by preventing you from engaging in premature manual bilateral testing.

# Usage

## CLI

To use act in the CLI, simply copy the following command, replacing `<url>`, `<user>`, and `<password>` with the URL of your API and the Basic Auth credentials (user and password).

```
curl -sSf https://raw.githubusercontent.com/sine-fdn/act/main/act.sh | bash -s -- test -e "<url>" -u "<user>" -p "<password>"
```

### Architecture

To specify the architecture of the binary you want to run, pass the environment variable `ARCH` with either the value `"arm64"` or the value `"x86-64"`. Defaults to `"arm64"`.

> Note: Any other value is considered invalid and the default will be used.

### Skip HTTP-only tests

If you're testing against a local server, test cases 014, 015, and 016 will always fail, since these actions are made available through HTTP (non-HTTPS). We recommend skipping these tests by adding the argument `--skip-http-check`.

**Example with SINE's iLEAP demo API**
```
ARCH="arm64" curl -sSf https://raw.githubusercontent.com/sine-fdn/act/main/act.sh | bash -s -- test -e "https://api.ileap.sine.dev" -u "hello" -p "pathfinder" --skip-http-check
```
## GitHub Workflow

Adding ACT to your CI/CD pipeline with GitHub is as simple as including the following job in your GitHub workflow, replacing `<url>`, `<user>`, and `<password>` with the URL of your API and the Basic Auth credentials (user and password).

```
  act_test:
    name: ACT Test
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Run ACT (test)
        env:
          ARCH: "x86-64"
        run: |
          set -o pipefail
          curl -sSf https://raw.githubusercontent.com/sine-fdn/act/main/act.sh | \
          bash -s -- test \
          -e `<url>` \
          -u `<user>` \
          -p `<password>` \
```

The Basic Auth credentials can (and should) be passed in through repository secrets (e.g., `${{secrets.ACT_USER}}` and `${{secrets.ACT_PASSWORD}}`).

In case you're testing against your development build, you need to have it run in parallel. In that case, include also the flag `--skip-http-check`.
