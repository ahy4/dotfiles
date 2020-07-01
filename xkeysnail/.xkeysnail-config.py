# -*- coding: utf-8 -*-

import re
from xkeysnail.transform import *

define_modmap({
    Key.CAPSLOCK: Key.LEFT_CTRL,
    Key.LEFT_ALT: Key.LEFT_META,
    Key.GRAVE: Key.LEFT_META,
})

define_multipurpose_modmap({
    Key.MUHENKAN: [Key.MUHENKAN, Key.RIGHT_ALT],
    Key.LEFT_META: [Key.MUHENKAN, Key.LEFT_META],
    Key.RIGHT_META: [Key.HENKAN, Key.RIGHT_META],
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
    K('C-Henkan'): K('C-Tab'),
    K('C-Muhenkan'): K('C-Shift-Tab'),
}, "Chrome tabswitch")
