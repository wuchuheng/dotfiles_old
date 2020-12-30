function s:get_full_path(rpath)
    return  g:root_dir.a:rpath[1:]
endfunction
"
" 代码主题配置
"
" colorscheme gruvbox
" set background=dark


"通用基础参数设置

execute 'source '.s:get_full_path('./commond/config.vim')

"
" 通用映射键配置
"
execute 'source '.s:get_full_path('./commond/mapConfig.vim')

"
" #4 NerderTree 配置文件管理
"
execute 'source '.s:get_full_path('./commond/nerdTreeConfig.vim')

"
" #5 字符定位
"
execute 'source '.s:get_full_path('./commond/easyMotionConfig.vim')


"
" #9 窗口选择
"
execute 'source '.s:get_full_path('./commond/windowsConfig.vim')

"
" #11 emmet
"
let g:user_emmet_mode='a'    "enable all function in all mode.

"
" #12  翻译
"
execute 'source '.s:get_full_path('./commond/translationConfig.vim')

"
" #13 缩进线
"
execute 'source '.s:get_full_path('./commond/indentLineConfig.vim')

"
" #15 状态栏
" 
execute 'source'.s:get_full_path('./commond/airlineConfig.vim')

"
" #15 文件搜索
" 
execute 'source '.s:get_full_path('./commond/fzfConfig.vim')

" 
" #16 multiple cursors
" 
execute 'source '.s:get_full_path('./commond/multipleCursosConfig.vim')

"
" #17 git 
" 
execute 'source '.s:get_full_path('./commond/gitConfig.vim')

"
" #18 tagbar
"
execute 'source '.s:get_full_path('./commond/tagbarConfig.vim')

"
" # 21 theme config
"
"
execute 'source '.s:get_full_path('./commond/themeConfig.vim')
