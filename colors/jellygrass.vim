" Vim color file
"
"  "    __       _ _       _                             "
"  "    \ \  ___| | |_   _| |__   ___  __ _ _ __  ___    "
"  "     \ \/ _ \ | | | | |  _ \ / _ \/ _  |  _ \/ __|   "
"  "  /\_/ /  __/ | | |_| | |_| |  __/ |_| | | | \__ \   "
"  "  \___/ \___|_|_|\__  |____/ \___|\____|_| |_|___/   "
"  "                 \___/                               "
"
"         "A colorful, dark color scheme for Vim."
"
" File:         jellygrass.vim
" URL:          github.com/nanotech/jellygrass.vim
" Scripts URL:  vim.org/scripts/script.php?script_id=2555
" Maintainer:   NanoTech (nanotech.nanotechcorp.net)
" Version:      1.6
" Last Change:  October 18th, 2016
" License:      MIT
" Contributors: Andrew Wong (w0ng)
"               Brian Marshall (bmars)
"               Daniel Herbert (pocketninja)
"               David Liang <bmdavll at gmail dot com>
"               Henry So, Jr. <henryso@panix.com>
"               Joe Doherty (docapotamus)
"               Karl Litterfeldt (Litterfeldt)
"               Keith Pitt (keithpitt)
"               Philipp Rustemeier (12foo)
"               Rafael Bicalho (rbika)
"               Rich Healey (richo)
"               Siwen Yu (yusiwen)
"               Tim Willis (willist)
"
" Copyright (c) 2009-2016 NanoTech
"
" Permission is hereby granted, free of charge, to any per‐
" son obtaining a copy of this software and associated doc‐
" umentation  files  (the “Software”), to deal in the Soft‐
" ware without restriction,  including  without  limitation
" the rights to use, copy, modify, merge, publish, distrib‐
" ute, sublicense, and/or sell copies of the Software,  and
" to permit persons to whom the Software is furnished to do
" so, subject to the following conditions:
"
" The above copyright notice  and  this  permission  notice
" shall  be  included in all copies or substantial portions
" of the Software.
"
" THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY
" KIND,  EXPRESS  OR  IMPLIED, INCLUDING BUT NOT LIMITED TO
" THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICU‐
" LAR  PURPOSE  AND  NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE  LIABLE  FOR  ANY  CLAIM,
" DAMAGES  OR OTHER LIABILITY, WHETHER IN AN ACTION OF CON‐
" TRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CON‐
" NECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "jellygrass"

if has("gui_running") || (has('termguicolors') && &termguicolors) || &t_Co >= 88
  let s:low_color = 0
else
  let s:low_color = 1
endif

let s:background_color = 232
let s:black = 16
let s:grey = 237
let s:dark_grey = 233
let s:white = 244
let s:light_white = 255
let s:light_red = 1
let s:red = 9
let s:dark_red = 88
let s:green = 64
let s:light_green = 108
let s:blue = 67          " My shellrc uses 31
let s:cyan = 73
let s:light_blue = 110
let s:yellow = 185
let s:purple = 98        " Unused
let s:light_orange = 214 " Unused
let s:orange = 130       " Unused

let s:termBlack = s:background_color

" Color approximation functions by Henry So, Jr. and David Liang {{{
" Added to jellygrass.vim by Daniel Herbert

" returns an approximate grey index for the given grey level
fun! s:grey_number(x)
  if &t_Co == 88
    if a:x < 23
      return 0
    elseif a:x < 69
      return 1
    elseif a:x < 103
      return 2
    elseif a:x < 127
      return 3
    elseif a:x < 150
      return 4
    elseif a:x < 173
      return 5
    elseif a:x < 196
      return 6
    elseif a:x < 219
      return 7
    elseif a:x < 243
      return 8
    else
      return 9
    endif
  else
    if a:x < 14
      return 0
    else
      let l:n = (a:x - 8) / 10
      let l:m = (a:x - 8) % 10
      if l:m < 5
        return l:n
      else
        return l:n + 1
      endif
    endif
  endif
endfun

" returns the actual grey level represented by the grey index
fun! s:grey_level(n)
  if &t_Co == 88
    if a:n == 0
      return 0
    elseif a:n == 1
      return 46
    elseif a:n == 2
      return 92
    elseif a:n == 3
      return 115
    elseif a:n == 4
      return 139
    elseif a:n == 5
      return 162
    elseif a:n == 6
      return 185
    elseif a:n == 7
      return 208
    elseif a:n == 8
      return 231
    else
      return 255
    endif
  else
    if a:n == 0
      return 0
    else
      return 8 + (a:n * 10)
    endif
  endif
endfun

