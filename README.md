# ACT (beta)

ACT (Automated Conformance Testing) tests your software solution against the [PACT Technical
Specifications](https://wbcsd.github.io/data-exchange-protocol/v2/).

For this, ACT performs the tests included in [PACT's checklist](https://wbcsd.github.io/pact-conformance-testing/checklist.html), ensuring that your software is ready for bilateral conformance testing.

By integrating ACT into your CI/CD pipeline and development processes, you can streamline the PACT Tech Specs implementation and conformance process in general.


> [!NOTE]
> ACT is still under development. This means that the tool is not yet fully stable and may not cover all
> the requirements of the PACT Technical Specifications or that its tests may differ from the Tech Specs.
>
> If you encounter any issues or difficulties, give us [feedback](#contact), open an issue on the [ACT GitHub repository](https://github.com/sine-fdn/act/issues).


## Usage

You can use ACT in the CLI or in a GitHub workflow.

All you need to do is to adapt below commands to your environment and run them in your terminal or in your GitHub workflow:

```sh
curl -sSf https://raw.githubusercontent.com/sine-fdn/act/main/act.sh |\
  bash -s -- test -b "<url>" -u "<user>" -p "<password>"
```

(i.e. `<user>`, `<password>` etc. are placeholders for your actual client credentials)

Example usage with SINE's iLEAP demo API
```sh
curl -sSf https://raw.githubusercontent.com/sine-fdn/act/main/act.sh |\
  bash -s -- test -b "https://api.ileap.sine.dev" -u "hello" -p "pathfinder" \
```

### Options

```sh
Options:
  -b, --basepath <BASEPATH>            URL of the API
      --auth-basepath <AUTH_BASEPATH>  Auth Base URL (if different from the API endpoint)
  -u, --user <USER>                    Basic auth username
  -p, --password <PASSWORD>            Basic auth password
      --enable-http-check              Check if http (instead of https) requests are properly rejected
      --check-filter                   Checks conformance of the optional $filter query parameter
      --check-ileap-tad                Checks 2/ileap/tad endpoint
      --val-ship-foot                  Validates ShipmentFootprint extension
      --val-toc                        Validates TOC extension
      --val-hoc                        Validates HOC extension
  -h, --help                           Print help
  -V, --version                        Print version

```

## GitHub Workflow

Adding ACT to your CI/CD pipeline with GitHub is as simple as including the following job in your GitHub workflow, replacing `<url>`, `<user>`, and `<password>` with the URL of your API and the Basic Auth credentials (user and password).

```TOML
  act_test:
    name: ACT Test
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Run ACT (test)
        run: |
          set -o pipefail
          curl -sSf https://raw.githubusercontent.com/sine-fdn/act/main/act.sh | \
          bash -s -- test \
          -b `<url>` \
          -u `<user>` \
          -p `<password>` \
```


### Security Considerations

If you intend to use this action to test live or otherwise production-like systems, you should

1. make sure that credentials are passed in as secrets
     (e.g., `${{secrets.ACT_USER}}` and `${{secrets.ACT_PASSWORD}}`)
2. add the `--enable-http-check` flag


## Limitations

> [!IMPORTANT]
>
> There are builds ready for ARM64 and x86_64 architectures and the `ubuntu-latest` runner only.
> If you need support for a different architecture or runner, please let us know.

We are working to enlarge the coverage of ACT. Most test cases are already covered, but these do not yet include the tests concerning expired tokens, nor some of the asynchronous tests. Below is a detailed list of the test cases that are currently covered by ACT.

### Coverage

PACT Test Cases

- [x] Test Case 001: Authentication against default endpoint
- [x] Test Case 002: Authentication with invalid credentials against default endpoint
- [x] Test Case 003: Get All Footprints
- [x] Test case 004: Get Limited List of Footprints
- [x] Test case 005: Pagination link implementation of Action ListFootprints
- [ ] Test Case 006: Attempt ListFootprints with Expired Token
- [x] Test Case 007: Attempt ListFootprints with Invalid Token
- [x] Test Case 008: Get Footprint
- [ ] Test Case 009: Attempt GetFootprint with Expired Token
- [x] Test Case 010: Attempt GetFootprint with Invalid Token
- [ ] Test Case 011: Attempt GetFootprint with Non-Existent PfId
- [ ] Test Case 012: Asynchronous PCF Request
- [ ] Test Case 013: Respond to Asynchronous PCF Request
- [x] Test Case 014: Receive Notification of PCF Update
- [ ] Test Case 015: Notify of PCF Update
- [x] Test Case 016: OpenId Connect-based Authentication Flow
- [x] Test Case 017: OpenId connect-based authentication flow with incorrect credentials
- [x] Test Case 018: Attempt Authentication through HTTP (non-HTTPS)
- [x] Test Case 019: Attempt ListFootprints through HTTP (non-HTTPS)
- [x] Test Case 020: Get Filtered List of Footprints
- [x] Test Case 021: Attempt GetFootprint through HTTP (non-HTTPS)
- [ ] Test Case 022: Attempt Action Events with Expired Token
- [x] Test Case 023: Attempt Action Events with Invalid Token
- [x] Test Case 024: Attempt Action Events through HTTP (non-HTTPS)

iLEAP Test Cases

- [x] iLEAP Test Case 001: Get ProductFootprint with ShipmentFootprint
- [x] iLEAP Test Case 002: Get ProductFootprint with TOC
- [x] iLEAP Test Case 003: Get ProductFootprint with HOCs
- [x] iLEAP Test Case 004: Get All TransportActivityData
- [x] iLEAP Test Case 005: Get Filtered List of TransportActivityData
- [x] iLEAP Test Case 006: Get Limited List of TransportActivityData
- [x] iLEAP Test Case 007: Attempt TransportActivityData with Invalid Token
- [ ] iLEAP Test Case 008: Attempt TransportActivityData with Expired Token


# Contact

For any questions, feedback, or issues, please contact us at [act-feedback@sine.dev](act-feedback@sine.dev).
