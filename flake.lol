{
  "nodes": {
    "darwin": {
      "inputs": {
        "nixpkgs": [
          "nixpkgs"
        ]
      },
      "locked": {
        "lastModified": 1744224272,
        "narHash": "sha256-cqePj5nuC7flJWNncaVAFq1YZncU0PSyO0DEqGn+vYc=",
        "owner": "lnl7",
        "repo": "nix-darwin",
        "rev": "113883e37d985d26ecb65282766e5719f2539103",
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
        "lastModified": 1685494553,
        "narHash": "sha256-7kB1at//UUKIaedu8bbtfZS+F9LzgHVv9aXPppcBBGw=",
        "owner": "cmacrae",
        "repo": "emacs",
        "rev": "1c48a5984bab69a79cc6ebe20e28ee32138fc683",
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
        "lastModified": 1685464105,
        "narHash": "sha256-Y0uuemxviXxi4WQEn2fb3derGaDLJxDH10qGXkpmKDQ=",
        "owner": "emacs-mirror",
        "repo": "emacs",
        "rev": "ecc1d990d9e9d006838ca514213ea5e46a459363",
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
        "lastModified": 1681705456,
        "narHash": "sha256-1+AbPtyl1dS73WTMrIUduyWeM4cOiD3CI7d0Ic3jpVw=",
        "owner": "akermu",
        "repo": "emacs-libvterm",
        "rev": "94e2b0b2b4a750e7907dacd5b4c0584900846dd1",
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
        "lastModified": 1744231114,
        "narHash": "sha256-60gLl2rJFt6SRwqWimsTAeHgfsIE1iV0zChdJFOvx8w=",
        "owner": "nix-community",
        "repo": "fenix",
        "rev": "0ccfe532b1433da8e5a23cd513ff6847e0f6a8c2",
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
    "flake-parts": {
      "inputs": {
        "nixpkgs-lib": [
          "nur",
          "nixpkgs"
        ]
      },
      "locked": {
        "lastModified": 1733312601,
        "narHash": "sha256-4pDvzqnegAfRkPwO3wmwBhVi/Sye1mzps0zHWYnP88c=",
        "owner": "hercules-ci",
        "repo": "flake-parts",
        "rev": "205b12d8b7cd4802fbcb8e8ef6a0f1408781a4f9",
        "type": "github"
      },
      "original": {
        "owner": "hercules-ci",
        "repo": "flake-parts",
        "type": "github"
      }
    },
    "flake-utils": {
      "inputs": {
        "systems": "systems"
      },
      "locked": {
        "lastModified": 1731533236,
        "narHash": "sha256-l0KFg5HjrsfsO/JpG+r7fRrqm12kzFHyUHqHCVpMMbI=",
        "owner": "numtide",
        "repo": "flake-utils",
        "rev": "11707dc2f618dd54ca8739b309ec4fc024de578b",
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
        "lastModified": 1744400600,
        "narHash": "sha256-qYhUgA98mhq1QK13r9qVY+sG1ri6FBgyp+GApX6wS20=",
        "owner": "nix-community",
        "repo": "home-manager",
        "rev": "b74b22bb6167e8dff083ec6988c98798bf8954d3",
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
        "lastModified": 1744316434,
        "narHash": "sha256-lzFCg/1C39pyY2hMB2gcuHV79ozpOz/Vu15hdjiFOfI=",
        "owner": "NixOS",
        "repo": "nixpkgs",
        "rev": "d19cf9dfc633816a437204555afeb9e722386b76",
        "type": "github"
      },
      "original": {
        "id": "nixpkgs",
        "type": "indirect"
      }
    },
    "nixpkgs_2": {
      "locked": {
        "lastModified": 1744232761,
        "narHash": "sha256-gbl9hE39nQRpZaLjhWKmEu5ejtQsgI5TWYrIVVJn30U=",
        "owner": "nixos",
        "repo": "nixpkgs",
        "rev": "f675531bc7e6657c10a18b565cfebd8aa9e24c14",
        "type": "github"
      },
      "original": {
        "owner": "nixos",
        "ref": "nixos-unstable",
        "repo": "nixpkgs",
        "type": "github"
      }
    },
    "nur": {
      "inputs": {
        "flake-parts": "flake-parts",
        "nixpkgs": "nixpkgs_2",
        "treefmt-nix": "treefmt-nix"
      },
      "locked": {
        "lastModified": 1744430618,
        "narHash": "sha256-UznZ7mH3+wcLmt99csY64x9JvjPFIUAd4Xb9DO8dbLA=",
        "owner": "nix-community",
        "repo": "NUR",
        "rev": "35cfbb58130a81ac726bfacdd10a14b03aac42e0",
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
        "lastModified": 1742296961,
        "narHash": "sha256-gCpvEQOrugHWLimD1wTFOJHagnSEP6VYBDspq96Idu0=",
        "owner": "rust-lang",
        "repo": "rust-analyzer",
        "rev": "15d87419f1a123d8f888d608129c3ce3ff8f13d4",
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
        ]
      },
      "locked": {
        "lastModified": 1744103455,
        "narHash": "sha256-SR6+qjkPjGQG+8eM4dCcVtss8r9bre/LAxFMPJpaZeU=",
        "owner": "Mic92",
        "repo": "sops-nix",
        "rev": "69d5a5a4635c27dae5a742f36108beccc506c1ba",
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
    "treefmt-nix": {
      "inputs": {
        "nixpkgs": [
          "nur",
          "nixpkgs"
        ]
      },
      "locked": {
        "lastModified": 1733222881,
        "narHash": "sha256-JIPcz1PrpXUCbaccEnrcUS8jjEb/1vJbZz5KkobyFdM=",
        "owner": "numtide",
        "repo": "treefmt-nix",
        "rev": "49717b5af6f80172275d47a418c9719a31a78b53",
        "type": "github"
      },
      "original": {
        "owner": "numtide",
        "repo": "treefmt-nix",
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
        "lastModified": 1724212840,
        "narHash": "sha256-Rpo1OwvFAVuUEAHW1bkFQx7B4Nptc1C5f87HreQzYEc=",
        "owner": "zsa",
        "repo": "wally-cli",
        "rev": "2d0da1ee4c4e7fa5407c5b6653b0d908cbfe9044",
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