" returns the palette index for the given grey index
fun! s:grey_color(n)
  if &t_Co == 88
    if a:n == 0
      return 16
    elseif a:n == 9
      return 79
    else
      return 79 + a:n
    endif
  else
    if a:n == 0
      return 16
    elseif a:n == 25
      return 231
    else
      return 231 + a:n
    endif
  endif
endfun

" returns an approximate color index for the given color level
fun! s:rgb_number(x)
  if &t_Co == 88
    if a:x < 69
      return 0
    elseif a:x < 172
      return 1
    elseif a:x < 230
      return 2
    else
      return 3
    endif
  else
    if a:x < 75
      return 0
    else
      let l:n = (a:x - 55) / 40
      let l:m = (a:x - 55) % 40
      if l:m < 20
        return l:n
      else
        return l:n + 1
      endif
    endif
  endif
endfun

" returns the actual color level for the given color index
fun! s:rgb_level(n)
  if &t_Co == 88
    if a:n == 0
      return 0
    elseif a:n == 1
      return 139
    elseif a:n == 2
      return 205
    else
      return 255
    endif
  else
    if a:n == 0
      return 0
    else
      return 55 + (a:n * 40)
    endif
  endif
endfun

" returns the palette index for the given R/G/B color indices
fun! s:rgb_color(x, y, z)
  if &t_Co == 88
    return 16 + (a:x * 16) + (a:y * 4) + a:z
  else
    return 16 + (a:x * 36) + (a:y * 6) + a:z
  endif
endfun

" returns the palette index to approximate the given R/G/B color levels
fun! s:color(r, g, b)
  " map greys directly (see xterm's 256colres.pl)
  if &t_Co == 256 && a:r == a:g && a:g == a:b && a:r > 3 && a:r < 243
    return (a:r - 8) / 10 + 232
  endif

  " get the closest grey
  let l:gx = s:grey_number(a:r)
  let l:gy = s:grey_number(a:g)
  let l:gz = s:grey_number(a:b)

  " get the closest color
  let l:x = s:rgb_number(a:r)
  let l:y = s:rgb_number(a:g)
  let l:z = s:rgb_number(a:b)

  if l:gx == l:gy && l:gy == l:gz
    " there are two possibilities
    let l:dgr = s:grey_level(l:gx) - a:r
    let l:dgg = s:grey_level(l:gy) - a:g
    let l:dgb = s:grey_level(l:gz) - a:b
    let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
    let l:dr = s:rgb_level(l:gx) - a:r
    let l:dg = s:rgb_level(l:gy) - a:g
    let l:db = s:rgb_level(l:gz) - a:b
    let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
    if l:dgrey < l:drgb
      " use the grey
      return s:grey_color(l:gx)
    else
      " use the color
      return s:rgb_color(l:x, l:y, l:z)
    endif
  else
    " only one possibility
    return s:rgb_color(l:x, l:y, l:z)
  endif
endfun

fun! s:is_empty_or_none(str)
  return empty(a:str) || a:str ==? "NONE"
endfun

" returns true if string starts with a #
fun! s:has_prefix(str, prefix)
  return strpart(a:str, 0, 1) ==? a:prefix
endfun

" returns the palette index to approximate the 'rrggbb' hex string
fun! s:rgb(rgb)
  if s:is_empty_or_none(a:rgb)
    return "NONE"
  endif

  " Calculate from RGB if prefix is given
  if s:has_prefix(a:rgb, "#")
    let l:r = ("0x" . strpart(a:rgb, 1, 2)) + 0
    let l:g = ("0x" . strpart(a:rgb, 3, 2)) + 0
    let l:b = ("0x" . strpart(a:rgb, 5, 2)) + 0
    echo a:rgb . " : " . s:color(l:r, l:g, l:b)
    return s:color(l:r, l:g, l:b)
  else
    return a:rgb
  endif
endfun

fun! s:prefix_highlight_value_with(prefix, color)
  if s:is_empty_or_none(a:color)
    return "NONE"
  else
    return a:prefix . a:color
  endif
endfun

fun! s:remove_italic_attr(attr)
  let l:attr = join(filter(split(a:attr, ","), "v:val !=? 'italic'"), ",")
  if empty(l:attr)
    let l:attr = "NONE"
  endif
  return l:attr
endfun

" sets the highlighting for the given group
fun! s:X(group, fg, bg, attr)
  exec "hi ".a:group. " ctermfg=".s:rgb(a:fg). " ctermbg=".s:rgb(a:bg)
  " guifg=".a:fg. " guibg=".a:bg.

  let l:attr = s:prefix_highlight_value_with("", a:attr)

  if exists("g:jellygrass_use_term_italics") && g:jellygrass_use_term_italics
    let l:cterm_attr = l:attr
  else
    let l:cterm_attr = s:remove_italic_attr(l:attr)
  endif

  if !exists("g:jellygrass_use_gui_italics") || g:jellygrass_use_gui_italics
    let l:gui_attr = l:attr
  else
    let l:gui_attr = s:remove_italic_attr(l:attr)
  endif

  exec "hi ".a:group." gui=".l:gui_attr." cterm=".l:cterm_attr
