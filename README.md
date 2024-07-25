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

> Note: If you're testing against a local server, test cases 014, 015, and 016 will always fail, since these actions are made available through HTTP (non-HTTPS). We recommend skipping these tests by addind `--skip-http-check` to the command above:
>  ```
> curl -sSf https://raw.githubusercontent.com/sine-fdn/act/main/act.sh | bash -s -- "<url>" "<user>" > "<password>" --skip-http-check
> ```

**Example with SINE's iLEAP demo API**
```
curl -sSf https://raw.githubusercontent.com/sine-fdn/act/main/act.sh | bash -s -- "https://api.ileap.sine.dev" "hello" "pathfinder"
```
