function! pack#PackagerInit() abort
    " Package manager
    packadd vim-packager
    call packager#init({ 'dir': '~/.local/share/nvim/site/pack/packager' })
    call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })

    " Lsp
    call packager#add('neovim/nvim-lsp', { 'type': 'opt' })
    call packager#add('haorenW1025/completion-nvim', { 'type': 'opt' })

    " Git
    call packager#add('mhinz/vim-signify')
    call packager#add('tpope/vim-fugitive')

    " Files manager
    call packager#add('junegunn/fzf.vim')
    call packager#add('fszymanski/fzf-quickfix')
    call packager#add('mcchrish/nnn.vim')
    call packager#add('ludovicchabant/vim-gutentags')

    " UI
    call packager#add('junegunn/goyo.vim', { 'type': 'opt' })
    call packager#add('junegunn/limelight.vim', { 'type': 'opt' })

    " Misc
    call packager#add('itchyny/vim-cursorword')
    call packager#add('tpope/vim-commentary')
    call packager#add('junegunn/vim-easy-align')
    call packager#add('moll/vim-bbye')
    call packager#add('cohama/lexima.vim')
    call packager#add('tpope/vim-surround')
    call packager#add('tpope/vim-repeat')
    call packager#add('norcalli/nvim-colorizer.lua', { 'type': 'opt' })
    call packager#add('vimwiki/vimwiki', { 'type': 'opt' })
    call packager#add('justinmk/vim-sneak')

    " Languages
    call packager#add('editorconfig/editorconfig-vim')
    call packager#add('sheerun/vim-polyglot')
    call packager#add('bakpakin/fennel.vim')
    call packager#add('Olical/conjure', { 'tag': 'v2.1.2', 'do': 'bin/compile' })
    call packager#add('iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } })
endfunction