endfun
" }}}

call s:X("Normal","#e8e8d3",s:background_color,"")
set background=dark

if version >= 700
  call s:X("CursorLine","","#1c1c1c","")
  call s:X("CursorColumn","","#1c1c1c","")
  call s:X("MatchParen",s:white,"#556779","bold")

  call s:X("TabLine",s:black,"#b0b8c0","italic")
  call s:X("TabLineFill","#9098a0","","")
  call s:X("TabLineSel",s:black,"#f0f0f0","italic")

  " Auto-completion
  call s:X("Pmenu",s:white,"#606060","")
  call s:X("PmenuSel","#101010","#eeeeee","")
endif

call s:X("Visual","","#404040","")
call s:X("Cursor",s:background_color,"#b0d0f0","")

call s:X("LineNr","#605958",s:background_color,"NONE")
call s:X("CursorLineNr","#ccc5c4","","NONE")
call s:X("Comment","#888888","","italic")
call s:X("Todo","#c7c7c7","","bold")

call s:X("StatusLine",s:black,"#dddddd","italic")
call s:X("StatusLineNC",s:white,"#403c41","italic")
call s:X("VertSplit","#777777","#403c41","")
call s:X("WildMenu","#f0a0c0","#302028","")

call s:X("Folded","#a0a8b0","#384048","italic")
call s:X("FoldColumn","#535D66","#1f1f1f","")
call s:X("SignColumn","#777777","#333333","")
call s:X("ColorColumn","",s:black,"")


call s:X("Title",s:green,"","bold")

call s:X("Constant",s:red,"","")
call s:X("Special",s:green,"","")
call s:X("Delimiter",s:cyan,"","")

call s:X("String",s:yellow,"","")
call s:X("StringDelimiter",s:yellow,"","")

call s:X("Identifier",s:light_green,"","")
call s:X("Structure",s:light_green,"","")
call s:X("Function",s:light_green,"","")
call s:X("Statement",s:green,"","")
call s:X("PreProc",s:light_blue,"","")

hi! link Operator Structure
hi! link Conceal Operator

call s:X("Type",s:blue,"","")
call s:X("NonText","#606060",s:background_color,"")

call s:X("SpecialKey","#444444","#1c1c1c","")

call s:X("Search","#f0a0c0","#302028","underline")

call s:X("Directory",s:yellow,"","")
call s:X("ErrorMsg","",s:dark_red,"")
hi! link Error ErrorMsg
hi! link MoreMsg Special
call s:X("Question",s:cyan,"","")


" Spell Checking

call s:X("SpellBad","",s:dark_red,"underline")
call s:X("SpellRare","",s:dark_red,"underline")
call s:X("SpellCap","",s:light_green,"underline")
call s:X("SpellLocal","",s:green,"underline")

" Diff

hi! link diffRemoved Constant
hi! link diffAdded String

" VimDiff

call s:X("DiffAdd","#D2EBBE","#437019","")
call s:X("DiffDelete","#40000A","#700009","")
call s:X("DiffChange","","#2B5B77","")
call s:X("DiffText","#8fbfdc",s:black,"reverse")

" PHP

hi! link phpFunctions Function
call s:X("StorageClass","#c59f6f","","")
hi! link phpSuperglobal Identifier
hi! link phpQuoteSingle StringDelimiter
hi! link phpQuoteDouble StringDelimiter
hi! link phpBoolean Constant
hi! link phpNull Constant
hi! link phpArrayPair Operator
hi! link phpOperator Normal
hi! link phpRelation Normal
hi! link phpVarSelector Identifier

" Python

hi! link pythonOperator Statement

" Ruby

hi! link rubySharpBang Comment
call s:X("rubyClass","#447799","","")
call s:X("rubyIdentifier","#c6b6fe","","")
hi! link rubyConstant Type
hi! link rubyFunction Function

call s:X("rubyInstanceVariable","#c6b6fe","","")
call s:X("rubySymbol","#88aa7e","","")
hi! link rubyGlobalVariable rubyInstanceVariable
hi! link rubyModule rubyClass
call s:X("rubyControl","#608516","","")

hi! link rubyString String
hi! link rubyStringDelimiter StringDelimiter
hi! link rubyInterpolationDelimiter Identifier

call s:X("rubyRegexpDelimiter","#540063","","")
call s:X("rubyRegexp","#dd0093","","")
call s:X("rubyRegexpSpecial","#a40073","","")

call s:X("rubyPredefinedIdentifier","#de5577","","")

