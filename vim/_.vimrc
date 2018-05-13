" Vundle phrases must be on the top
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    " == Snippets ==
    "Plugin 'SirVer/ultisnips' "engine for creating snippets
    "Plugin 'honza/vim-snippets' "some common snippets 
    " == Satus line ==
    Plugin 'itchyny/lightline.vim' "beautiful status line
    " == Git ==
    Plugin 'tpope/vim-fugitive'    " easy commands to do git
    " == File Tree ==
    Plugin 'scrooloose/nerdtree'          " File tree manager
    Plugin 'Xuyuanp/nerdtree-git-plugin'  " display git status within Nerdtree
    Plugin 'jistr/vim-nerdtree-tabs'      " enhance nerdtree's tabs
    Plugin 'ryanoasis/vim-devicons'       " add beautiful icons besides files
    "Plugin 'tiagofumo/vim-nerdtree-syntax-highlight' " enhance devicons
call vundle#end()            " required
filetype plugin indent on    " required
set laststatus=2 " startup the lightline.vim 
let g:lightline = { 'colorscheme': 'powerline', } "set status-line's color scheme

" ---- Native config customization ----
colorscheme gruvbox 
syntax enable 
set number "show line number
set cursorline "highlight current line with cursor on
"set mouse=nv "设置鼠标控制界面滚动 而不是控制光标滚动，同时-号设置是让鼠标选择文字时禁止自动进入visual模式。
"set paste   "设置可以直接用ctrl+c ctrl+v复制粘贴 其实没什么区别 只不过不用在insert模式而已
set showcmd " show keypress at right-bottom
set backspace=2 "backspace over everything in insert mode
set autoindent "换行时自动缩排 同时对应的还有其它两种模式 smartindent, cindent
set tabstop=4 "设定tab宽度为4个字符
set shiftwidth=4 "设定自动缩进为4个字符
set expandtab "用space替代tab的输入 取消的话 就用set noexpandtab "不用space替代tab的输入
set encoding=utf8  "设置默认编码
retab "打开文件时自动转换所有tab为空格

" ---- Nerdtree ----
"autocmd vimenter * NERDTree  "自动开启Nerdtree
"let g:NERDTreeWinSize = 25 "设定 NERDTree 视窗大小
"开启/关闭nerdtree快捷键
map <C-f> :NERDTreeToggle<CR>
"let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
"打开vim时如果没有文件自动打开NERDTree
autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"设置树的显示图标
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeIgnore = ['\.pyc$']  " 过滤所有.pyc文件不显示
"let g:NERDTreeShowLineNumbers=1  " 是否显示行号
let g:NERDTreeHidden=0     "不显示隐藏文件
"Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"NERDTree-Tabs
let g:nerdtree_tabs_open_on_console_startup=1 "设置打开vim的时候默认打开tabs

"Nerdtree-devicons
set guifont=DroidSansMono_Nerd_Font:h11

"Nerdtree-syntax-highlighting
"let g:NERDTreeDisableFileExtensionHighlight = 1
"let g:NERDTreeDisableExactMatchHighlight = 1
"let g:NERDTreeDisablePatternMatchHighlight = 1
"let g:NERDTreeFileExtensionHighlightFullName = 1
"let g:NERDTreeExactMatchHighlightFullName = 1
"let g:NERDTreePatternMatchHighlightFullName = 1
"let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
"let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
"let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error

"NERDTREE-GIT
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }


" ---- Commenting blocks of code ----
"autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
"autocmd FileType sh,ruby,python   let b:comment_leader = '# '
"autocmd FileType conf,fstab       let b:comment_leader = '# '
"autocmd FileType tex              let b:comment_leader = '% '
"autocmd FileType mail             let b:comment_leader = '> '
"autocmd FileType vim              let b:comment_leader = '" '
"noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
"noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
"
