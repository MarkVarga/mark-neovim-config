Makse sure install these:
- Cargo:
  `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
- Yazi:
  `cargo install --locked yazi-fm yazi-cli`
- LazyGit:
  `sudo apt install lazygit`
- Language servers:
  - Typescript:
    `npm i -g typescript`
    `npm i -g typescript-language-server`
  - Vscode langauge servers extracted (html, css, json, eslint:
    `npm i -g vscode-langservers-extracted`
  - Prettier:
    `npm i -g prettier`
  - Lua:
    - First install Lua language:
      `sudo apt-get install lua5.x (replace x with the desired version)`
      - Check for latest release here `https://github.com/LuaLS/lua-language-server/releases` and replace the link after `wget` with the latest version link of `tar.gz`
        `wget https://github.com/LuaLS/lua-language-server/releases/download/3.15.0/lua-language-server-3.15.0-linux-x64.tar.gz`
      - Create the folder where you want to extract the language server to
        `mkdir [where you want to create its directory]`
      - Extract the file:
        `tar -xzf [the name of the lua language server file].gz -C [your destionation directory]`
      - Create a symlink to it:
        `ln -s [path-of-your-lua-language-server-directory/bin/lua-language-server] ~/.local/bin/lua-language-server`

Optional:

 - Install nerd font:
   - Check for new font releases here: `https://github.com/ryanoasis/nerd-fonts/releases`
     `curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/IBMPlexMono.tar.xz`

Install:
- `git clone git@github.com:MarkVarga/mark-neovim-config.git ~/.config/nvim`
    
