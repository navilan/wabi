{
    config,
    pkgs,
    ...
}: let
    active = true;
in
    (with pkgs.vscode-extensions; [
        # Editor
        bodil.file-browser
        editorconfig.editorconfig
        kamikillerto.vscode-colorize
        mikestead.dotenv
        oderwat.indent-rainbow
        pkief.material-icon-theme
        streetsidesoftware.code-spell-checker
        vscodevim.vim
        vspacecode.vspacecode
        vspacecode.whichkey
        xyz.local-history

        # Git / Github
        eamodio.gitlens
        kahole.magit

        # Languages

        ## Graphql
        graphql.vscode-graphql

        ## Haskell
        haskell.haskell
        justusadam.language-haskell


        ## Nix
        bbenoist.nix
        b4dm4n.vscode-nixpkgs-fmt
        brettm12345.nixfmt-vscode
        jnoortheen.nix-ide

        ## Flix


        ## Markup & Data
        davidanson.vscode-markdownlint
        redhat.vscode-yaml
        tamasfe.even-better-toml
        yzhang.markdown-all-in-one


        ## Shell
        foxundermoon.shell-format
        timonwong.shellcheck

        ## Apps
        humao.rest-client

        ## Web (JS / TS / HTML / CSS)
        bradlc.vscode-tailwindcss
        dbaeumer.vscode-eslint


        ## Python
        # ms-python.python
        ms-python.vscode-pylance
        ms-toolsai.jupyter
        ms-toolsai.jupyter-renderers
    ]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [

        {
            name = "direnv";
            publisher = "mkhl";
            version = "0.6.1";
            sha256 = "5/Tqpn/7byl+z2ATflgKV1+rhdqj+XMEZNbGwDmGwLQ=";
        }
        {
            name = "jupyter-keymap";
            publisher = "ms-toolsai";
            version = "1.0.0";
            sha256 = "aP9mRvNfJ/fXSZk286FPo9gH80qwqm8mTDQ2BR+lfHI=";
        }
        {
            name = "vscode-python-typehint";
            publisher = "njqdev";
            version = "1.4.1";
            sha256 = "Iwp/1Lze7g0atBQfH/pSxdKyHvpYaJhR2ahhXopUKxM=";
        }
        {
            name = "webvalidator";
            publisher = "celianriboulet";
            version = "1.2.2";
            sha256 = "bFuW2CZtPdHNfomjB0vHR6g8w2fqNXJYY1CyaoEDZGQ=";
        }
        {
            name = "vscode-ts-auto-return-type";
            publisher = "ebrithil30";
            version = "1.1.0";
            sha256 = "8ydpxZtKnWdfBaS9Ln10pPB0eoic+JQ5HA+rKw+BAI8=";
        }
        {
            name = "vscode-typescript-exportallmodules";
            publisher = "eliostruyf";
            version = "2.3.1";
            sha256 = "vwXC9iVpqCoc5DMWPK3MXoJNSZZQYfZVdqDa73XX7qM=";
        }
        {
            name = "ts-debug";
            publisher = "kakumei";
            version = "0.0.6";
            sha256 = "MgsUthDbrJp6yIj9MMNDWBar0Q5b+8GQTPDuthVaQxI=";
        }
        {
            name = "jstl";
            publisher = "jsxtools";
            version = "1.0.4";
            sha256 = "56C6/L59P+NHrgH5Z4FzQn9smPmE2L2pQ+BhpJcI+Ys=";
        }
        {
            name = "HTMLHint";
            publisher = "mkaufman";
            version = "0.10.0";
            sha256 = "QisQwlCfDPg/SJCIuE3AHfyK7DscMxzmFuBroFLaZO4=";
        }
        {
            publisher = "leodevbro";
            name = "blockman";
            version="1.5.8";
            sha256 = "cc5GUq7h8MJBRoVnGmMJot1qyTWjNfeJHphdqYZx/zg=";
        }
        {
            publisher = "equinusocio";
            name = "vsc-community-material-theme";
            version="1.4.4";
            sha256 = "Pn1IcgpwknVyKSnqs9/ZF2w6D2zASlAI6maPnvIltAA=";
        }
        {
            publisher = "equinusocio";
            name = "vsc-material-theme";
            version="33.4.0";
            sha256 = "BthKoGzj0XeZINAmgkHPArvm2gIzDaOaAnkoWVqOkoY=";
        }
        {
            publisher = "equinusocio";
            name = "vsc-material-theme-icons";
            version="2.3.1";
            sha256 = "YKwMwcpL1Vsi789ggTIOvWDniBW6V9KGwYpYBsckVbY=";
        }
        {
            publisher = "ghmcadams";
            name = "lintlens";
            version="3.0.3";
            sha256 = "SipOJNR4+sMgzUX2nRnqGaErDs2qlNEhNRxDS0DsNPs=";
        }
        {
            publisher = "jacobdufault";
            name = "fuzzy-search";
            version="0.0.3";
            sha256 = "oN1SzXypjpKOTUzPbLCTC+H3I/40LMVdjbW3T5gib0M=";
        }
        {
            publisher = "ms-vscode";
            name = "atom-keybindings";
            version="3.0.9";
            sha256 = "Qey75Irpb3Y+Unbf+ppTTVoU3XGAVJD8oXN5XKJhWBI=";
        }
        {
            publisher = "ms-vsliveshare";
            name = "vsliveshare";
            version="1.0.5597";
            sha256 = "Wy1gfRNI6OdXWf70g+qCKKOq1SFX0PQTI6ig0YFIUCA=";
        }
        {
            publisher = "flix";
            name = "flix";
            version = "0.76.0";
            sha256 = "yMp9gfmWg+eYH2JRmukGhSHq7qCMgeeDkp28hcV0G9s=";

        }
        {
            publisher = "rrudi";
            name = "vscode-dired";
            version="0.0.6";
            sha256 = "BFoWY6acV4Njs+a3KhkgzOPVNuyoO+EWxYwHOzTgNCQ=";
        }
        {
            publisher = "techer";
            name = "open-in-browser";
            version="2.0.0";
            sha256 = "3XYRMuWEJfhureHmx1KfT+N9aBuqDagj0FErJQF/teg=";
        }
        {
            publisher = "fabiospampinato";
            name = "vscode-open-in-github";
            version="1.3.0";
            sha256 = "dBb7RmmW9KB0MbMkHZD9KQnZXvrk0OR3pVrSsyvdtJI=";
        }
        {
            publisher = "arthurwang";
            name = "vsc-prolog";
            version="0.8.23";
            sha256 = "Da2dCpruVqzP3g1hH0+TyvvEa1wEwGXgvcmIq9B/2cQ=";
        }
        {
            publisher = "shd101wyy";
            name = "markdown-preview-enhanced";
            version="0.6.3";
            sha256 = "dCWERQ5rHnmYLtYl12gJ+dXLnpMu55WnmF1VfdP0x34=";
        }
        {
            publisher = "hilleer";
            name = "yaml-plus-json";
            version="1.10.0";
            sha256 = "2xXP9HsuXOlQ6kYcRln7PDh1WFNJw8SIQIo7U94yBuA=";
        }
        {
            publisher = "James-Yu";
            name = "latex-workshop";
            version="8.26.0";
            sha256 = "ZCEbNGMEjGI1PqHTIvqTwt1T8rSzjhEe/Jj6cHLPT8c=";
        }
        {
            publisher = "ronnidc";
            name = "nunjucks";
            version="0.3.1";
            sha256 = "7YfmRMhC+HFmYgYtyHWrzSi7PZS3tdDHly9S1kDMmjY=";
        }
        {
            publisher = "okitavera";
            name = "vscode-nunjucks-formatter";
            version="0.1.3";
            sha256 = "9OSE+rKIH5uWkEx1egq1f502s5CeH3TJppK4oCwZ1p4=";
        }
        {
            publisher = "shadowtime2000";
            name = "eta-vscode";
            version="1.0.0";
            sha256 = "y/duRcO4BvTBn4u5DHy3YEgl4pyEhj3GV2dYNL9NGWQ=";
        }
        {
            publisher = "davidnussio";
            name = "vscode-jq-playground";
            version="4.3.2";
            sha256 = "be9evXth7VYtT3Txcu5EXOQMNZG2nzGhOWS9G2ITYSY=";
        }
        {
            publisher = "jq-syntax-highlighting";
            name = "jq-syntax-highlighting";
            version="0.0.2";
            sha256 = "Bwq+aZuDmzjHw+ZnIWlL4aGz6UnqxaKm5WUko0yuIWE=";
        }
    ]
