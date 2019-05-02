# Antibracket for Mac

This script is intended to be run with [jq](https://github.com/stedolan/jq), and generates a JSON rules file for use with [Karabiner](https://pqrs.org/osx/karabiner/).

To use:
1. Install Karabiner.
2. Open Karabiner Elements.
3. Open a terminal, `cd` into this directory, then run the following: ```console
./generate.jq | tee ~/.config/karabiner/assets/complex_modifications/antibracket.json
```
4. Switch to the "Complex Modifications" tab, then click "Add rule".
5. Click "Enable" next to "Remap keys to use Antibracket keyboard layout".
