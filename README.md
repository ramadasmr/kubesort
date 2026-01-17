# kubesort
![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg) ![Shell](https://img.shields.io/badge/Made%20with-Bash-red.svg) ![Kubernetes](https://img.shields.io/badge/Made%20for-Kubernetes-blue.svg) ![CI](https://img.shields.io/badge/CI-GitHub%20Actions-blueviolet) ![Unit Tests](https://img.shields.io/badge/Unit%20Tests-shellcheck%20and%20BATS-blueviolet) ![CI Status](https://github.com/ramadasmr/kubesort/actions/workflows/ci.yaml/badge.svg?branch=main)

![GitHub Stars](https://img.shields.io/github/stars/ramadasmr/kubesort?style=social) ![GitHub Forks](https://img.shields.io/github/forks/ramadasmr/kubesort?style=social)


**kubesort** is a lightweight Bash utility that simplifies and extends `kubectl` commands by enabling flexible sorting of Kubernetes resources. It combines multiple common `kubectl` flags (like `--sort-by`) into a single intuitive cli command.

Whether you're a developer, SRE, or DevOps engineer, `kubesort` makes it easier to view, filter, and analyze Kubernetes objects from the command line.

---

#### ✨ Features

- 🔎 Sort Kubernetes objects (pods, nodes, pv, events, services)
- 📊 Sort by CPU, memory, disk size, restarts, status, age, or name
- 🧠 Smart context handling (e.g., skips namespace for cluster-level resources)
- ✅ Simple and readable CLI output
- 🧱 Built with native `kubectl` compatibility

---

#### 📋 Prerequisites

- `kubectl` must be installed and configured to access your Kubernetes cluster
- Bash shell (version 4.0 or higher)

---

#### 📥 Installation

##### Install via `curl`

```bash
curl -sSL https://raw.githubusercontent.com/ramadasmr/kubesort/main/install.sh | bash
```

This installs the kubesort command to /usr/local/bin. Make sure it’s in your $PATH.

##### Manual Steps

```bash
curl -L -o /usr/local/bin/kubesort https://raw.githubusercontent.com/ramadasmr/kubesort/refs/heads/main/kubesort
chmod a+x /usr/local/bin/kubesort

```

##### Verify installation

```bash
kubesort --help
```


#### 🚀 Usage

```bash
kubesort [object] <options>
```

##### Supported Objects
- `pods` – Kubernetes Pods
- `nodes` – Cluster Nodes
- `pv` – Persistent Volumes
- `events` – Cluster Events
- `services` – Kubernetes Services

##### Sort Options

Common Sort Options

| Option                | Description                               |
|------------------------|-------------------------------------------|
| `--byname`             | Sort by name                              |
| `--bytime`, `--byage`  | Sort by creation time / age               |
| `--bycpu`              | Sort by CPU usage (pods, nodes)       |
| `--bymemory`           | Sort by memory usage (pods, nodes)    |
| `--bysize`             | Sort by disk size (pv, nodes)         |
| `--byrestart`          | Sort by restart count (pods only)     |
| `--bystatus`           | Sort by status (pods, nodes, pv)    |

Additional Options

| Option                | Description                               |
|------------------------|-------------------------------------------|
| `--dry`                | Dry run mode - shows the kubectl command without executing it |
| `--debug`, `--verbose`, `-v` | Enable verbose/debug output |

Namespace Support
These are valid for pods, events, and services:

| Option                | Description                               |
|------------------------|-------------------------------------------|
| `--namespace`          | Specify the namespace to use  (pods, services, events)             |

#### ✅ Examples

```bash
# Sort pods by age
kubesort pods --byage

# Sort nodes by memory usage
kubesort nodes --bymemory

# Sort persistent volumes by disk size
kubesort pv --bysize

# Sort pods in a specific namespace by restart count
kubesort pods -n kube-system --byrestart

# Sort services in a namespace by name
kubesort services -n dev --byname

# Dry run to see the command that would be executed
kubesort pods --bycpu --dry
```

#### ℹ️ Notes
- Only one sort option is supported per command.
- Unsupported combinations (like --bycpu for services) will return a warning or error.
- Outputs the actual kubectl command being run for clarity.

#### 📄 License
MIT License – feel free to use, share, and contribute.

#### 🤝 Contributions
PRs and issues are welcome to enhance sorting support, resource types, or flags.

##### To Contribute

1. Fork the repository
2. Create a new branch: `git checkout -b feature/my-feature`
3. Commit your changes
4. Push to your fork: `git push origin feature/my-feature`
5. Open a pull request

##### How to run tests

This project uses [BATS](https://github.com/bats-core/bats-core) for testing.
To run the tests, use the `bats` binary included in the repository:

```bash
./tests/bats/bin/bats tests
```

##### Ideas to Improve
- Add support for additional resource types (deployments, statefulsets, etc.)
- Add support for multilevel sorting
- Add reverse/descending sort option
