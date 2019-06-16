# -*- coding: utf-8 -*-

import re
from xkeysnail.transform import *

define_modmap({
    Key.CAPSLOCK: Key.LEFT_CTRL,
    Key.LEFT_ALT: Key.LEFT_META,
    #Key.LEFT_META: Key.LEFT_ALT
})

define_multipurpose_modmap({
    Key.MUHENKAN: [Key.MUHENKAN, Key.RIGHT_ALT]
})

define_keymap(None, {
    K('M-h'): Key.LEFT,
    K('M-j'): Key.DOWN,
    K('M-k'): Key.UP,
    K('M-l'): Key.RIGHT,
}, "Vim-like cursor")

define_keymap(None, {
    K('C-h'): Key.BACKSPACE,
}, "Force C-h backspace")

define_keymap(None, {
    K('Super-c'): K('C-c'),
    K('Super-v'): K('C-v'),
    K('Super-Shift-c'): K('C-c'),
    K('Super-Shift-v'): K('C-v'),
    K('Super-x'): K('C-x'),
    K('Super-a'): K('C-a'),
    K('Super-w'): K('C-w'),
}, "Mac like keybind")

