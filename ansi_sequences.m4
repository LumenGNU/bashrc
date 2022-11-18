

divert(`-1')
# _join(sep, args) - join each non-empty ARG into a single
# string, with each element separated by SEP
define(`_join',
`ifelse(`$#', `2', ``$2'',
  `ifelse(`$2', `', `', ``$2'_')$0(`$1', shift(shift($@)))')')
define(`__join',
`ifelse(`$#$2', `2', `',
  `ifelse(`$2', `', `', ``$1$2'')$0(`$1', shift(shift($@)))')')
divert`'dnl

dnl # --------------------------------------------------------------------------

dnl # **************************************************************************


dnl # SGR (Select Graphic Rendition) parameters
define(`reset_all',           0)dnl # All attributes off
define(`bold_on',             1)dnl # Bold or increased intensity
define(`dim_on',              2)dnl # Faint, decreased intensity, or dim
define(`intensity_off',      22)dnl # off bold or dim
define(`italic_on',           3)dnl # Italic
define(`italic_off',         23)dnl # Neither italic, nor blackletter
define(`underline_on',      4:1)dnl # Underline
define(`underline2_on',     4:2)dnl # Doubly underlined
define(`underline3_on',     4:3)dnl # Wave underlined
define(`underline_off',      24)dnl # Not underlined
define(`blink_on',            5)dnl # Slow blink
define(`blink_off',          25)dnl # Not blinking
define(`reverse_on',          7)dnl # Reverse video or invert
define(`reverse_off',        27)dnl # Not reversed
define(`hide_on',             8)dnl # Conceal or hide
define(`hide_off',           28)dnl # Reveal Not concealed
define(`strike_on',           9)dnl # Crossed-out, or strike
define(`strike_off',         29)dnl # Not crossed out
define(`overline_on',        53)dnl # Overlined
define(`overline_off',       55)dnl # Not overlined

dnl # Set foreground color in RGB format
dnl #   set_fg_rgb(R, G, B)
define(`set_fg_rgb',        `38;2;$1;$2;$3')

dnl # Set foreground color in predefined set of 256 colors
dnl #   set_fg_inx(color_index), 
dnl # color_index = 0-  7:  standard colors (as in ESC [ 30–37 m)
dnl #               8- 15:  high intensity colors (as in ESC [ 90–97 m)
dnl #              16-231:  6 × 6 × 6 cube (216 colors): 16 + 36 × r + 6 × g + b (0 ≤ r, g, b ≤ 5)
dnl #             232-255:  grayscale from dark to light in 24 steps
define(`set_fg_inx',       38;5;$1)

dnl # Default foreground color
define(`reset_fg',          39)

dnl # Set background color in RGB format
dnl #   set_bg_rgb(R, G, B)
define(`set_bg_rgb',        48;2;$1;$2;$3)

dnl # Set background color in predefined set of 256 colors
dnl #   set_bg_inx(color_index), 
dnl # color_index = 0-  7:  standard colors (as in ESC [ 30–37 m)
dnl #               8- 15:  high intensity colors (as in ESC [ 90–97 m)
dnl #              16-231:  6 × 6 × 6 cube (216 colors): 16 + 36 × r + 6 × g + b (0 ≤ r, g, b ≤ 5)
dnl #             232-255:  grayscale from dark to light in 24 steps
define(`set_bg_inx',       48;5;$1)

dnl # Default background color
define(`reset_bg',          49)

dnl # Set underline color in RGB format
dnl #   set_underline_rgb(R, G, B)
define(`set_underline_rgb',  58;2;$1;$2;$3)

dnl # Set underline color in predefined set of 256 colors
dnl #   set_underline_inx(color_index), 
dnl # color_index = 0-  7:  standard colors (as in ESC [ 30–37 m)
dnl #               8- 15:  high intensity colors (as in ESC [ 90–97 m)
dnl #              16-231:  6 × 6 × 6 cube (216 colors): 16 + 36 × r + 6 × g + b (0 ≤ r, g, b ≤ 5)
dnl #             232-255:  grayscale from dark to light in 24 steps
define(`set_underline_inx', 58;5;$1)

dnl # Default underline color
define(`reset_underline',   59)


dnl # Named BG/FG Colors
dnl # Set named foreground color
define(`set_fg_Black',    30)
define(`set_fg_Red',      31)
define(`set_fg_Green',    32)
define(`set_fg_Yellow',   33)
define(`set_fg_Blue',     34)
define(`set_fg_Magenta',  35)
define(`set_fg_Cyan',     36)
define(`set_fg_White',    37)
define(`set_fg_HBlack',   90)
define(`set_fg_HRed',     91)
define(`set_fg_HGreen',   92)
define(`set_fg_HYellow',  93)
define(`set_fg_HBlue',    94)
define(`set_fg_HMagenta', 95)
define(`set_fg_HCyan',    96)
define(`set_fg_HWhite',   97)
define(`set_bg_Black',    40)
define(`set_bg_Red',      41)
define(`set_bg_Green',    42)
define(`set_bg_Yellow',   43)
define(`set_bg_Blue',     44)
define(`set_bg_Magenta',  45)
define(`set_bg_Cyan',     46)
define(`set_bg_White',    47)
define(`set_bg_HBlack',   100)
define(`set_bg_HRed',     101)
define(`set_bg_HGreen',   102)
define(`set_bg_HYellow',  103)
define(`set_bg_HBlue',    104)
define(`set_bg_HMagenta', 105)
define(`set_bg_HCyan',    106)
define(`set_bg_HWhite',   107)

dnl # ESC symbol
define(`_ESC', `\033')
dnl # BEL symbol
define(`_BEL', `\a')


dnl # Select Graphic Rendition
dnl # Sets colors and style of the characters following this code:
dnl #   SGR(sgr_param1, sgr_param2, ..., sgr_paramN)
define(`SGR', _CSI(`_join(;, $@)'m))

dnl # CSI (Control Sequence Introducer) sequences
define(`_CSI', _ESC[$1)

dnl # OSC (Operating System Command) sequences
define(`_OSC', _ESC]$1)


dnl # 
define(`set_title', _OSC(0);$*_BEL)

dnl # set_link(URI, text)
define(`set_link', _join(`', _OSC(8), ;;$1\e\\$2, _OSC(8), ;;\e\\))

dnl #---
