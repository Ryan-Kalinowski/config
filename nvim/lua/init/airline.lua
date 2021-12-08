require('packer').use {
  'vim-airline/vim-airline',
  config = function()
    -- ░
    vim.cmd([[
      let g:airline_detect_spell=0
      let g:airline_left_alt_sep='▒'
      let g:airline_left_sep='▓▒'
      let g:airline_powerline_fonts=1
      let g:airline_right_alt_sep='▒'
      let g:airline_right_sep='▒▓'
      let g:airline_skip_empty_sections = 1
      let g:airline_theme='badwolf'
      let g:airline#extension_dispatcher#hunks#enabled=0
      let g:airline#extension_dispatcher#neomake#enabled=1
      let g:airline#extension_dispatcher#tabline#enabled=1
      let g:airline#extension_dispatcher#tabline#buffer_min_count=2
      let g:airline#extension_dispatcher#tabline#buffer_nr_show=1
      let g:airline#extension_dispatcher#tabline#tab_min_count=2
      let g:airline#extension_dispatcher#tabline#show_close_button=0
      let g:airline#extension_dispatcher#tabline#left_sep=''
      let g:airline#extension_dispatcher#tabline#right_sep=''
      let g:airline#extension_dispatcher#whitespace#enabled=1
      let g:airline#extension_dispatcher#whitespace#symbol='µ'
      let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
      if !exists('g:airline_symbols')
        let g:airline_symbols = {}
      endif
      let g:airline_symbols.linenr = ''
      function! AirlineInit()
        call airline#parts#define_raw('colnr', '%2c')
        call airline#parts#define_accent('colnr', 'bold')
        let g:airline_section_z = airline#section#create(['colnr', ':%l'])
      endfunction
      augroup airline_config
        autocmd!
        autocmd User AirlineAfterInit call AirlineInit()
      augroup END
    ]])
  end,
}
