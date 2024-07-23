# ACT (beta)

ACT (Automated Conformance Testing) tests your software solution against the [PACT Technical
Specifications](https://wbcsd.github.io/data-exchange-protocol/v2/) as part of your CI/CD pipeline.

ACT performs the tests included in [PACT's checklist](https://wbcsd.github.io/pact-conformance-testing/checklist.html), ensuring that your software is ready for bilateral conformance testing. Having ACT in your CI/CD pipeline saves you time and money, by preventing you from engaging in premature manual bilateral testing.

# Usage

```
- uses: actions/sine-fdn/act@v0
  with:
    # URL of the API to be tested
    url: ''
    # Basic auth username. For security purposes, we recommend having it set as a repository secret.
    # For a secret named `ACT_USER` the value of `user:` should be `${{ secrets.ACT_USER }}`
    user: ''
    # Basic auth password. For security purposes, we recommend having it set as a repository secret.
    # For a secret named `ACT_PASSWORD` the value of `password:` should be `${{ secrets.ACT_PASSWORD }}`
    password: ''
```
