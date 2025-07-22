# GitHub Super-Linter for CircleCI (Orb)

[![CircleCI Build Status](https://circleci.com/gh/CircleCI-Public/GitHub-Super-Linter-Orb.svg?style=shield "CircleCI Build Status")](https://circleci.com/gh/CircleCI-Public/GitHub-Super-Linter-Orb) [![CircleCI Orb Version](https://badges.circleci.com/orbs/circleci/github-super-linter.svg)](https://circleci.com/orbs/registry/orb/circleci/github-super-linter) [![GitHub License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/CircleCI-Public/GitHub-Super-Linter-Orb/master/LICENSE) [![CircleCI Community](https://img.shields.io/badge/community-CircleCI%20Discuss-343434.svg)](https://discuss.circleci.com/c/ecosystem/orbs)

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

[CircleCI Orb Registry Page](https://circleci.com/developer/orbs/orb/circleci/github-super-linter) - The official registry page of this orb for all versions, executors, commands, and jobs described.
[CircleCI Orb Docs](https://circleci.com/docs/2.0/orb-intro/#section=configuration) - Docs for using and creating CircleCI Orbs.

### How to Contribute

We welcome [issues](https://github.com/CircleCI-Public/GitHub-Super-Linter-Orb/issues) to and [pull requests](https://github.com/CircleCI-Public/GitHub-Super-Linter-Orb/pulls) against this repository!


For further questions/comments about this or other orbs, visit the Orb Category of [CircleCI Discuss](https://discuss.circleci.com/c/orbs).

## Deprecation Notice

**This application will be archived and discontinued on Wednesday, `August 20th, 2025` - 30 days from today.**

We want to give an advance notice that this orb is scheduled to be deprecated and archived. CircleCI will no longer support this orb because of limited or no use. After `August 20th, 2025`:

* The Orb will no longer receive updates, bug fixes, or security patches
* The repository will be archived and made read-only
* No new issues or pull requests will be accepted
* Existing functionality may continue to work but without any support guarantees

### What You Should Do

If you would like to use this orb or create your own version, feel free to fork the repository and use the following [Build Private CircleCI Orbs](https://circleci.com/blog/building-private-orbs/) documentation as a guide to making this orb into a private orb for your own use.
