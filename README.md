# `fzf_complete.bash`

Fuzzy filter `bash` completions with [`fzf`](https://github.com/junegunn/fzf).


## Installation

*Note*: instead of `~/.fzf_complete.bash/` you can use the path you prefer.

### Using `curl`

```bash
mkdir -p ~/.fzf_complete.bash && tar -xzf <(curl -L http://api.github.com/repos/mnalli/fzf_complete.bash/tarball -o -) -C ~/.fzf_complete.bash --strip-components=1
echo 'source ~/.fzf_complete.bash/fzf_complete.bash' >> ~/.bashrc
```

### Using `git clone`

```sh
git clone https://github.com/mnalli/fzf_complete.bash.git --depth=1 ~/.fzf_complete.bash
echo 'source ~/.fzf_complete.bash/fzf_complete.bash' >> ~/.bashrc
```
