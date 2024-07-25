# ACT (beta)

ACT (Automated Conformance Testing) tests your software solution against the [PACT Technical
Specifications](https://wbcsd.github.io/data-exchange-protocol/v2/) as part of your CI/CD pipeline.

ACT performs the tests included in [PACT's checklist](https://wbcsd.github.io/pact-conformance-testing/checklist.html), ensuring that your software is ready for bilateral conformance testing. Having ACT in your CI/CD pipeline saves you time and money, by preventing you from engaging in premature manual bilateral testing.

# Usage

## CLI

To use act in the CLI, simply copy the following command, replacing `<url>`, `<user>`, and `<`password>` with the URL of your API and the Basic Auth credentials (user and password).

```
curl -sSf https://raw.githubusercontent.com/sine-fdn/act/main/act.sh | bash -s -- "<url>" "<user>" "<password>"
```

### Architecture

To specify the architecture of the binary you want to run, pass the environment variable `ARCH` with either the value `"arm64"` or the value `"x86-64"`. Defaults to `"arm64"`.

> Note: Any other value is considered invalid and the default will be used.

### Skip HTTP-only tests

If you're testing against a local server, test cases 014, 015, and 016 will always fail, since these actions are made available through HTTP (non-HTTPS). We recommend skipping these tests by adding the argument `--skip-http-check`.

**Example with SINE's iLEAP demo API**
```
ARCH="arm64 "curl -sSf https://raw.githubusercontent.com/sine-fdn/act/main/act.sh | bash -s -- "https://api.ileap.sine.dev" "hello" "pathfinder" --skip-http-check
```
