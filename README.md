# Project Serum Rust Monorepo - Crank Program Fork

#### The forked repo is used to run dockerized crank program

### Clone the project

```
git clone https://github.com/martinkingtw/serum-dex.git && cd serum-dex
```

### Building docker images

Install docker

Then
```
DOCKER_BUILDKIT=1 docker build -t crank_program --secret id=solana_secret,src=<SOLANA_SECRET_KEY_FILE> .
```

Replace SOLANA_SECRET_KEY_FILE with the solana secret key file

### Starting and running the dockerized crank program

You can run the dockerized crank program
```
docker run -e NETWORK='devnet' -e MARKET='<MARKET_PROGRAM_ID>' --name <MARKET_PROGRAM_ID> -d crank_program
```

The network is either devnet or mainnet
The market is the program address of the market on solana blockchain
The name is the docker container name. I set the name as the market program id for ease of recognition.

You can check the status of the dockerized containers
```
docker ps
```

You can go into the docker container
```
docker exec -it <CONTAINER_ID> /bin/bash
or
docker exec -it <CONTAINER_NAME> /bin/bash
```

You can stop the docker container
```
docker stop <CONTAINER_ID>
or
docker stop <CONTAINER_NAME>
```

<div align="center">
  <img height="170" src="http://github.com/project-serum/awesome-serum/blob/master/logo-serum.png?raw=true" />

  <h1>serum-dex</h1>

  <p>
    <strong>Project Serum Rust Monorepo</strong>
  </p>

  <p>
    <a href="https://travis-ci.com/project-serum/serum-dex"><img alt="Build Status" src="https://travis-ci.com/project-serum/serum-dex.svg?branch=master" /></a>
    <a href="https://discord.com/channels/739225212658122886"><img alt="Discord Chat" src="https://img.shields.io/discord/739225212658122886?color=blueviolet" /></a>
    <a href="https://opensource.org/licenses/Apache-2.0"><img alt="License" src="https://img.shields.io/github/license/project-serum/serum-dex?color=blue" /></a>
  </p>

  <h4>
    <a href="https://projectserum.com/">Website</a>
    <span> | </span>
    <a href="https://discord.gg/HSeFXbqsUX">Discord</a>
    <span> | </span>
    <a href="https://github.com/project-serum/awesome-serum">Awesome</a>
    <span> | </span>
    <a href="https://dex.projectserum.com/#/">DEX</a>
    <span> | </span>
    <a href="https://github.com/project-serum/serum-ts">TypeScript</a>
  </h4>
</div>

## Program Deployments

| Program | Devnet | Mainnet Beta |
| --------|--------|------------- |
| [DEX](/dex)     | `DESVgJVGajEgKGXhb6XmqDHGz3VjdgP7rEVESBgxmroY` | `9xQeWvG816bUx9EPjHmaT23yvVM2ZWbrrpZb9PusVFin` |

## Note

* **Serum is in active development so all APIs and protocols are subject to change.**
* **The code is unaudited. Use at your own risk.**

## Contributing

### Install Rust

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustup component add rustfmt
```

On Linux systems you may need to install additional dependencies. On Ubuntu,

```bash
sudo apt-get install -y pkg-config build-essential python3-pip jq
```

### Install Solana

Directions can be found [here](https://docs.solana.com/cli/install-solana-cli-tools#use-solanas-install-tool).

### Download the source

```bash
git clone https://github.com/project-serum/serum-dex.git
```

### Build, deploy, and test programs

See individual crates for documentation. For example, to build the dex see its [README](https://github.com/project-serum/serum-dex/tree/master/dex).

## Running a local Solana cluster

The easiest way to run a local cluster is to use [solana-test-validator](https://docs.solana.com/developing/test-validator).

## Directories

* `assert-owner`: Solana utility program for checking account ownership.
* `common`: Common rust utilities.
* `dex`: Serum DEX program and client utility.
* `pool`: Serum pool protocol.
* `scripts`: Bash scripts for development.
