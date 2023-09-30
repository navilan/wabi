{
  "nodes": {
    "darwin": {
      "inputs": {
        "nixpkgs": [
          "nixpkgs"
        ]
      },
      "locked": {
        "lastModified": 1681154394,
        "narHash": "sha256-avnu1K9AuouygBiwVKuDp6emiTET43az3rcpv0ctLjc=",
        "owner": "lnl7",
        "repo": "nix-darwin",
        "rev": "025912529dd0b31dead95519e944ea05f1ad56f2",
        "type": "github"
      },
      "original": {
        "owner": "lnl7",
        "ref": "master",
        "repo": "nix-darwin",
        "type": "github"
      }
    },
    "deploy": {
      "inputs": {
        "fenix": [
          "fenix"
        ],
        "flake-compat": "flake-compat",
        "nixpkgs": [
          "fenix",
          "nixpkgs"
        ],
        "utils": "utils"
      },
      "locked": {
        "lastModified": 1661212356,
        "narHash": "sha256-+9P849WIb/zhAMWXrW9g0IRd7vFRj5a5acLTtOFyY48=",
        "owner": "input-output-hk",
        "repo": "deploy-rs",
        "rev": "4da8eb9fc3e611adf4bbe8c8df5b1fc604c4f906",
        "type": "github"
      },
      "original": {
        "owner": "input-output-hk",
        "repo": "deploy-rs",
        "type": "github"
      }
    },
    "emacs": {
      "inputs": {
        "emacs-src": "emacs-src",
        "emacs-vterm-src": "emacs-vterm-src",
        "nixpkgs": [
          "nixpkgs"
        ]
      },
      "locked": {
        "lastModified": 1681174290,
        "narHash": "sha256-5KzYWuMRC4JfWsCGOjUVyW3LxPAiyLjzaDdxf5h7IyQ=",
        "owner": "cmacrae",
        "repo": "emacs",
        "rev": "bd5ce72dbfa3d39c60ca05c37fc1e475a18329e8",
        "type": "github"
      },
      "original": {
        "owner": "cmacrae",
        "repo": "emacs",
        "type": "github"
      }
    },
    "emacs-src": {
      "flake": false,
      "locked": {
        "lastModified": 1681168497,
        "narHash": "sha256-LbEvlkH/NCoMfgBbnypPJKzylDoiYDts+iqPynHjzRU=",
        "owner": "emacs-mirror",
        "repo": "emacs",
        "rev": "9efa6d2cf28f4e21f23bb0dbfedc59a4286dab12",
        "type": "github"
      },
      "original": {
        "owner": "emacs-mirror",
        "repo": "emacs",
        "type": "github"
      }
    },
    "emacs-vterm-src": {
      "flake": false,
      "locked": {
        "lastModified": 1676600925,
        "narHash": "sha256-c3puNJ0YATQkT3tjQ22PPmMonNzTp6SPzzheS7m1pd8=",
        "owner": "akermu",
        "repo": "emacs-libvterm",
        "rev": "3e5a9b754b8e61850bb7d1b63b090b9fbf6687f3",
        "type": "github"
      },
      "original": {
        "owner": "akermu",
        "repo": "emacs-libvterm",
        "type": "github"
      }
    },
    "fenix": {
      "inputs": {
        "nixpkgs": [
          "nixpkgs"
        ],
        "rust-analyzer-src": "rust-analyzer-src"
      },
      "locked": {
        "lastModified": 1681798941,
        "narHash": "sha256-mulagyF3gLDcGNhZXGigSJ55JJXa68XHjqUCMlk9UJU=",
        "owner": "nix-community",
        "repo": "fenix",
        "rev": "b8ecf873298667ef981781d762608e11390725a9",
        "type": "github"
      },
      "original": {
        "owner": "nix-community",
        "repo": "fenix",
        "type": "github"
      }
    },
    "flake-compat": {
      "flake": false,
      "locked": {
        "lastModified": 1627913399,
        "narHash": "sha256-hY8g6H2KFL8ownSiFeMOjwPC8P0ueXpCVEbxgda3pko=",
        "owner": "edolstra",
        "repo": "flake-compat",
        "rev": "12c64ca55c1014cdc1b16ed5a804aa8576601ff2",
        "type": "github"
      },
      "original": {
        "owner": "edolstra",
        "repo": "flake-compat",
        "type": "github"
      }
    },
    "flake-utils": {
      "inputs": {
        "systems": "systems"
      },
      "locked": {
        "lastModified": 1681202837,
        "narHash": "sha256-H+Rh19JDwRtpVPAWp64F+rlEtxUWBAQW28eAi3SRSzg=",
        "owner": "numtide",
        "repo": "flake-utils",
        "rev": "cfacdce06f30d2b68473a46042957675eebb3401",
        "type": "github"
      },
      "original": {
        "owner": "numtide",
        "repo": "flake-utils",
        "type": "github"
      }
    },
    "home": {
      "inputs": {
        "nixpkgs": [
          "nixpkgs"
        ]
      },
      "locked": {
        "lastModified": 1681814024,
        "narHash": "sha256-DPxY/dIxegJ443OJ8jJDusZxX1cbhNe/r3XjG/KifCk=",
        "owner": "nix-community",
        "repo": "home-manager",
        "rev": "cd5723734acbffa63e11a69cf6767f8ef69f6517",
        "type": "github"
      },
      "original": {
        "owner": "nix-community",
        "repo": "home-manager",
        "type": "github"
      }
    },
    "nixpkgs": {
      "locked": {
        "lastModified": 1681753173,
        "narHash": "sha256-MrGmzZWLUqh2VstoikKLFFIELXm/lsf/G9U9zR96VD4=",
        "owner": "nixos",
        "repo": "nixpkgs",
        "rev": "0a4206a51b386e5cda731e8ac78d76ad924c7125",
        "type": "github"
      },
      "original": {
        "owner": "nixos",
        "ref": "nixpkgs-unstable",
        "repo": "nixpkgs",
        "type": "github"
      }
    },
    "nixpkgs-stable": {
      "locked": {
        "lastModified": 1681613598,
        "narHash": "sha256-Ogkoma0ytYcDoMR2N7CZFABPo+i0NNo26dPngru9tPc=",
        "owner": "NixOS",
        "repo": "nixpkgs",
        "rev": "1040ce5f652b586da95dfd80d48a745e107b9eac",
        "type": "github"
      },
      "original": {
        "owner": "NixOS",
        "ref": "release-22.11",
        "repo": "nixpkgs",
        "type": "github"
      }
    },
    "nur": {
      "locked": {
        "lastModified": 1681818355,
        "narHash": "sha256-A29uoPDtF3Jw5u9BDWhXyZxzhLrUURHJmR47cbO1zEo=",
        "owner": "nix-community",
        "repo": "NUR",
        "rev": "25eeb98c8378d0d716816b05c8441953b84aec2f",
        "type": "github"
      },
      "original": {
        "owner": "nix-community",
        "repo": "NUR",
        "type": "github"
      }
    },
    "root": {
      "inputs": {
        "darwin": "darwin",
        "deploy": "deploy",
        "emacs": "emacs",
        "fenix": "fenix",
        "flake-utils": "flake-utils",
        "home": "home",
        "nixpkgs": "nixpkgs",
        "nur": "nur",
        "sops-nix": "sops-nix",
        "wally-cli": "wally-cli"
      }
    },
    "rust-analyzer-src": {
      "flake": false,
      "locked": {
        "lastModified": 1681758042,
        "narHash": "sha256-2ljT/3NR4aECG3Uj5T0Tr+RqRUQe00G8CocbpTLZnhM=",
        "owner": "rust-lang",
        "repo": "rust-analyzer",
        "rev": "9b835f334f2c61d66c8c6554ec90325992752ce3",
        "type": "github"
      },
      "original": {
        "owner": "rust-lang",
        "ref": "nightly",
        "repo": "rust-analyzer",
        "type": "github"
      }
    },
    "sops-nix": {
      "inputs": {
        "nixpkgs": [
          "nixpkgs"
        ],
        "nixpkgs-stable": "nixpkgs-stable"
      },
      "locked": {
        "lastModified": 1681821695,
        "narHash": "sha256-uwyBGo/9IALi97AfMuzkJroQQhV6hkybaZVdw6pRNG4=",
        "owner": "Mic92",
        "repo": "sops-nix",
        "rev": "5698b06b0731a2c15ff8c2351644427f8ad33993",
        "type": "github"
      },
      "original": {
        "owner": "Mic92",
        "repo": "sops-nix",
        "type": "github"
      }
    },
    "systems": {
      "locked": {
        "lastModified": 1681028828,
        "narHash": "sha256-Vy1rq5AaRuLzOxct8nz4T6wlgyUR7zLU309k9mBC768=",
        "owner": "nix-systems",
        "repo": "default",
        "rev": "da67096a3b9bf56a91d16901293e51ba5b49a27e",
        "type": "github"
      },
      "original": {
        "owner": "nix-systems",
        "repo": "default",
        "type": "github"
      }
    },
    "utils": {
      "locked": {
        "lastModified": 1637014545,
        "narHash": "sha256-26IZAc5yzlD9FlDT54io1oqG/bBoyka+FJk5guaX4x4=",
        "owner": "numtide",
        "repo": "flake-utils",
        "rev": "bba5dcc8e0b20ab664967ad83d24d64cb64ec4f4",
        "type": "github"
      },
      "original": {
        "owner": "numtide",
        "repo": "flake-utils",
        "type": "github"
      }
    },
    "wally-cli": {
      "flake": false,
      "locked": {
        "lastModified": 1666352256,
        "narHash": "sha256-CnoRYQEoUURc28U1WfTRRI6LiMPqoPWpovn0UJ7A8CY=",
        "owner": "zsa",
        "repo": "wally-cli",
        "rev": "b0fafe52cc7fb9d55f2b968d4548c99917c7325c",
        "type": "github"
      },
      "original": {
        "owner": "zsa",
        "repo": "wally-cli",
        "type": "github"
      }
    }
  },
  "root": "root",
  "version": 7
}
