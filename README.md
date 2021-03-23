# GitHub Super-Linter for CircleCI (Orb)

[![CircleCI Build Status](https://circleci.com/gh/CircleCI-Public/GitHub-Super-Linter-Orb.svg?style=shield "CircleCI Build Status")](https://circleci.com/gh/CircleCI-Public/GitHub-Super-Linter-Orb) [![CircleCI Orb Version](https://img.shields.io/badge/endpoint.svg?url=https://badges.circleci.io/orb/circleci/github-super-linter)](https://circleci.com/orbs/registry/orb/circleci/github-super-linter) [![GitHub License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/CircleCI-Public/GitHub-Super-Linter-Orb/master/LICENSE) [![CircleCI Community](https://img.shields.io/badge/community-CircleCI%20Discuss-343434.svg)](https://discuss.circleci.com/c/ecosystem/orbs)

CircleCI Orbs allow users to package CI config into re-sharable components. This CircleCI Orb provides a `lint` job, powered by the GitHub Super-Linter Docker image.

## Usage:
Simply add the `github-super-linter/lint` job to your new or existing config.

```yaml
version: 2.1
orbs:
    github-super-linter: circleci/github-super-linter@1.0
workflows:
    lint-code:
        jobs:
        - github-super-linter/lint
```

## Resources

[CircleCI Orb Registry Page](https://circleci.com/orbs/registry/orb/circleci/GitHub-Super-Linter-Orb) - The official registry page of this orb for all versions, executors, commands, and jobs described.
[CircleCI Orb Docs](https://circleci.com/docs/2.0/orb-intro/#section=configuration) - Docs for using and creating CircleCI Orbs.

### How to Contribute

We welcome [issues](https://github.com/CircleCI-Public/GitHub-Super-Linter-Orb/issues) to and [pull requests](https://github.com/CircleCI-Public/GitHub-Super-Linter-Orb/pulls) against this repository!


For further questions/comments about this or other orbs, visit the Orb Category of [CircleCI Discuss](https://discuss.circleci.com/c/orbs).

