jellygrass.vim
==============

A colorful, dark color scheme, forked from [jellybeans](https://github.com/nanotech/jellybeans.vim)

## Options

### Custom Highlights

If you prefer slightly different colors from what Jellybeans defines,
you can set `g:jellygrass_overrides` in your .vimrc to a dictionary of
custom highlighting parameters:

    let g:jellygrass_overrides = {
    \    'Todo': { 'guifg': '303030', 'guibg': 'f0f000',
    \              'ctermfg': 'Black', 'ctermbg': 'Yellow',
    \              'attr': 'bold' },

### Custom Highlights

If you prefer slightly different colors from what Jellybeans defines,
you can set `g:jellygrass_overrides` in your .vimrc to a dictionary of
custom highlighting parameters:

    let g:jellygrass_overrides = {
    \    'Todo': { 'guifg': '303030', 'guibg': 'f0f000',
    \              'ctermfg': 'Black', 'ctermbg': 'Yellow',
    \              'attr': 'bold' },
    \    'Comment': { 'guifg': 'cccccc' },
    \}

This removes the need to edit Jellybeans directly, simplifying
upgrades. In addition, RGB colors specified this way are run through
the same color approximation algorithm that the core theme uses, so
your colors work just as well in 256-color terminals.

If you can pick better colors than the approximator, specify them
in the `256ctermfg` and `256ctermbg` parameters to override
its choices.

#### Custom Background Colors

To set a custom background color, override the special
`background` highlight group:

    let g:jellygrass_overrides = {
    \    'background': { 'guibg': '000000' },
    \}

Jellybeans uses the background color in multiple highlight
groups. Using the special `background` group overrides them all
at once.

This replaces `g:jellygrass_background_color` and
`g:jellygrass_background_color_256` from Jellybeans versions
before 1.6.

#### Terminal Background

If you would prefer to use your terminal's default background
(e.g. for transparent backgrounds, image backgrounds, or a
different color) instead of the background color that Jellybeans
applies, use this `background` override:

    let g:jellygrass_overrides = {
    \    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
    \}
