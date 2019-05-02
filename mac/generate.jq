#!/usr/bin/env jq -n -f

[
	[
		{
			"type": "basic",
			"from": {
				"key_code": "quote",
				"modifiers": {
					"optional": ["any"],
				}
			},
			"to": [
				{ "set_variable": { "name": "punctuation_modifier", "value": 1 } }
			],
			"to_after_key_up": [
				{ "set_variable": { "name": "punctuation_modifier", "value": 0 } }
			],
		}
	],
	[
		{
			"q": ["left_shift", "quote"],
			"w": ["left_shift", "hyphen"],
			"e": ["open_bracket"],
			"r": ["close_bracket"],
			"t": ["left_shift", "6"],
			"y": ["left_shift", "1"],
			"u": ["left_shift", "comma"],
			"i": ["left_shift", "period"],
			"o": ["equal_sign"],
			"p": ["left_shift", "7"],
			"a": ["slash"],
			"s": ["hyphen"],
			"d": ["left_shift", "open_bracket"],
			"f": ["left_shift", "close_bracket"],
			"g": ["left_shift", "8"],
			"h": ["left_shift", "slash"],
			"j": ["left_shift", "9"],
			"k": ["left_shift", "0"],
			"l": ["quote"],
			"semicolon": ["left_shift", "semicolon"],
			"z": ["left_shift", "3"],
			"x": ["left_shift", "4"],
			"c": ["left_shift", "backslash"],
			"v": ["left_shift", "grave_accent_and_tilde"],
			"b": ["grave_accent_and_tilde"],
			"n": ["left_shift", "equal_sign"],
			"m": ["left_shift", "5"],
			"comma": ["backslash"],
			"period": ["left_shift", "2"],
		} | to_entries | map(. as { "key": $from, "value": $to } | {
			"type": "basic",
			"from": {
				"key_code": $from,
				"modifiers": {
					"optional": ["any"],
				}
			},
			"to": [
				{ "key_code": $to[-1], "modifiers": $to[:-1] }
			],
			"conditions": [
				{
					"type": "variable_if",
					"name": "punctuation_modifier",
					"value": 1
				}
			]
		})
	],
	[
		{
			"q": "w",
			"w": "f",
			"e": "u",
			"r": "y",
			"t": "z",
			"y": "x",
			"u": "h",
			"i": "p",
			"o": "b",
			"p": "q",
			"a": "l",
			"s": "o",
			"d": "e",
			"f": "a",
			"g": "i",
			"h": "n",
			"j": "r",
			"k": "t",
			"l": "d",
			"semicolon": "s",
			"z": "comma",
			"x": "g",
			"c": "m",
			"v": "j",
			"b": "semicolon",
			"n": "v",
			"m": "k",
			"comma": "c",
			"period": "period",
		} | to_entries | map(. as { "key": $from, "value": $to } | {
			"type": "basic",
			"from": {
				"key_code": $from,
				"modifiers": {
					"optional": ["any"],
				}
			},
			"to": [
				{ "key_code": $to }
			]
		})
	]
] | flatten | {
	"title": "Antibracket",
	"rules": [
		{
			"description": "Remap keys to use Antibracket keyboard layout",
			"manipulators": .
		}
	]
}
