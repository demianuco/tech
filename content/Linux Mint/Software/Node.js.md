
> [!NOTE]
> Full instructions [here](https://www.freecodecamp.org/news/node-version-manager-nvm-install-guide/).

Install NVM:

```Shell
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.bashrc
# Test
nvm --version
```

Install latest stable version of node:

```sh
nvm install --lts
nvm use --lts
# Test
node --version
```