# Dotfiles

## Run

1. 權限設定

    ```bash
    chmod +x brew_setup.sh
    ```

2. 執行

    ```bash
    ./brew_setup.sh
    ```

## Homebrew Bundle

- [Homebrew/homebrew-bundle: 📦 Bundler for Homebrew](https://github.com/Homebrew/homebrew-bundle)

- 常用指令

    | 指令 | 說明 |
    | --- | --- |
    | `brew bundle dump --describe` | 生成 Brewfile |
    | `brew bundle install --file=<PATH>` | 安裝 Brewfile 中的套件 |
    | `brew bundle cleanup --force` | 清理未列在 Brewfile 中的套件 |
    | `brew bundle check` | 檢查 Brewfile 中的套件是否已安裝 |
    | `brew bundle list` | 列出 Brewfile 中的套件 |


## 環境變數

- nvm

    ```bash
    brew install nvm
    source $(brew --prefix nvm)/nvm.sh
    ```

    > Reference: https://collabnix.com/how-to-install-and-configure-nvm-on-mac-os/