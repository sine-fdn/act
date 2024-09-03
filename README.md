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


# Usage

You can use ACT in the CLI or in a GitHub workflow.

All you need to do is to adapt below commands to your environment and run them in your terminal or in your GitHub workflow:

```sh
curl -sSf https://raw.githubusercontent.com/sine-fdn/act/main/act.sh |\
  bash -s -- test -e "<url>" -u "<user>" -p "<password>"
```

(i.e. `<user>`, `<password>` etc. are placeholders for your actual client credentials)


Example usage with SINE's iLEAP demo API
```sh
curl -sSf https://raw.githubusercontent.com/sine-fdn/act/main/act.sh |\
  bash -s -- test -e "https://api.ileap.sine.dev" -u "hello" -p "pathfinder" \
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
          -e `<url>` \
          -u `<user>` \
          -p `<password>` \
          --skip-http-check
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


# Contact

For any questions, feedback, or issues, please contact us at [act-feedback@sine.dev](act-feedback@sine.dev).