" Erlang

hi! link erlangAtom rubySymbol
hi! link erlangBIF rubyPredefinedIdentifier
hi! link erlangFunction rubyPredefinedIdentifier
hi! link erlangDirective Statement
hi! link erlangNode Identifier

" Elixir

hi! link elixirAtom rubySymbol


" JavaScript

hi! link javaScriptValue Constant
hi! link javaScriptRegexpString rubyRegexp
hi! link javaScriptTemplateVar StringDelim
hi! link javaScriptTemplateDelim Identifier
hi! link javaScriptTemplateString String

" CoffeeScript

hi! link coffeeRegExp javaScriptRegexpString

" Lua

hi! link luaOperator Conditional

" C

hi! link cFormat Identifier
hi! link cOperator Constant

" Objective-C/Cocoa

hi! link objcClass Type
hi! link cocoaClass objcClass
hi! link objcSubclass objcClass
hi! link objcSuperclass objcClass
hi! link objcDirective rubyClass
hi! link objcStatement Constant
hi! link cocoaFunction Function
hi! link objcMethodName Identifier
hi! link objcMethodArg Normal
hi! link objcMessageName Identifier

" Vimscript

hi! link vimOper Normal

" HTML

hi! link htmlTag Statement
hi! link htmlEndTag htmlTag
hi! link htmlTagName htmlTag

" XML

hi! link xmlTag Statement
hi! link xmlEndTag xmlTag
hi! link xmlTagName xmlTag
hi! link xmlEqual xmlTag
hi! link xmlEntity Special
hi! link xmlEntityPunct xmlEntity
hi! link xmlDocTypeDecl PreProc
hi! link xmlDocTypeKeyword PreProc
hi! link xmlProcessingDelim xmlAttrib

" Debugger.vim

call s:X("DbgCurrent","#DEEBFE","#345FA8","")
call s:X("DbgBreakPt","","#4F0037","")

" vim-indent-guides

if !exists("g:indent_guides_auto_colors")
  let g:indent_guides_auto_colors = 0
endif
call s:X("IndentGuidesOdd","","#232323","")
call s:X("IndentGuidesEven","","#1b1b1b","")

" Plugins, etc.

hi! link TagListFileName Directory
call s:X("PreciseJumpTarget","#B9ED67","#405026","")

" Manual overrides for 256-color terminals. Dark colors auto-map badly.
if !s:low_color
  hi StatusLineNC ctermbg=235
  hi Folded ctermbg=236
  hi DiffText ctermfg=81
  hi DbgBreakPt ctermbg=53
  hi IndentGuidesOdd ctermbg=235
  hi IndentGuidesEven ctermbg=234
endif

if !empty("s:overrides")
  fun! s:current_attr(group)
    let l:synid = synIDtrans(hlID(a:group))
    let l:attrs = []
    for l:attr in ["bold", "italic", "reverse", "standout", "underline", "undercurl"]
      if synIDattr(l:synid, l:attr, "gui") == 1
        call add(l:attrs, l:attr)
      endif
    endfor
    return join(l:attrs, ",")
  endfun
  fun! s:current_color(group, what, mode)
    let l:color = synIDattr(synIDtrans(hlID(a:group)), a:what, a:mode)
    if l:color == -1
      return ""
    else
      return substitute(l:color, "^#", "", "")
    endif
  endfun
  fun! s:load_color_def(group, def)
    call s:X(a:group, get(a:def, "guifg", s:current_color(a:group, "fg", "gui")),
    \                 get(a:def, "guibg", s:current_color(a:group, "bg", "gui")),
    \                 get(a:def, "attr", s:current_attr(a:group)))
    if !s:low_color
      for l:prop in ["ctermfg", "ctermbg"]
        let l:override_key = "256".l:prop
        if has_key(a:def, l:override_key)
          exec "hi ".a:group." ".l:prop."=".a:def[l:override_key]
        endif
      endfor
    endif
  endfun
  fun! s:load_colors(defs)
    for [l:group, l:def] in items(a:defs)
      if l:group == "background"
        call s:load_color_def("LineNr", l:def)
        call s:load_color_def("NonText", l:def)
        call s:load_color_def("Normal", l:def)
      else
        call s:load_color_def(l:group, l:def)
      endif
      unlet l:group
      unlet l:def
    endfor
  endfun
  delf s:load_colors
  delf s:load_color_def
  delf s:current_color
  delf s:current_attr
endif

" delete functions {{{
delf s:X
delf s:remove_italic_attr
delf s:prefix_highlight_value_with
delf s:rgb
delf s:is_empty_or_none
delf s:color
delf s:rgb_color
delf s:rgb_level
delf s:rgb_number
delf s:grey_color
delf s:grey_level
delf s:grey_number
" }}}
