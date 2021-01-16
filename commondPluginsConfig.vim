function s:source(rpath)
    execute  'source ' . g:root_dir.a:rpath[1:]
endfunction
"
" 代码主题配置
"
" colorscheme gruvbox
" set background=dark


"通用基础参数设置

call s:source('./commond/config.vim')

"
" 通用映射键配置
"
call s:source('./commond/mapConfig.vim')

"
" #4 NerderTree 配置文件管理
"
call s:source('./commond/nerdTreeConfig.vim')

"
" #5 字符定位
"
call s:source('./commond/easyMotionConfig.vim')


"
" #9 窗口选择
"
call s:source('./commond/windowsConfig.vim')

"
" #11 emmet
"
let g:user_emmet_mode='a'    "enable all function in all mode.

"
" #12  翻译
"
call s:source('./commond/translationConfig.vim')

"
" #13 缩进线
"
call s:source('./commond/indentLineConfig.vim')

"
" #15 状态栏
" 
call s:source('./commond/airlineConfig.vim')

"
" #15 文件搜索
" 
call s:source('./commond/fzfConfig.vim')

" 
" #16 multiple cursors
" 
call s:source('./commond/multipleCursosConfig.vim')

"
" #17 git 
" 
call s:source('./commond/gitConfig.vim')

"
" #18 tagbar
"
" call s:source('./commond/tagbarConfig.vim')

"
" # 21 theme config
"
"
call s:source('./commond/themeConfig.vim')

"
" #29 排版
"
call s:source('./commond/vim-easy-align.vim')



call s:source('./commond/vista.vim')

"
" # 8 search
"
call s:source('./commond/easySearch.vim')

command! LC execute 'call s:source("./commond/easySearch.vim")'

