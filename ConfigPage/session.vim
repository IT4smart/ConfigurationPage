let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <S-Tab> =snipMate#BackwardsSnippet()
inoremap <silent> <Plug>IMAP_JumpBack =IMAP_Jumpfunc('b', 0)
inoremap <silent> <Plug>IMAP_JumpForward =IMAP_Jumpfunc('', 0)
map  h
xnoremap 	 s:let g:snipmate_content_visual=getreg( 1 )
snoremap <silent> 	 i<Right>=snipMate#TriggerSnippet()
vmap <NL> <Plug>IMAP_JumpForward
nmap <NL> <Plug>IMAP_JumpForward
omap <NL> j
map  k
map  l
snoremap  b<BS>
snoremap % b<BS>%
snoremap ' b<BS>'
snoremap U b<BS>U
snoremap \ b<BS>\
map \sl :call LoadSession()
map \ss :call SaveSession()
map \c :make
nmap \l :set list!
snoremap ^ b<BS>^
snoremap ` b<BS>`
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
snoremap <Left> bi
snoremap <Right> a
snoremap <BS> b<BS>
snoremap <silent> <S-Tab> i<Right>=snipMate#BackwardsSnippet()
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())
vnoremap <silent> <Plug>IMAP_JumpBack `<i=IMAP_Jumpfunc('b', 0)
vnoremap <silent> <Plug>IMAP_JumpForward i=IMAP_Jumpfunc('', 0)
vnoremap <silent> <Plug>IMAP_DeleteAndJumpBack "_<Del>i=IMAP_Jumpfunc('b', 0)
vnoremap <silent> <Plug>IMAP_DeleteAndJumpForward "_<Del>i=IMAP_Jumpfunc('', 0)
nnoremap <silent> <Plug>IMAP_JumpBack i=IMAP_Jumpfunc('b', 0)
nnoremap <silent> <Plug>IMAP_JumpForward i=IMAP_Jumpfunc('', 0)
map <silent> <F10> \rr
map <silent> <F8> :cnext
map <silent> <F7> :cprevious
inoremap <silent> 	 u=snipMate#TriggerSnippet()
imap <NL> <Plug>IMAP_JumpForward
inoremap <silent> 	 =snipMate#ShowAvailableSnips()
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set background=dark
set backspace=indent,eol,start
set clipboard=unnamedplus
set cmdheight=2
set confirm
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=de
set hidden
set hlsearch
set incsearch
set listchars=tab:���\ ,eol:¬
set mouse=a
set ruler
set runtimepath=~/.vim,~/.vim/bundle/c,~/.vim/bundle/colorschemes,~/.vim/bundle/mw-utils,~/.vim/bundle/nerdtree,~/.vim/bundle/snipmate,~/.vim/bundle/snipmate-snippets,~/.vim/bundle/tlib,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/usr/share/vim/vimfiles/after,~/.vim/bundle/snipmate/after,~/.vim/after
set showcmd
set spelllang=de
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg
set visualbell
set wildmenu
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd /data/Dokumente/uniHeidelberg/9Semester/C++_Practice/configuration/ConfigPage
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 main.cpp
badd +1 mainwindow.cpp
badd +1 mainwindow.h
badd +1 mainwindow.ui
badd +1 src/error.cpp
badd +1 src/parameter_return.cpp
badd +1 src/profile.cpp
badd +1 src/proxyModel.cpp
badd +1 src/setting.cpp
badd +1 inc/errorMsg.hpp
badd +1 inc/parameter_return.h
badd +1 inc/profile.h
badd +1 inc/proxyModel.h
badd +1 inc/setting.h
badd +1 src/ini_parser.cpp
badd +1 src/networkmanager.cpp
badd +38 src/nm_get_functions.cpp
badd +1 src/nm_make_file.cpp
badd +43 src/nm_check_functions.cpp
badd +1 src/set_permission.cpp
badd +1 src/remove_file.cpp
badd +1 src/nm_make_functions.cpp
badd +1 src/exec_cmd.cpp
badd +1 ../README
badd +1 setting.ini
badd +1 profiles/default_profile.ini
badd +1 inc/nm_make_file.h
badd +1 README
badd +1 setting/setting.ini
badd +1 mainwindow_profile.cpp
badd +1 src/mainwindow_profile.cpp
badd +1 src/mainwindow_nm_network_wlan.cpp
badd +1 src/test.cpp
badd +1 CMakeCache.txt
badd +1 CMakeLists.txt
badd +1 src/unitTest.cpp
badd +1 test/unitTest.cpp
badd +1 unitTest.h
badd +1 test/unitTest.h
badd +1 inc/set_permission.h
badd +1 src/custom_exceptions.cpp
badd +1 inc/custom_exceptions.h
badd +1 src/mainwindow_handle_custom_exceptions.cpp
badd +1 src/mainwindow_pictures.cpp
badd +1 src/mainwindow_picture.cpp
argglobal
silent! argdel *
argadd main.cpp
argadd mainwindow.cpp
argadd mainwindow.h
argadd mainwindow.ui
argadd src/error.cpp
argadd src/parameter_return.cpp
argadd src/profile.cpp
argadd src/proxyModel.cpp
argadd src/setting.cpp
set stal=2
edit main.cpp
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
edit main.cpp
let s:cpo_save=&cpo
set cpo&vim
imap <buffer> <silent> <S-F9> :call C_Arguments()
imap <buffer> <silent> <C-F9> :call C_Run()
imap <buffer> <silent> <F9> :call C_Link()
imap <buffer> <silent> <M-F9> :call C_Compile()
nmap <buffer> <silent> <NL> i=C_JumpCtrlJ()
vnoremap <buffer> /* s/*  */<Left><Left><Left>p
nnoremap <buffer> <silent> \c* :call C_CodeToCommentC()
nnoremap <buffer> <silent> \cc :call C_CodeToCommentCpp()
nnoremap <buffer> <silent> \co :call C_CommentToCode()
nnoremap <buffer> <silent> \cd :call C_InsertDateAndTime('d')
nnoremap <buffer> <silent> \ct :call C_InsertDateAndTime('dt')
nnoremap <buffer> <silent> \cx :call C_CommentToggle( )
nnoremap <buffer> <silent> \pi0 :call C_PPIf0("a")
nnoremap <buffer> <silent> \i0 :call C_CodeFor("up"    )
nnoremap <buffer> <silent> \in :call C_CodeFor("down"    )
nnoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
nnoremap <buffer> <silent> \np :call C_ProtoPick("function")
nnoremap <buffer> <silent> \nf :call C_ProtoPick("function")
nnoremap <buffer> <silent> \nm :call C_ProtoPick("method")
nmap <buffer> <silent> \rh :call C_Hardcopy()
vmap <buffer> <silent> \rh :call C_Hardcopy()
vnoremap <buffer> <silent> \nm :call C_ProtoPick("method")
vnoremap <buffer> <silent> \nf :call C_ProtoPick("function")
vnoremap <buffer> <silent> \np :call C_ProtoPick("function")
vnoremap <buffer> <silent> \nw :call C_CodeSnippet("wv")
vnoremap <buffer> <silent> \in :call C_CodeFor("down","v")
vnoremap <buffer> <silent> \i0 :call C_CodeFor("up","v")
vnoremap <buffer> <silent> \pi0 :call C_PPIf0("v")
vnoremap <buffer> <silent> \cx :call C_CommentToggle( )
vnoremap <buffer> <silent> \ct s:call C_InsertDateAndTime('dt')
vnoremap <buffer> <silent> \cd s:call C_InsertDateAndTime('d')
vnoremap <buffer> <silent> \co :call C_CommentToCode()
vnoremap <buffer> <silent> \cc :call C_CodeToCommentCpp()
vnoremap <buffer> <silent> \c* :call C_CodeToCommentC()
vnoremap <buffer> <silent> \sb :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.block","v")
nnoremap <buffer> <silent> \sb :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.block")
vnoremap <buffer> <silent> \sc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.case")
nnoremap <buffer> <silent> \sc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.case")
vnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while block","v")
nnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while block")
vnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while")
nnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while")
vnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.else block","v")
nnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.else block")
vnoremap <buffer> <silent> \sife :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block else","v")
nnoremap <buffer> <silent> \sife :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block else")
vnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if else","v")
nnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if else")
vnoremap <buffer> <silent> \sif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block","v")
nnoremap <buffer> <silent> \sif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block")
vnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if")
nnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if")
vnoremap <buffer> <silent> \sfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.range-based for","v")
nnoremap <buffer> <silent> \sfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.range-based for")
vnoremap <buffer> <silent> \sfo :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for block","v")
nnoremap <buffer> <silent> \sfo :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for block")
vnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for")
nnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for")
vnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.do while","v")
nnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.do while")
vnoremap <buffer> <silent> \pw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.warning")
nnoremap <buffer> <silent> \pw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.warning")
vnoremap <buffer> <silent> \pp :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.pragma")
nnoremap <buffer> <silent> \pp :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.pragma")
vnoremap <buffer> <silent> \pli :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.line")
nnoremap <buffer> <silent> \pli :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.line")
vnoremap <buffer> <silent> \pe :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.error")
nnoremap <buffer> <silent> \pe :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.error")
vnoremap <buffer> <silent> \pind :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-def-endif","v")
nnoremap <buffer> <silent> \pind :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-def-endif")
vnoremap <buffer> <silent> \pin :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-else-endif","v")
nnoremap <buffer> <silent> \pin :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-else-endif")
vnoremap <buffer> <silent> \pid :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifdef-else-endif","v")
nnoremap <buffer> <silent> \pid :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifdef-else-endif")
vnoremap <buffer> <silent> \pie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-else-endif","v")
nnoremap <buffer> <silent> \pie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-else-endif")
vnoremap <buffer> <silent> \pif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-endif","v")
nnoremap <buffer> <silent> \pif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-endif")
vnoremap <buffer> <silent> \pu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.undefine")
nnoremap <buffer> <silent> \pu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.undefine")
vnoremap <buffer> <silent> \pd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.define")
nnoremap <buffer> <silent> \pd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.define")
vnoremap <buffer> <silent> \pl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-local")
nnoremap <buffer> <silent> \pl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-local")
vnoremap <buffer> <silent> \pg :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-global")
nnoremap <buffer> <silent> \pg :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-global")
vnoremap <buffer> <silent> \pih :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include std lib header")
nnoremap <buffer> <silent> \pih :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include std lib header")
vnoremap <buffer> <silent> \ifpr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fscanf")
nnoremap <buffer> <silent> \ifpr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fscanf")
vnoremap <buffer> <silent> \ifsc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fprintf")
nnoremap <buffer> <silent> \ifsc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fprintf")
vnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-output-file","v")
nnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-output-file")
vnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-input-file","v")
nnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-input-file")
vnoremap <buffer> <silent> \ias :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.assert","v")
nnoremap <buffer> <silent> \ias :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.assert")
vnoremap <buffer> <silent> \isi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.sizeof","v")
nnoremap <buffer> <silent> \isi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.sizeof")
vnoremap <buffer> <silent> \ire :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.realloc")
nnoremap <buffer> <silent> \ire :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.realloc")
vnoremap <buffer> <silent> \ima :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.malloc")
nnoremap <buffer> <silent> \ima :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.malloc")
vnoremap <buffer> <silent> \ica :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.calloc")
nnoremap <buffer> <silent> \ica :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.calloc")
vnoremap <buffer> <silent> \ipr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.printf")
nnoremap <buffer> <silent> \ipr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.printf")
vnoremap <buffer> <silent> \isc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.scanf")
nnoremap <buffer> <silent> \isc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.scanf")
vnoremap <buffer> <silent> \iu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.union","v")
nnoremap <buffer> <silent> \iu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.union")
vnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.struct","v")
nnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.struct")
vnoremap <buffer> <silent> \ie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.enum","v")
nnoremap <buffer> <silent> \ie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.enum")
vnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.main","v")
nnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.main")
vnoremap <buffer> <silent> \isf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function-static","v")
nnoremap <buffer> <silent> \isf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function-static")
vnoremap <buffer> <silent> \if :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function","v")
nnoremap <buffer> <silent> \if :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function")
vnoremap <buffer> <silent> \+rt :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.RTTI","v")
nnoremap <buffer> <silent> \+rt :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.RTTI")
vnoremap <buffer> <silent> \+na :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace alias")
nnoremap <buffer> <silent> \+na :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace alias")
vnoremap <buffer> <silent> \+unb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace block xxx","v")
nnoremap <buffer> <silent> \+unb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace block xxx")
vnoremap <buffer> <silent> \+un :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace xxx")
nnoremap <buffer> <silent> \+un :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace xxx")
vnoremap <buffer> <silent> \+uns :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace std")
nnoremap <buffer> <silent> \+uns :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace std")
vnoremap <buffer> <silent> \+oof :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open output file","v")
nnoremap <buffer> <silent> \+oof :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open output file")
vnoremap <buffer> <silent> \+oif :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open input file","v")
nnoremap <buffer> <silent> \+oif :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open input file")
vnoremap <buffer> <silent> \+ex :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.extern C","v")
nnoremap <buffer> <silent> \+ex :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.extern C")
vnoremap <buffer> <silent> \+caa :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch all","v")
nnoremap <buffer> <silent> \+caa :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch all")
vnoremap <buffer> <silent> \+ca :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch","v")
nnoremap <buffer> <silent> \+ca :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch")
vnoremap <buffer> <silent> \+tr :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.try catch","v")
nnoremap <buffer> <silent> \+tr :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.try catch")
vnoremap <buffer> <silent> \+ioi :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, in")
nnoremap <buffer> <silent> \+ioi :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, in")
vnoremap <buffer> <silent> \+ioo :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, out")
nnoremap <buffer> <silent> \+ioo :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, out")
vnoremap <buffer> <silent> \+tf :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template function")
nnoremap <buffer> <silent> \+tf :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template function")
vnoremap <buffer> <silent> \+ita :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template accessor")
nnoremap <buffer> <silent> \+ita :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template accessor")
vnoremap <buffer> <silent> \+itm :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template method")
nnoremap <buffer> <silent> \+itm :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template method")
vnoremap <buffer> <silent> \+itcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class using new")
nnoremap <buffer> <silent> \+itcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class using new")
vnoremap <buffer> <silent> \+itc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class")
nnoremap <buffer> <silent> \+itc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class")
vnoremap <buffer> <silent> \+ia :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.accessor")
nnoremap <buffer> <silent> \+ia :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.accessor")
vnoremap <buffer> <silent> \+im :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.method")
nnoremap <buffer> <silent> \+im :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.method")
vnoremap <buffer> <silent> \+icn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class using new")
nnoremap <buffer> <silent> \+icn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class using new")
vnoremap <buffer> <silent> \+ic :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class")
nnoremap <buffer> <silent> \+ic :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class")
vnoremap <buffer> <silent> \+ec :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.error class")
nnoremap <buffer> <silent> \+ec :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.error class")
vnoremap <buffer> <silent> \+tcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class using new")
nnoremap <buffer> <silent> \+tcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class using new")
vnoremap <buffer> <silent> \+tc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class")
nnoremap <buffer> <silent> \+tc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class")
vnoremap <buffer> <silent> \+cn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class using new")
nnoremap <buffer> <silent> \+cn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class using new")
vnoremap <buffer> <silent> \+c :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class")
nnoremap <buffer> <silent> \+c :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class")
vnoremap <buffer> <silent> \+fb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.ios flagbits")
nnoremap <buffer> <silent> \+fb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.ios flagbits")
vnoremap <buffer> <silent> \+om :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.output manipulators")
nnoremap <buffer> <silent> \+om :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.output manipulators")
vnoremap <buffer> <silent> \+ich :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C std lib header")
nnoremap <buffer> <silent> \+ich :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C std lib header")
vnoremap <buffer> <silent> \+ih :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C++ std lib header")
nnoremap <buffer> <silent> \+ih :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C++ std lib header")
vnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.macros")
nnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.macros")
vnoremap <buffer> <silent> \csc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.special comments")
nnoremap <buffer> <silent> \csc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.special comments")
vnoremap <buffer> <silent> \ckc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.keyword comments")
nnoremap <buffer> <silent> \ckc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.keyword comments")
vnoremap <buffer> <silent> \chs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.H file sections")
nnoremap <buffer> <silent> \chs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.H file sections")
vnoremap <buffer> <silent> \ccs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.C file sections")
nnoremap <buffer> <silent> \ccs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.C file sections")
vnoremap <buffer> <silent> \cfdh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description header")
nnoremap <buffer> <silent> \cfdh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description header")
vnoremap <buffer> <silent> \cfdi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description impl")
nnoremap <buffer> <silent> \cfdi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description impl")
vnoremap <buffer> <silent> \ccl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.class")
nnoremap <buffer> <silent> \ccl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.class")
vnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.method")
nnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.method")
vnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.function")
nnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.function")
vnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.frame")
nnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.frame")
vnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:C_Templates,"Snippets.jump tags")
nnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:C_Templates,"Snippets.jump tags")
map <buffer> <silent> \hm :call C_Help("m")
map <buffer> <silent> \hp :call C_HelpCsupport()
map <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call C_XtermSize()
map <buffer> <silent> \rs :call C_Settings()
omap <buffer> <silent> \rh :call C_Hardcopy()
map <buffer> <silent> \ri :call C_Indent()
map <buffer> <silent> \rccs :call C_CppcheckSeverityInput()
map <buffer> <silent> \rcc :call C_CppcheckCheck()
map <buffer> <silent> \rpa :call C_SplintArguments()
map <buffer> <silent> \rp :call C_SplintCheck()
map <buffer> <silent> \rma :call C_MakeArguments()
map <buffer> <silent> \rme :call C_ExeToRun()
map <buffer> <silent> \rmc :call C_MakeClean()
map <buffer> <silent> \rcm :call C_ChooseMakefile()
map <buffer> <silent> \rm :call C_Make()
map <buffer> <silent> \ra :call C_Arguments()
map <buffer> <silent> \rr :call C_Run()
map <buffer> <silent> \rl :call C_Link()
map <buffer> <silent> \rc :call C_Compile()
nnoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:C_Templates,"!pick")
nnoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:C_Templates,"reload","all")
nnoremap <buffer> <silent> \ntg :call mmtemplates#core#EditTemplateFiles(g:C_Templates,1)
nnoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:C_Templates,-1)
noremap <buffer> <silent> \ns :call C_ProtoShow()
noremap <buffer> <silent> \nc :call C_ProtoClear()
noremap <buffer> <silent> \ni :call C_ProtoInsert()
onoremap <buffer> <silent> \nm :call C_ProtoPick("method")
onoremap <buffer> <silent> \nf :call C_ProtoPick("function")
onoremap <buffer> <silent> \np :call C_ProtoPick("function")
noremap <buffer> <silent> \ne :call C_CodeSnippet("e")
onoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
noremap <buffer> <silent> \nv :call C_CodeSnippet("view")
noremap <buffer> <silent> \nr :call C_CodeSnippet("r")
onoremap <buffer> <silent> \in :call C_CodeFor("down"    )
onoremap <buffer> <silent> \i0 :call C_CodeFor("up"    )
noremap <buffer> <silent> \pr0 :call C_PPIf0Remove()
onoremap <buffer> <silent> \pi0 :call C_PPIf0("a")
onoremap <buffer> <silent> \cx :call C_CommentToggle( )
onoremap <buffer> <silent> \ct :call C_InsertDateAndTime('dt')
onoremap <buffer> <silent> \cd :call C_InsertDateAndTime('d')
onoremap <buffer> <silent> \co :call C_CommentToCode()
onoremap <buffer> <silent> \cc :call C_CodeToCommentCpp()
onoremap <buffer> <silent> \c* :call C_CodeToCommentC()
noremap <buffer> <silent> \cs :call C_GetLineEndCommCol()
vnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm()
nnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm()
noremap <buffer> <silent> \cl :call C_EndOfLineComment()
vnoremap <buffer> {
map <buffer> <silent> <S-F9> :call C_Arguments()
map <buffer> <silent> <C-F9> :call C_Run()
map <buffer> <silent> <F9> :call C_Link()
map <buffer> <silent> <M-F9> :call C_Compile()
imap <buffer> <silent> <NL> =C_JumpCtrlJ()
inoremap <buffer> /*
inoremap <buffer> /* /*  */<Left><Left><Left>
inoremap <buffer> <silent> \sb :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.block")
inoremap <buffer> <silent> \sc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.case")
inoremap <buffer> <silent> \ss :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.switch")
inoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while block")
inoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while")
inoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.else block")
inoremap <buffer> <silent> \sife :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block else")
inoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if else")
inoremap <buffer> <silent> \sif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block")
inoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if")
inoremap <buffer> <silent> \sfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.range-based for")
inoremap <buffer> <silent> \sfo :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for block")
inoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for")
inoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.do while")
inoremap <buffer> <silent> \pw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.warning")
inoremap <buffer> <silent> \pp :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.pragma")
inoremap <buffer> <silent> \pli :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.line")
inoremap <buffer> <silent> \pe :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.error")
inoremap <buffer> <silent> \pind :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-def-endif")
inoremap <buffer> <silent> \pin :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-else-endif")
inoremap <buffer> <silent> \pid :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifdef-else-endif")
inoremap <buffer> <silent> \pie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-else-endif")
inoremap <buffer> <silent> \pif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-endif")
inoremap <buffer> <silent> \pu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.undefine")
inoremap <buffer> <silent> \pd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.define")
inoremap <buffer> <silent> \pl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-local")
inoremap <buffer> <silent> \pg :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-global")
inoremap <buffer> <silent> \pih :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include std lib header")
inoremap <buffer> <silent> \ifpr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fscanf")
inoremap <buffer> <silent> \ifsc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fprintf")
inoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-output-file")
inoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-input-file")
inoremap <buffer> <silent> \ias :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.assert")
inoremap <buffer> <silent> \isi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.sizeof")
inoremap <buffer> <silent> \ire :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.realloc")
inoremap <buffer> <silent> \ima :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.malloc")
inoremap <buffer> <silent> \ica :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.calloc")
inoremap <buffer> <silent> \ipr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.printf")
inoremap <buffer> <silent> \isc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.scanf")
inoremap <buffer> <silent> \iu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.union")
inoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.struct")
inoremap <buffer> <silent> \ie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.enum")
inoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.main")
inoremap <buffer> <silent> \isf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function-static")
inoremap <buffer> <silent> \if :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function")
inoremap <buffer> <silent> \+rt :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.RTTI")
inoremap <buffer> <silent> \+na :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace alias")
inoremap <buffer> <silent> \+unb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace block xxx")
inoremap <buffer> <silent> \+un :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace xxx")
inoremap <buffer> <silent> \+uns :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace std")
inoremap <buffer> <silent> \+oof :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open output file")
inoremap <buffer> <silent> \+oif :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open input file")
inoremap <buffer> <silent> \+ex :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.extern C")
inoremap <buffer> <silent> \+caa :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch all")
inoremap <buffer> <silent> \+ca :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch")
inoremap <buffer> <silent> \+tr :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.try catch")
inoremap <buffer> <silent> \+ioi :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, in")
inoremap <buffer> <silent> \+ioo :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, out")
inoremap <buffer> <silent> \+tf :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template function")
inoremap <buffer> <silent> \+ita :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template accessor")
inoremap <buffer> <silent> \+itm :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template method")
inoremap <buffer> <silent> \+itcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class using new")
inoremap <buffer> <silent> \+itc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class")
inoremap <buffer> <silent> \+ia :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.accessor")
inoremap <buffer> <silent> \+im :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.method")
inoremap <buffer> <silent> \+icn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class using new")
inoremap <buffer> <silent> \+ic :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class")
inoremap <buffer> <silent> \+ec :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.error class")
inoremap <buffer> <silent> \+tcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class using new")
inoremap <buffer> <silent> \+tc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class")
inoremap <buffer> <silent> \+cn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class using new")
inoremap <buffer> <silent> \+c :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class")
inoremap <buffer> <silent> \+fb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.ios flagbits")
inoremap <buffer> <silent> \+om :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.output manipulators")
inoremap <buffer> <silent> \+ich :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C std lib header")
inoremap <buffer> <silent> \+ih :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C++ std lib header")
inoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.macros")
inoremap <buffer> <silent> \csc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.special comments")
inoremap <buffer> <silent> \ckc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.keyword comments")
inoremap <buffer> <silent> \chs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.H file sections")
inoremap <buffer> <silent> \ccs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.C file sections")
inoremap <buffer> <silent> \cfdh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description header")
inoremap <buffer> <silent> \cfdi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description impl")
inoremap <buffer> <silent> \ccl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.class")
inoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.method")
inoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.function")
inoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.frame")
inoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:C_Templates,"Snippets.jump tags")
imap <buffer> <silent> \hm :call C_Help("m")
imap <buffer> <silent> \hp :call C_HelpCsupport()
imap <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()
imap <buffer> <silent> \rx :call C_XtermSize()
imap <buffer> <silent> \rs :call C_Settings()
imap <buffer> <silent> \rh :call C_Hardcopy()
imap <buffer> <silent> \ri :call C_Indent()
imap <buffer> <silent> \rccs :call C_CppcheckSeverityInput()
imap <buffer> <silent> \rcc :call C_CppcheckCheck()
imap <buffer> <silent> \rpa :call C_SplintArguments()
imap <buffer> <silent> \rp :call C_SplintCheck()
imap <buffer> <silent> \rma :call C_MakeArguments()
imap <buffer> <silent> \rme :call C_ExeToRun()
imap <buffer> <silent> \rmc :call C_MakeClean()
imap <buffer> <silent> \rcm :call C_ChooseMakefile()
imap <buffer> <silent> \rm :call C_Make()
imap <buffer> <silent> \ra :call C_Arguments()
imap <buffer> <silent> \rr :call C_Run()
imap <buffer> <silent> \rl :call C_Link()
imap <buffer> <silent> \rc :call C_Compile()
inoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:C_Templates,"!pick")
inoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:C_Templates,"reload","all")
inoremap <buffer> <silent> \ntg :call mmtemplates#core#EditTemplateFiles(g:C_Templates,1)
inoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:C_Templates,-1)
inoremap <buffer> <silent> \ns :call C_ProtoShow()
inoremap <buffer> <silent> \nc :call C_ProtoClear()
inoremap <buffer> <silent> \ni :call C_ProtoInsert()
inoremap <buffer> <silent> \nm :call C_ProtoPick("method")
inoremap <buffer> <silent> \nf :call C_ProtoPick("function")
inoremap <buffer> <silent> \np :call C_ProtoPick("function")
inoremap <buffer> <silent> \ne :call C_CodeSnippet("e")
inoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
inoremap <buffer> <silent> \nv :call C_CodeSnippet("view")
inoremap <buffer> <silent> \nr :call C_CodeSnippet("r")
inoremap <buffer> <silent> \in :call C_CodeFor("down"    )
inoremap <buffer> <silent> \i0 :call C_CodeFor("up"    )
inoremap <buffer> <silent> \pr0 :call C_PPIf0Remove()
inoremap <buffer> <silent> \pi0 :call C_PPIf0("a")
inoremap <buffer> <silent> \cx :call C_CommentToggle( )
inoremap <buffer> <silent> \ct :call C_InsertDateAndTime('dt')
inoremap <buffer> <silent> \cd :call C_InsertDateAndTime('d')
inoremap <buffer> <silent> \cj :call C_AdjustLineEndComm()
inoremap <buffer> <silent> \cl :call C_EndOfLineComment()
inoremap <buffer> {
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=:0,l1,t0,g0
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=/usr/share/vim/vimfiles/c-support/wordlists/c-c++-keywords.list,/usr/share/vim/vimfiles/c-support/wordlists/k+r.list,/usr/share/vim/vimfiles/c-support/wordlists/stl_index.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'cpp'
setlocal filetype=cpp
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=ncroql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=ccomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=de
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'cpp'
setlocal syntax=cpp
endif
setlocal tabstop=8
setlocal tagcase=
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit mainwindow.cpp
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
2argu
let s:cpo_save=&cpo
set cpo&vim
imap <buffer> <silent> <S-F9> :call C_Arguments()
imap <buffer> <silent> <C-F9> :call C_Run()
imap <buffer> <silent> <F9> :call C_Link()
imap <buffer> <silent> <M-F9> :call C_Compile()
nmap <buffer> <silent> <NL> i=C_JumpCtrlJ()
vnoremap <buffer> /* s/*  */<Left><Left><Left>p
nnoremap <buffer> <silent> \c* :call C_CodeToCommentC()
nnoremap <buffer> <silent> \cc :call C_CodeToCommentCpp()
nnoremap <buffer> <silent> \co :call C_CommentToCode()
nnoremap <buffer> <silent> \cd :call C_InsertDateAndTime('d')
nnoremap <buffer> <silent> \ct :call C_InsertDateAndTime('dt')
nnoremap <buffer> <silent> \cx :call C_CommentToggle( )
nnoremap <buffer> <silent> \pi0 :call C_PPIf0("a")
nnoremap <buffer> <silent> \i0 :call C_CodeFor("up"    )
nnoremap <buffer> <silent> \in :call C_CodeFor("down"    )
nnoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
nnoremap <buffer> <silent> \np :call C_ProtoPick("function")
nnoremap <buffer> <silent> \nf :call C_ProtoPick("function")
nnoremap <buffer> <silent> \nm :call C_ProtoPick("method")
nmap <buffer> <silent> \rh :call C_Hardcopy()
vmap <buffer> <silent> \rh :call C_Hardcopy()
vnoremap <buffer> <silent> \nm :call C_ProtoPick("method")
vnoremap <buffer> <silent> \nf :call C_ProtoPick("function")
vnoremap <buffer> <silent> \np :call C_ProtoPick("function")
vnoremap <buffer> <silent> \nw :call C_CodeSnippet("wv")
vnoremap <buffer> <silent> \in :call C_CodeFor("down","v")
vnoremap <buffer> <silent> \i0 :call C_CodeFor("up","v")
vnoremap <buffer> <silent> \pi0 :call C_PPIf0("v")
vnoremap <buffer> <silent> \cx :call C_CommentToggle( )
vnoremap <buffer> <silent> \ct s:call C_InsertDateAndTime('dt')
vnoremap <buffer> <silent> \cd s:call C_InsertDateAndTime('d')
vnoremap <buffer> <silent> \co :call C_CommentToCode()
vnoremap <buffer> <silent> \cc :call C_CodeToCommentCpp()
vnoremap <buffer> <silent> \c* :call C_CodeToCommentC()
vnoremap <buffer> <silent> \sb :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.block","v")
nnoremap <buffer> <silent> \sb :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.block")
vnoremap <buffer> <silent> \sc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.case")
nnoremap <buffer> <silent> \sc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.case")
vnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while block","v")
nnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while block")
vnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while")
nnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while")
vnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.else block","v")
nnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.else block")
vnoremap <buffer> <silent> \sife :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block else","v")
nnoremap <buffer> <silent> \sife :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block else")
vnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if else","v")
nnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if else")
vnoremap <buffer> <silent> \sif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block","v")
nnoremap <buffer> <silent> \sif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block")
vnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if")
nnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if")
vnoremap <buffer> <silent> \sfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.range-based for","v")
nnoremap <buffer> <silent> \sfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.range-based for")
vnoremap <buffer> <silent> \sfo :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for block","v")
nnoremap <buffer> <silent> \sfo :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for block")
vnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for")
nnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for")
vnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.do while","v")
nnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.do while")
vnoremap <buffer> <silent> \pw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.warning")
nnoremap <buffer> <silent> \pw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.warning")
vnoremap <buffer> <silent> \pp :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.pragma")
nnoremap <buffer> <silent> \pp :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.pragma")
vnoremap <buffer> <silent> \pli :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.line")
nnoremap <buffer> <silent> \pli :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.line")
vnoremap <buffer> <silent> \pe :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.error")
nnoremap <buffer> <silent> \pe :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.error")
vnoremap <buffer> <silent> \pind :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-def-endif","v")
nnoremap <buffer> <silent> \pind :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-def-endif")
vnoremap <buffer> <silent> \pin :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-else-endif","v")
nnoremap <buffer> <silent> \pin :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-else-endif")
vnoremap <buffer> <silent> \pid :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifdef-else-endif","v")
nnoremap <buffer> <silent> \pid :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifdef-else-endif")
vnoremap <buffer> <silent> \pie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-else-endif","v")
nnoremap <buffer> <silent> \pie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-else-endif")
vnoremap <buffer> <silent> \pif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-endif","v")
nnoremap <buffer> <silent> \pif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-endif")
vnoremap <buffer> <silent> \pu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.undefine")
nnoremap <buffer> <silent> \pu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.undefine")
vnoremap <buffer> <silent> \pd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.define")
nnoremap <buffer> <silent> \pd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.define")
vnoremap <buffer> <silent> \pl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-local")
nnoremap <buffer> <silent> \pl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-local")
vnoremap <buffer> <silent> \pg :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-global")
nnoremap <buffer> <silent> \pg :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-global")
vnoremap <buffer> <silent> \pih :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include std lib header")
nnoremap <buffer> <silent> \pih :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include std lib header")
vnoremap <buffer> <silent> \ifpr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fscanf")
nnoremap <buffer> <silent> \ifpr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fscanf")
vnoremap <buffer> <silent> \ifsc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fprintf")
nnoremap <buffer> <silent> \ifsc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fprintf")
vnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-output-file","v")
nnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-output-file")
vnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-input-file","v")
nnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-input-file")
vnoremap <buffer> <silent> \ias :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.assert","v")
nnoremap <buffer> <silent> \ias :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.assert")
vnoremap <buffer> <silent> \isi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.sizeof","v")
nnoremap <buffer> <silent> \isi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.sizeof")
vnoremap <buffer> <silent> \ire :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.realloc")
nnoremap <buffer> <silent> \ire :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.realloc")
vnoremap <buffer> <silent> \ima :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.malloc")
nnoremap <buffer> <silent> \ima :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.malloc")
vnoremap <buffer> <silent> \ica :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.calloc")
nnoremap <buffer> <silent> \ica :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.calloc")
vnoremap <buffer> <silent> \ipr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.printf")
nnoremap <buffer> <silent> \ipr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.printf")
vnoremap <buffer> <silent> \isc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.scanf")
nnoremap <buffer> <silent> \isc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.scanf")
vnoremap <buffer> <silent> \iu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.union","v")
nnoremap <buffer> <silent> \iu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.union")
vnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.struct","v")
nnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.struct")
vnoremap <buffer> <silent> \ie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.enum","v")
nnoremap <buffer> <silent> \ie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.enum")
vnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.main","v")
nnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.main")
vnoremap <buffer> <silent> \isf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function-static","v")
nnoremap <buffer> <silent> \isf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function-static")
vnoremap <buffer> <silent> \if :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function","v")
nnoremap <buffer> <silent> \if :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function")
vnoremap <buffer> <silent> \+rt :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.RTTI","v")
nnoremap <buffer> <silent> \+rt :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.RTTI")
vnoremap <buffer> <silent> \+na :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace alias")
nnoremap <buffer> <silent> \+na :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace alias")
vnoremap <buffer> <silent> \+unb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace block xxx","v")
nnoremap <buffer> <silent> \+unb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace block xxx")
vnoremap <buffer> <silent> \+un :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace xxx")
nnoremap <buffer> <silent> \+un :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace xxx")
vnoremap <buffer> <silent> \+uns :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace std")
nnoremap <buffer> <silent> \+uns :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace std")
vnoremap <buffer> <silent> \+oof :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open output file","v")
nnoremap <buffer> <silent> \+oof :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open output file")
vnoremap <buffer> <silent> \+oif :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open input file","v")
nnoremap <buffer> <silent> \+oif :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open input file")
vnoremap <buffer> <silent> \+ex :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.extern C","v")
nnoremap <buffer> <silent> \+ex :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.extern C")
vnoremap <buffer> <silent> \+caa :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch all","v")
nnoremap <buffer> <silent> \+caa :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch all")
vnoremap <buffer> <silent> \+ca :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch","v")
nnoremap <buffer> <silent> \+ca :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch")
vnoremap <buffer> <silent> \+tr :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.try catch","v")
nnoremap <buffer> <silent> \+tr :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.try catch")
vnoremap <buffer> <silent> \+ioi :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, in")
nnoremap <buffer> <silent> \+ioi :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, in")
vnoremap <buffer> <silent> \+ioo :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, out")
nnoremap <buffer> <silent> \+ioo :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, out")
vnoremap <buffer> <silent> \+tf :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template function")
nnoremap <buffer> <silent> \+tf :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template function")
vnoremap <buffer> <silent> \+ita :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template accessor")
nnoremap <buffer> <silent> \+ita :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template accessor")
vnoremap <buffer> <silent> \+itm :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template method")
nnoremap <buffer> <silent> \+itm :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template method")
vnoremap <buffer> <silent> \+itcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class using new")
nnoremap <buffer> <silent> \+itcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class using new")
vnoremap <buffer> <silent> \+itc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class")
nnoremap <buffer> <silent> \+itc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class")
vnoremap <buffer> <silent> \+ia :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.accessor")
nnoremap <buffer> <silent> \+ia :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.accessor")
vnoremap <buffer> <silent> \+im :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.method")
nnoremap <buffer> <silent> \+im :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.method")
vnoremap <buffer> <silent> \+icn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class using new")
nnoremap <buffer> <silent> \+icn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class using new")
vnoremap <buffer> <silent> \+ic :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class")
nnoremap <buffer> <silent> \+ic :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class")
vnoremap <buffer> <silent> \+ec :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.error class")
nnoremap <buffer> <silent> \+ec :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.error class")
vnoremap <buffer> <silent> \+tcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class using new")
nnoremap <buffer> <silent> \+tcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class using new")
vnoremap <buffer> <silent> \+tc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class")
nnoremap <buffer> <silent> \+tc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class")
vnoremap <buffer> <silent> \+cn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class using new")
nnoremap <buffer> <silent> \+cn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class using new")
vnoremap <buffer> <silent> \+c :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class")
nnoremap <buffer> <silent> \+c :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class")
vnoremap <buffer> <silent> \+fb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.ios flagbits")
nnoremap <buffer> <silent> \+fb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.ios flagbits")
vnoremap <buffer> <silent> \+om :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.output manipulators")
nnoremap <buffer> <silent> \+om :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.output manipulators")
vnoremap <buffer> <silent> \+ich :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C std lib header")
nnoremap <buffer> <silent> \+ich :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C std lib header")
vnoremap <buffer> <silent> \+ih :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C++ std lib header")
nnoremap <buffer> <silent> \+ih :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C++ std lib header")
vnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.macros")
nnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.macros")
vnoremap <buffer> <silent> \csc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.special comments")
nnoremap <buffer> <silent> \csc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.special comments")
vnoremap <buffer> <silent> \ckc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.keyword comments")
nnoremap <buffer> <silent> \ckc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.keyword comments")
vnoremap <buffer> <silent> \chs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.H file sections")
nnoremap <buffer> <silent> \chs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.H file sections")
vnoremap <buffer> <silent> \ccs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.C file sections")
nnoremap <buffer> <silent> \ccs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.C file sections")
vnoremap <buffer> <silent> \cfdh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description header")
nnoremap <buffer> <silent> \cfdh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description header")
vnoremap <buffer> <silent> \cfdi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description impl")
nnoremap <buffer> <silent> \cfdi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description impl")
vnoremap <buffer> <silent> \ccl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.class")
nnoremap <buffer> <silent> \ccl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.class")
vnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.method")
nnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.method")
vnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.function")
nnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.function")
vnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.frame")
nnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.frame")
vnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:C_Templates,"Snippets.jump tags")
nnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:C_Templates,"Snippets.jump tags")
map <buffer> <silent> \hm :call C_Help("m")
map <buffer> <silent> \hp :call C_HelpCsupport()
map <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call C_XtermSize()
map <buffer> <silent> \rs :call C_Settings()
omap <buffer> <silent> \rh :call C_Hardcopy()
map <buffer> <silent> \ri :call C_Indent()
map <buffer> <silent> \rccs :call C_CppcheckSeverityInput()
map <buffer> <silent> \rcc :call C_CppcheckCheck()
map <buffer> <silent> \rpa :call C_SplintArguments()
map <buffer> <silent> \rp :call C_SplintCheck()
map <buffer> <silent> \rma :call C_MakeArguments()
map <buffer> <silent> \rme :call C_ExeToRun()
map <buffer> <silent> \rmc :call C_MakeClean()
map <buffer> <silent> \rcm :call C_ChooseMakefile()
map <buffer> <silent> \rm :call C_Make()
map <buffer> <silent> \ra :call C_Arguments()
map <buffer> <silent> \rr :call C_Run()
map <buffer> <silent> \rl :call C_Link()
map <buffer> <silent> \rc :call C_Compile()
nnoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:C_Templates,"!pick")
nnoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:C_Templates,"reload","all")
nnoremap <buffer> <silent> \ntg :call mmtemplates#core#EditTemplateFiles(g:C_Templates,1)
nnoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:C_Templates,-1)
noremap <buffer> <silent> \ns :call C_ProtoShow()
noremap <buffer> <silent> \nc :call C_ProtoClear()
noremap <buffer> <silent> \ni :call C_ProtoInsert()
onoremap <buffer> <silent> \nm :call C_ProtoPick("method")
onoremap <buffer> <silent> \nf :call C_ProtoPick("function")
onoremap <buffer> <silent> \np :call C_ProtoPick("function")
noremap <buffer> <silent> \ne :call C_CodeSnippet("e")
onoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
noremap <buffer> <silent> \nv :call C_CodeSnippet("view")
noremap <buffer> <silent> \nr :call C_CodeSnippet("r")
onoremap <buffer> <silent> \in :call C_CodeFor("down"    )
onoremap <buffer> <silent> \i0 :call C_CodeFor("up"    )
noremap <buffer> <silent> \pr0 :call C_PPIf0Remove()
onoremap <buffer> <silent> \pi0 :call C_PPIf0("a")
onoremap <buffer> <silent> \cx :call C_CommentToggle( )
onoremap <buffer> <silent> \ct :call C_InsertDateAndTime('dt')
onoremap <buffer> <silent> \cd :call C_InsertDateAndTime('d')
onoremap <buffer> <silent> \co :call C_CommentToCode()
onoremap <buffer> <silent> \cc :call C_CodeToCommentCpp()
onoremap <buffer> <silent> \c* :call C_CodeToCommentC()
noremap <buffer> <silent> \cs :call C_GetLineEndCommCol()
vnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm()
nnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm()
noremap <buffer> <silent> \cl :call C_EndOfLineComment()
vnoremap <buffer> {
map <buffer> <silent> <S-F9> :call C_Arguments()
map <buffer> <silent> <C-F9> :call C_Run()
map <buffer> <silent> <F9> :call C_Link()
map <buffer> <silent> <M-F9> :call C_Compile()
imap <buffer> <silent> <NL> =C_JumpCtrlJ()
inoremap <buffer> /*
inoremap <buffer> /* /*  */<Left><Left><Left>
inoremap <buffer> <silent> \sb :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.block")
inoremap <buffer> <silent> \sc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.case")
inoremap <buffer> <silent> \ss :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.switch")
inoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while block")
inoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while")
inoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.else block")
inoremap <buffer> <silent> \sife :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block else")
inoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if else")
inoremap <buffer> <silent> \sif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block")
inoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if")
inoremap <buffer> <silent> \sfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.range-based for")
inoremap <buffer> <silent> \sfo :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for block")
inoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for")
inoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.do while")
inoremap <buffer> <silent> \pw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.warning")
inoremap <buffer> <silent> \pp :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.pragma")
inoremap <buffer> <silent> \pli :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.line")
inoremap <buffer> <silent> \pe :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.error")
inoremap <buffer> <silent> \pind :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-def-endif")
inoremap <buffer> <silent> \pin :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-else-endif")
inoremap <buffer> <silent> \pid :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifdef-else-endif")
inoremap <buffer> <silent> \pie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-else-endif")
inoremap <buffer> <silent> \pif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-endif")
inoremap <buffer> <silent> \pu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.undefine")
inoremap <buffer> <silent> \pd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.define")
inoremap <buffer> <silent> \pl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-local")
inoremap <buffer> <silent> \pg :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-global")
inoremap <buffer> <silent> \pih :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include std lib header")
inoremap <buffer> <silent> \ifpr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fscanf")
inoremap <buffer> <silent> \ifsc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fprintf")
inoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-output-file")
inoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-input-file")
inoremap <buffer> <silent> \ias :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.assert")
inoremap <buffer> <silent> \isi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.sizeof")
inoremap <buffer> <silent> \ire :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.realloc")
inoremap <buffer> <silent> \ima :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.malloc")
inoremap <buffer> <silent> \ica :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.calloc")
inoremap <buffer> <silent> \ipr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.printf")
inoremap <buffer> <silent> \isc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.scanf")
inoremap <buffer> <silent> \iu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.union")
inoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.struct")
inoremap <buffer> <silent> \ie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.enum")
inoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.main")
inoremap <buffer> <silent> \isf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function-static")
inoremap <buffer> <silent> \if :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function")
inoremap <buffer> <silent> \+rt :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.RTTI")
inoremap <buffer> <silent> \+na :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace alias")
inoremap <buffer> <silent> \+unb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace block xxx")
inoremap <buffer> <silent> \+un :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace xxx")
inoremap <buffer> <silent> \+uns :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace std")
inoremap <buffer> <silent> \+oof :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open output file")
inoremap <buffer> <silent> \+oif :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open input file")
inoremap <buffer> <silent> \+ex :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.extern C")
inoremap <buffer> <silent> \+caa :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch all")
inoremap <buffer> <silent> \+ca :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch")
inoremap <buffer> <silent> \+tr :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.try catch")
inoremap <buffer> <silent> \+ioi :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, in")
inoremap <buffer> <silent> \+ioo :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, out")
inoremap <buffer> <silent> \+tf :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template function")
inoremap <buffer> <silent> \+ita :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template accessor")
inoremap <buffer> <silent> \+itm :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template method")
inoremap <buffer> <silent> \+itcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class using new")
inoremap <buffer> <silent> \+itc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class")
inoremap <buffer> <silent> \+ia :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.accessor")
inoremap <buffer> <silent> \+im :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.method")
inoremap <buffer> <silent> \+icn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class using new")
inoremap <buffer> <silent> \+ic :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class")
inoremap <buffer> <silent> \+ec :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.error class")
inoremap <buffer> <silent> \+tcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class using new")
inoremap <buffer> <silent> \+tc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class")
inoremap <buffer> <silent> \+cn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class using new")
inoremap <buffer> <silent> \+c :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class")
inoremap <buffer> <silent> \+fb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.ios flagbits")
inoremap <buffer> <silent> \+om :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.output manipulators")
inoremap <buffer> <silent> \+ich :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C std lib header")
inoremap <buffer> <silent> \+ih :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C++ std lib header")
inoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.macros")
inoremap <buffer> <silent> \csc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.special comments")
inoremap <buffer> <silent> \ckc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.keyword comments")
inoremap <buffer> <silent> \chs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.H file sections")
inoremap <buffer> <silent> \ccs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.C file sections")
inoremap <buffer> <silent> \cfdh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description header")
inoremap <buffer> <silent> \cfdi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description impl")
inoremap <buffer> <silent> \ccl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.class")
inoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.method")
inoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.function")
inoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.frame")
inoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:C_Templates,"Snippets.jump tags")
imap <buffer> <silent> \hm :call C_Help("m")
imap <buffer> <silent> \hp :call C_HelpCsupport()
imap <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()
imap <buffer> <silent> \rx :call C_XtermSize()
imap <buffer> <silent> \rs :call C_Settings()
imap <buffer> <silent> \rh :call C_Hardcopy()
imap <buffer> <silent> \ri :call C_Indent()
imap <buffer> <silent> \rccs :call C_CppcheckSeverityInput()
imap <buffer> <silent> \rcc :call C_CppcheckCheck()
imap <buffer> <silent> \rpa :call C_SplintArguments()
imap <buffer> <silent> \rp :call C_SplintCheck()
imap <buffer> <silent> \rma :call C_MakeArguments()
imap <buffer> <silent> \rme :call C_ExeToRun()
imap <buffer> <silent> \rmc :call C_MakeClean()
imap <buffer> <silent> \rcm :call C_ChooseMakefile()
imap <buffer> <silent> \rm :call C_Make()
imap <buffer> <silent> \ra :call C_Arguments()
imap <buffer> <silent> \rr :call C_Run()
imap <buffer> <silent> \rl :call C_Link()
imap <buffer> <silent> \rc :call C_Compile()
inoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:C_Templates,"!pick")
inoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:C_Templates,"reload","all")
inoremap <buffer> <silent> \ntg :call mmtemplates#core#EditTemplateFiles(g:C_Templates,1)
inoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:C_Templates,-1)
inoremap <buffer> <silent> \ns :call C_ProtoShow()
inoremap <buffer> <silent> \nc :call C_ProtoClear()
inoremap <buffer> <silent> \ni :call C_ProtoInsert()
inoremap <buffer> <silent> \nm :call C_ProtoPick("method")
inoremap <buffer> <silent> \nf :call C_ProtoPick("function")
inoremap <buffer> <silent> \np :call C_ProtoPick("function")
inoremap <buffer> <silent> \ne :call C_CodeSnippet("e")
inoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
inoremap <buffer> <silent> \nv :call C_CodeSnippet("view")
inoremap <buffer> <silent> \nr :call C_CodeSnippet("r")
inoremap <buffer> <silent> \in :call C_CodeFor("down"    )
inoremap <buffer> <silent> \i0 :call C_CodeFor("up"    )
inoremap <buffer> <silent> \pr0 :call C_PPIf0Remove()
inoremap <buffer> <silent> \pi0 :call C_PPIf0("a")
inoremap <buffer> <silent> \cx :call C_CommentToggle( )
inoremap <buffer> <silent> \ct :call C_InsertDateAndTime('dt')
inoremap <buffer> <silent> \cd :call C_InsertDateAndTime('d')
inoremap <buffer> <silent> \cj :call C_AdjustLineEndComm()
inoremap <buffer> <silent> \cl :call C_EndOfLineComment()
inoremap <buffer> {
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=/usr/share/vim/vimfiles/c-support/wordlists/c-c++-keywords.list,/usr/share/vim/vimfiles/c-support/wordlists/k+r.list,/usr/share/vim/vimfiles/c-support/wordlists/stl_index.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'cpp'
setlocal filetype=cpp
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=ccomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=de
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'cpp'
setlocal syntax=cpp
endif
setlocal tabstop=8
setlocal tagcase=
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 395 - ((20 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
395
normal! 078|
tabedit mainwindow.h
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
edit mainwindow.h
let s:cpo_save=&cpo
set cpo&vim
imap <buffer> <silent> <S-F9> :call C_Arguments()
imap <buffer> <silent> <C-F9> :call C_Run()
imap <buffer> <silent> <F9> :call C_Link()
imap <buffer> <silent> <M-F9> :call C_Compile()
nmap <buffer> <silent> <NL> i=C_JumpCtrlJ()
vnoremap <buffer> /* s/*  */<Left><Left><Left>p
nnoremap <buffer> <silent> \c* :call C_CodeToCommentC()
nnoremap <buffer> <silent> \cc :call C_CodeToCommentCpp()
nnoremap <buffer> <silent> \co :call C_CommentToCode()
nnoremap <buffer> <silent> \cd :call C_InsertDateAndTime('d')
nnoremap <buffer> <silent> \ct :call C_InsertDateAndTime('dt')
nnoremap <buffer> <silent> \cx :call C_CommentToggle( )
nnoremap <buffer> <silent> \pi0 :call C_PPIf0("a")
nnoremap <buffer> <silent> \i0 :call C_CodeFor("up"    )
nnoremap <buffer> <silent> \in :call C_CodeFor("down"    )
nnoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
nnoremap <buffer> <silent> \np :call C_ProtoPick("function")
nnoremap <buffer> <silent> \nf :call C_ProtoPick("function")
nnoremap <buffer> <silent> \nm :call C_ProtoPick("method")
nmap <buffer> <silent> \rh :call C_Hardcopy()
vmap <buffer> <silent> \rh :call C_Hardcopy()
vnoremap <buffer> <silent> \nm :call C_ProtoPick("method")
vnoremap <buffer> <silent> \nf :call C_ProtoPick("function")
vnoremap <buffer> <silent> \np :call C_ProtoPick("function")
vnoremap <buffer> <silent> \nw :call C_CodeSnippet("wv")
vnoremap <buffer> <silent> \in :call C_CodeFor("down","v")
vnoremap <buffer> <silent> \i0 :call C_CodeFor("up","v")
vnoremap <buffer> <silent> \pi0 :call C_PPIf0("v")
vnoremap <buffer> <silent> \cx :call C_CommentToggle( )
vnoremap <buffer> <silent> \ct s:call C_InsertDateAndTime('dt')
vnoremap <buffer> <silent> \cd s:call C_InsertDateAndTime('d')
vnoremap <buffer> <silent> \co :call C_CommentToCode()
vnoremap <buffer> <silent> \cc :call C_CodeToCommentCpp()
vnoremap <buffer> <silent> \c* :call C_CodeToCommentC()
vnoremap <buffer> <silent> \sb :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.block","v")
nnoremap <buffer> <silent> \sb :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.block")
vnoremap <buffer> <silent> \sc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.case")
nnoremap <buffer> <silent> \sc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.case")
vnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while block","v")
nnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while block")
vnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while")
nnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while")
vnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.else block","v")
nnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.else block")
vnoremap <buffer> <silent> \sife :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block else","v")
nnoremap <buffer> <silent> \sife :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block else")
vnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if else","v")
nnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if else")
vnoremap <buffer> <silent> \sif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block","v")
nnoremap <buffer> <silent> \sif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block")
vnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if")
nnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if")
vnoremap <buffer> <silent> \sfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.range-based for","v")
nnoremap <buffer> <silent> \sfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.range-based for")
vnoremap <buffer> <silent> \sfo :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for block","v")
nnoremap <buffer> <silent> \sfo :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for block")
vnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for")
nnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for")
vnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.do while","v")
nnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.do while")
vnoremap <buffer> <silent> \pw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.warning")
nnoremap <buffer> <silent> \pw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.warning")
vnoremap <buffer> <silent> \pp :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.pragma")
nnoremap <buffer> <silent> \pp :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.pragma")
vnoremap <buffer> <silent> \pli :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.line")
nnoremap <buffer> <silent> \pli :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.line")
vnoremap <buffer> <silent> \pe :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.error")
nnoremap <buffer> <silent> \pe :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.error")
vnoremap <buffer> <silent> \pind :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-def-endif","v")
nnoremap <buffer> <silent> \pind :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-def-endif")
vnoremap <buffer> <silent> \pin :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-else-endif","v")
nnoremap <buffer> <silent> \pin :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-else-endif")
vnoremap <buffer> <silent> \pid :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifdef-else-endif","v")
nnoremap <buffer> <silent> \pid :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifdef-else-endif")
vnoremap <buffer> <silent> \pie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-else-endif","v")
nnoremap <buffer> <silent> \pie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-else-endif")
vnoremap <buffer> <silent> \pif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-endif","v")
nnoremap <buffer> <silent> \pif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-endif")
vnoremap <buffer> <silent> \pu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.undefine")
nnoremap <buffer> <silent> \pu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.undefine")
vnoremap <buffer> <silent> \pd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.define")
nnoremap <buffer> <silent> \pd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.define")
vnoremap <buffer> <silent> \pl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-local")
nnoremap <buffer> <silent> \pl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-local")
vnoremap <buffer> <silent> \pg :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-global")
nnoremap <buffer> <silent> \pg :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-global")
vnoremap <buffer> <silent> \pih :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include std lib header")
nnoremap <buffer> <silent> \pih :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include std lib header")
vnoremap <buffer> <silent> \ifpr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fscanf")
nnoremap <buffer> <silent> \ifpr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fscanf")
vnoremap <buffer> <silent> \ifsc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fprintf")
nnoremap <buffer> <silent> \ifsc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fprintf")
vnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-output-file","v")
nnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-output-file")
vnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-input-file","v")
nnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-input-file")
vnoremap <buffer> <silent> \ias :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.assert","v")
nnoremap <buffer> <silent> \ias :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.assert")
vnoremap <buffer> <silent> \isi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.sizeof","v")
nnoremap <buffer> <silent> \isi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.sizeof")
vnoremap <buffer> <silent> \ire :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.realloc")
nnoremap <buffer> <silent> \ire :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.realloc")
vnoremap <buffer> <silent> \ima :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.malloc")
nnoremap <buffer> <silent> \ima :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.malloc")
vnoremap <buffer> <silent> \ica :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.calloc")
nnoremap <buffer> <silent> \ica :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.calloc")
vnoremap <buffer> <silent> \ipr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.printf")
nnoremap <buffer> <silent> \ipr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.printf")
vnoremap <buffer> <silent> \isc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.scanf")
nnoremap <buffer> <silent> \isc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.scanf")
vnoremap <buffer> <silent> \iu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.union","v")
nnoremap <buffer> <silent> \iu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.union")
vnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.struct","v")
nnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.struct")
vnoremap <buffer> <silent> \ie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.enum","v")
nnoremap <buffer> <silent> \ie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.enum")
vnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.main","v")
nnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.main")
vnoremap <buffer> <silent> \isf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function-static","v")
nnoremap <buffer> <silent> \isf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function-static")
vnoremap <buffer> <silent> \if :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function","v")
nnoremap <buffer> <silent> \if :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function")
vnoremap <buffer> <silent> \+rt :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.RTTI","v")
nnoremap <buffer> <silent> \+rt :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.RTTI")
vnoremap <buffer> <silent> \+na :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace alias")
nnoremap <buffer> <silent> \+na :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace alias")
vnoremap <buffer> <silent> \+unb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace block xxx","v")
nnoremap <buffer> <silent> \+unb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace block xxx")
vnoremap <buffer> <silent> \+un :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace xxx")
nnoremap <buffer> <silent> \+un :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace xxx")
vnoremap <buffer> <silent> \+uns :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace std")
nnoremap <buffer> <silent> \+uns :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace std")
vnoremap <buffer> <silent> \+oof :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open output file","v")
nnoremap <buffer> <silent> \+oof :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open output file")
vnoremap <buffer> <silent> \+oif :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open input file","v")
nnoremap <buffer> <silent> \+oif :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open input file")
vnoremap <buffer> <silent> \+ex :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.extern C","v")
nnoremap <buffer> <silent> \+ex :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.extern C")
vnoremap <buffer> <silent> \+caa :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch all","v")
nnoremap <buffer> <silent> \+caa :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch all")
vnoremap <buffer> <silent> \+ca :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch","v")
nnoremap <buffer> <silent> \+ca :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch")
vnoremap <buffer> <silent> \+tr :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.try catch","v")
nnoremap <buffer> <silent> \+tr :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.try catch")
vnoremap <buffer> <silent> \+ioi :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, in")
nnoremap <buffer> <silent> \+ioi :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, in")
vnoremap <buffer> <silent> \+ioo :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, out")
nnoremap <buffer> <silent> \+ioo :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, out")
vnoremap <buffer> <silent> \+tf :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template function")
nnoremap <buffer> <silent> \+tf :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template function")
vnoremap <buffer> <silent> \+ita :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template accessor")
nnoremap <buffer> <silent> \+ita :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template accessor")
vnoremap <buffer> <silent> \+itm :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template method")
nnoremap <buffer> <silent> \+itm :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template method")
vnoremap <buffer> <silent> \+itcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class using new")
nnoremap <buffer> <silent> \+itcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class using new")
vnoremap <buffer> <silent> \+itc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class")
nnoremap <buffer> <silent> \+itc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class")
vnoremap <buffer> <silent> \+ia :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.accessor")
nnoremap <buffer> <silent> \+ia :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.accessor")
vnoremap <buffer> <silent> \+im :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.method")
nnoremap <buffer> <silent> \+im :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.method")
vnoremap <buffer> <silent> \+icn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class using new")
nnoremap <buffer> <silent> \+icn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class using new")
vnoremap <buffer> <silent> \+ic :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class")
nnoremap <buffer> <silent> \+ic :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class")
vnoremap <buffer> <silent> \+ec :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.error class")
nnoremap <buffer> <silent> \+ec :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.error class")
vnoremap <buffer> <silent> \+tcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class using new")
nnoremap <buffer> <silent> \+tcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class using new")
vnoremap <buffer> <silent> \+tc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class")
nnoremap <buffer> <silent> \+tc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class")
vnoremap <buffer> <silent> \+cn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class using new")
nnoremap <buffer> <silent> \+cn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class using new")
vnoremap <buffer> <silent> \+c :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class")
nnoremap <buffer> <silent> \+c :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class")
vnoremap <buffer> <silent> \+fb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.ios flagbits")
nnoremap <buffer> <silent> \+fb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.ios flagbits")
vnoremap <buffer> <silent> \+om :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.output manipulators")
nnoremap <buffer> <silent> \+om :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.output manipulators")
vnoremap <buffer> <silent> \+ich :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C std lib header")
nnoremap <buffer> <silent> \+ich :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C std lib header")
vnoremap <buffer> <silent> \+ih :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C++ std lib header")
nnoremap <buffer> <silent> \+ih :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C++ std lib header")
vnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.macros")
nnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.macros")
vnoremap <buffer> <silent> \csc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.special comments")
nnoremap <buffer> <silent> \csc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.special comments")
vnoremap <buffer> <silent> \ckc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.keyword comments")
nnoremap <buffer> <silent> \ckc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.keyword comments")
vnoremap <buffer> <silent> \chs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.H file sections")
nnoremap <buffer> <silent> \chs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.H file sections")
vnoremap <buffer> <silent> \ccs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.C file sections")
nnoremap <buffer> <silent> \ccs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.C file sections")
vnoremap <buffer> <silent> \cfdh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description header")
nnoremap <buffer> <silent> \cfdh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description header")
vnoremap <buffer> <silent> \cfdi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description impl")
nnoremap <buffer> <silent> \cfdi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description impl")
vnoremap <buffer> <silent> \ccl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.class")
nnoremap <buffer> <silent> \ccl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.class")
vnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.method")
nnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.method")
vnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.function")
nnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.function")
vnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.frame")
nnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.frame")
vnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:C_Templates,"Snippets.jump tags")
nnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:C_Templates,"Snippets.jump tags")
map <buffer> <silent> \hm :call C_Help("m")
map <buffer> <silent> \hp :call C_HelpCsupport()
map <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call C_XtermSize()
map <buffer> <silent> \rs :call C_Settings()
omap <buffer> <silent> \rh :call C_Hardcopy()
map <buffer> <silent> \ri :call C_Indent()
map <buffer> <silent> \rccs :call C_CppcheckSeverityInput()
map <buffer> <silent> \rcc :call C_CppcheckCheck()
map <buffer> <silent> \rpa :call C_SplintArguments()
map <buffer> <silent> \rp :call C_SplintCheck()
map <buffer> <silent> \rma :call C_MakeArguments()
map <buffer> <silent> \rme :call C_ExeToRun()
map <buffer> <silent> \rmc :call C_MakeClean()
map <buffer> <silent> \rcm :call C_ChooseMakefile()
map <buffer> <silent> \rm :call C_Make()
map <buffer> <silent> \ra :call C_Arguments()
map <buffer> <silent> \rr :call C_Run()
map <buffer> <silent> \rl :call C_Link()
map <buffer> <silent> \rc :call C_Compile()
nnoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:C_Templates,"!pick")
nnoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:C_Templates,"reload","all")
nnoremap <buffer> <silent> \ntg :call mmtemplates#core#EditTemplateFiles(g:C_Templates,1)
nnoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:C_Templates,-1)
noremap <buffer> <silent> \ns :call C_ProtoShow()
noremap <buffer> <silent> \nc :call C_ProtoClear()
noremap <buffer> <silent> \ni :call C_ProtoInsert()
onoremap <buffer> <silent> \nm :call C_ProtoPick("method")
onoremap <buffer> <silent> \nf :call C_ProtoPick("function")
onoremap <buffer> <silent> \np :call C_ProtoPick("function")
noremap <buffer> <silent> \ne :call C_CodeSnippet("e")
onoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
noremap <buffer> <silent> \nv :call C_CodeSnippet("view")
noremap <buffer> <silent> \nr :call C_CodeSnippet("r")
onoremap <buffer> <silent> \in :call C_CodeFor("down"    )
onoremap <buffer> <silent> \i0 :call C_CodeFor("up"    )
noremap <buffer> <silent> \pr0 :call C_PPIf0Remove()
onoremap <buffer> <silent> \pi0 :call C_PPIf0("a")
onoremap <buffer> <silent> \cx :call C_CommentToggle( )
onoremap <buffer> <silent> \ct :call C_InsertDateAndTime('dt')
onoremap <buffer> <silent> \cd :call C_InsertDateAndTime('d')
onoremap <buffer> <silent> \co :call C_CommentToCode()
onoremap <buffer> <silent> \cc :call C_CodeToCommentCpp()
onoremap <buffer> <silent> \c* :call C_CodeToCommentC()
noremap <buffer> <silent> \cs :call C_GetLineEndCommCol()
vnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm()
nnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm()
noremap <buffer> <silent> \cl :call C_EndOfLineComment()
vnoremap <buffer> {
map <buffer> <silent> <S-F9> :call C_Arguments()
map <buffer> <silent> <C-F9> :call C_Run()
map <buffer> <silent> <F9> :call C_Link()
map <buffer> <silent> <M-F9> :call C_Compile()
imap <buffer> <silent> <NL> =C_JumpCtrlJ()
inoremap <buffer> /*
inoremap <buffer> /* /*  */<Left><Left><Left>
inoremap <buffer> <silent> \sb :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.block")
inoremap <buffer> <silent> \sc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.case")
inoremap <buffer> <silent> \ss :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.switch")
inoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while block")
inoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while")
inoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.else block")
inoremap <buffer> <silent> \sife :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block else")
inoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if else")
inoremap <buffer> <silent> \sif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block")
inoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if")
inoremap <buffer> <silent> \sfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.range-based for")
inoremap <buffer> <silent> \sfo :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for block")
inoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for")
inoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.do while")
inoremap <buffer> <silent> \pw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.warning")
inoremap <buffer> <silent> \pp :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.pragma")
inoremap <buffer> <silent> \pli :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.line")
inoremap <buffer> <silent> \pe :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.error")
inoremap <buffer> <silent> \pind :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-def-endif")
inoremap <buffer> <silent> \pin :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-else-endif")
inoremap <buffer> <silent> \pid :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifdef-else-endif")
inoremap <buffer> <silent> \pie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-else-endif")
inoremap <buffer> <silent> \pif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-endif")
inoremap <buffer> <silent> \pu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.undefine")
inoremap <buffer> <silent> \pd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.define")
inoremap <buffer> <silent> \pl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-local")
inoremap <buffer> <silent> \pg :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-global")
inoremap <buffer> <silent> \pih :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include std lib header")
inoremap <buffer> <silent> \ifpr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fscanf")
inoremap <buffer> <silent> \ifsc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fprintf")
inoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-output-file")
inoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-input-file")
inoremap <buffer> <silent> \ias :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.assert")
inoremap <buffer> <silent> \isi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.sizeof")
inoremap <buffer> <silent> \ire :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.realloc")
inoremap <buffer> <silent> \ima :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.malloc")
inoremap <buffer> <silent> \ica :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.calloc")
inoremap <buffer> <silent> \ipr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.printf")
inoremap <buffer> <silent> \isc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.scanf")
inoremap <buffer> <silent> \iu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.union")
inoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.struct")
inoremap <buffer> <silent> \ie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.enum")
inoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.main")
inoremap <buffer> <silent> \isf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function-static")
inoremap <buffer> <silent> \if :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function")
inoremap <buffer> <silent> \+rt :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.RTTI")
inoremap <buffer> <silent> \+na :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace alias")
inoremap <buffer> <silent> \+unb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace block xxx")
inoremap <buffer> <silent> \+un :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace xxx")
inoremap <buffer> <silent> \+uns :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace std")
inoremap <buffer> <silent> \+oof :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open output file")
inoremap <buffer> <silent> \+oif :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open input file")
inoremap <buffer> <silent> \+ex :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.extern C")
inoremap <buffer> <silent> \+caa :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch all")
inoremap <buffer> <silent> \+ca :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch")
inoremap <buffer> <silent> \+tr :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.try catch")
inoremap <buffer> <silent> \+ioi :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, in")
inoremap <buffer> <silent> \+ioo :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, out")
inoremap <buffer> <silent> \+tf :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template function")
inoremap <buffer> <silent> \+ita :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template accessor")
inoremap <buffer> <silent> \+itm :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template method")
inoremap <buffer> <silent> \+itcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class using new")
inoremap <buffer> <silent> \+itc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class")
inoremap <buffer> <silent> \+ia :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.accessor")
inoremap <buffer> <silent> \+im :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.method")
inoremap <buffer> <silent> \+icn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class using new")
inoremap <buffer> <silent> \+ic :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class")
inoremap <buffer> <silent> \+ec :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.error class")
inoremap <buffer> <silent> \+tcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class using new")
inoremap <buffer> <silent> \+tc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class")
inoremap <buffer> <silent> \+cn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class using new")
inoremap <buffer> <silent> \+c :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class")
inoremap <buffer> <silent> \+fb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.ios flagbits")
inoremap <buffer> <silent> \+om :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.output manipulators")
inoremap <buffer> <silent> \+ich :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C std lib header")
inoremap <buffer> <silent> \+ih :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C++ std lib header")
inoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.macros")
inoremap <buffer> <silent> \csc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.special comments")
inoremap <buffer> <silent> \ckc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.keyword comments")
inoremap <buffer> <silent> \chs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.H file sections")
inoremap <buffer> <silent> \ccs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.C file sections")
inoremap <buffer> <silent> \cfdh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description header")
inoremap <buffer> <silent> \cfdi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description impl")
inoremap <buffer> <silent> \ccl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.class")
inoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.method")
inoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.function")
inoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.frame")
inoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:C_Templates,"Snippets.jump tags")
imap <buffer> <silent> \hm :call C_Help("m")
imap <buffer> <silent> \hp :call C_HelpCsupport()
imap <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()
imap <buffer> <silent> \rx :call C_XtermSize()
imap <buffer> <silent> \rs :call C_Settings()
imap <buffer> <silent> \rh :call C_Hardcopy()
imap <buffer> <silent> \ri :call C_Indent()
imap <buffer> <silent> \rccs :call C_CppcheckSeverityInput()
imap <buffer> <silent> \rcc :call C_CppcheckCheck()
imap <buffer> <silent> \rpa :call C_SplintArguments()
imap <buffer> <silent> \rp :call C_SplintCheck()
imap <buffer> <silent> \rma :call C_MakeArguments()
imap <buffer> <silent> \rme :call C_ExeToRun()
imap <buffer> <silent> \rmc :call C_MakeClean()
imap <buffer> <silent> \rcm :call C_ChooseMakefile()
imap <buffer> <silent> \rm :call C_Make()
imap <buffer> <silent> \ra :call C_Arguments()
imap <buffer> <silent> \rr :call C_Run()
imap <buffer> <silent> \rl :call C_Link()
imap <buffer> <silent> \rc :call C_Compile()
inoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:C_Templates,"!pick")
inoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:C_Templates,"reload","all")
inoremap <buffer> <silent> \ntg :call mmtemplates#core#EditTemplateFiles(g:C_Templates,1)
inoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:C_Templates,-1)
inoremap <buffer> <silent> \ns :call C_ProtoShow()
inoremap <buffer> <silent> \nc :call C_ProtoClear()
inoremap <buffer> <silent> \ni :call C_ProtoInsert()
inoremap <buffer> <silent> \nm :call C_ProtoPick("method")
inoremap <buffer> <silent> \nf :call C_ProtoPick("function")
inoremap <buffer> <silent> \np :call C_ProtoPick("function")
inoremap <buffer> <silent> \ne :call C_CodeSnippet("e")
inoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
inoremap <buffer> <silent> \nv :call C_CodeSnippet("view")
inoremap <buffer> <silent> \nr :call C_CodeSnippet("r")
inoremap <buffer> <silent> \in :call C_CodeFor("down"    )
inoremap <buffer> <silent> \i0 :call C_CodeFor("up"    )
inoremap <buffer> <silent> \pr0 :call C_PPIf0Remove()
inoremap <buffer> <silent> \pi0 :call C_PPIf0("a")
inoremap <buffer> <silent> \cx :call C_CommentToggle( )
inoremap <buffer> <silent> \ct :call C_InsertDateAndTime('dt')
inoremap <buffer> <silent> \cd :call C_InsertDateAndTime('d')
inoremap <buffer> <silent> \cj :call C_AdjustLineEndComm()
inoremap <buffer> <silent> \cl :call C_EndOfLineComment()
inoremap <buffer> {
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=/usr/share/vim/vimfiles/c-support/wordlists/c-c++-keywords.list,/usr/share/vim/vimfiles/c-support/wordlists/k+r.list,/usr/share/vim/vimfiles/c-support/wordlists/stl_index.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'cpp'
setlocal filetype=cpp
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=ccomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=de
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'cpp'
setlocal syntax=cpp
endif
setlocal tabstop=8
setlocal tagcase=
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 147 - ((17 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
147
normal! 017|
tabedit src/proxyModel.cpp
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
7argu
edit src/proxyModel.cpp
let s:cpo_save=&cpo
set cpo&vim
imap <buffer> <silent> <S-F9> :call C_Arguments()
imap <buffer> <silent> <C-F9> :call C_Run()
imap <buffer> <silent> <F9> :call C_Link()
imap <buffer> <silent> <M-F9> :call C_Compile()
nmap <buffer> <silent> <NL> i=C_JumpCtrlJ()
vnoremap <buffer> /* s/*  */<Left><Left><Left>p
nmap <buffer> <silent> \rh :call C_Hardcopy()
nnoremap <buffer> <silent> \nm :call C_ProtoPick("method")
nnoremap <buffer> <silent> \nf :call C_ProtoPick("function")
nnoremap <buffer> <silent> \np :call C_ProtoPick("function")
nnoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
nnoremap <buffer> <silent> \in :call C_CodeFor("down"    )
nnoremap <buffer> <silent> \i0 :call C_CodeFor("up"    )
nnoremap <buffer> <silent> \pi0 :call C_PPIf0("a")
nnoremap <buffer> <silent> \cx :call C_CommentToggle( )
nnoremap <buffer> <silent> \ct :call C_InsertDateAndTime('dt')
nnoremap <buffer> <silent> \cd :call C_InsertDateAndTime('d')
nnoremap <buffer> <silent> \co :call C_CommentToCode()
nnoremap <buffer> <silent> \cc :call C_CodeToCommentCpp()
nnoremap <buffer> <silent> \c* :call C_CodeToCommentC()
vnoremap <buffer> <silent> \sb :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.block","v")
nnoremap <buffer> <silent> \sb :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.block")
vnoremap <buffer> <silent> \sc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.case")
nnoremap <buffer> <silent> \sc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.case")
vnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while block","v")
nnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while block")
vnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while")
nnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while")
vnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.else block","v")
nnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.else block")
vnoremap <buffer> <silent> \sife :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block else","v")
nnoremap <buffer> <silent> \sife :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block else")
vnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if else","v")
nnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if else")
vnoremap <buffer> <silent> \sif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block","v")
nnoremap <buffer> <silent> \sif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block")
vnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if")
nnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if")
vnoremap <buffer> <silent> \sfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.range-based for","v")
nnoremap <buffer> <silent> \sfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.range-based for")
vnoremap <buffer> <silent> \sfo :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for block","v")
nnoremap <buffer> <silent> \sfo :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for block")
vnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for")
nnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for")
vnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.do while","v")
nnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.do while")
vnoremap <buffer> <silent> \pw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.warning")
nnoremap <buffer> <silent> \pw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.warning")
vnoremap <buffer> <silent> \pp :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.pragma")
nnoremap <buffer> <silent> \pp :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.pragma")
vnoremap <buffer> <silent> \pli :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.line")
nnoremap <buffer> <silent> \pli :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.line")
vnoremap <buffer> <silent> \pe :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.error")
nnoremap <buffer> <silent> \pe :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.error")
vnoremap <buffer> <silent> \pind :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-def-endif","v")
nnoremap <buffer> <silent> \pind :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-def-endif")
vnoremap <buffer> <silent> \pin :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-else-endif","v")
nnoremap <buffer> <silent> \pin :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-else-endif")
vnoremap <buffer> <silent> \pid :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifdef-else-endif","v")
nnoremap <buffer> <silent> \pid :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifdef-else-endif")
vnoremap <buffer> <silent> \pie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-else-endif","v")
nnoremap <buffer> <silent> \pie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-else-endif")
vnoremap <buffer> <silent> \pif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-endif","v")
nnoremap <buffer> <silent> \pif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-endif")
vnoremap <buffer> <silent> \pu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.undefine")
nnoremap <buffer> <silent> \pu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.undefine")
vnoremap <buffer> <silent> \pd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.define")
nnoremap <buffer> <silent> \pd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.define")
vnoremap <buffer> <silent> \pl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-local")
nnoremap <buffer> <silent> \pl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-local")
vnoremap <buffer> <silent> \pg :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-global")
nnoremap <buffer> <silent> \pg :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-global")
vnoremap <buffer> <silent> \pih :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include std lib header")
nnoremap <buffer> <silent> \pih :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include std lib header")
vnoremap <buffer> <silent> \ifpr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fscanf")
nnoremap <buffer> <silent> \ifpr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fscanf")
vnoremap <buffer> <silent> \ifsc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fprintf")
nnoremap <buffer> <silent> \ifsc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fprintf")
vnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-output-file","v")
nnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-output-file")
vnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-input-file","v")
nnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-input-file")
vnoremap <buffer> <silent> \ias :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.assert","v")
nnoremap <buffer> <silent> \ias :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.assert")
vnoremap <buffer> <silent> \isi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.sizeof","v")
nnoremap <buffer> <silent> \isi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.sizeof")
vnoremap <buffer> <silent> \ire :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.realloc")
nnoremap <buffer> <silent> \ire :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.realloc")
vnoremap <buffer> <silent> \ima :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.malloc")
nnoremap <buffer> <silent> \ima :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.malloc")
vnoremap <buffer> <silent> \ica :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.calloc")
nnoremap <buffer> <silent> \ica :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.calloc")
vnoremap <buffer> <silent> \ipr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.printf")
nnoremap <buffer> <silent> \ipr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.printf")
vnoremap <buffer> <silent> \isc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.scanf")
nnoremap <buffer> <silent> \isc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.scanf")
vnoremap <buffer> <silent> \iu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.union","v")
nnoremap <buffer> <silent> \iu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.union")
vnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.struct","v")
nnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.struct")
vnoremap <buffer> <silent> \ie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.enum","v")
nnoremap <buffer> <silent> \ie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.enum")
vnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.main","v")
nnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.main")
vnoremap <buffer> <silent> \isf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function-static","v")
nnoremap <buffer> <silent> \isf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function-static")
vnoremap <buffer> <silent> \if :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function","v")
nnoremap <buffer> <silent> \if :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function")
vnoremap <buffer> <silent> \+rt :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.RTTI","v")
nnoremap <buffer> <silent> \+rt :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.RTTI")
vnoremap <buffer> <silent> \+na :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace alias")
nnoremap <buffer> <silent> \+na :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace alias")
vnoremap <buffer> <silent> \+unb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace block xxx","v")
nnoremap <buffer> <silent> \+unb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace block xxx")
vnoremap <buffer> <silent> \+un :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace xxx")
nnoremap <buffer> <silent> \+un :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace xxx")
vnoremap <buffer> <silent> \+uns :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace std")
nnoremap <buffer> <silent> \+uns :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace std")
vnoremap <buffer> <silent> \+oof :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open output file","v")
nnoremap <buffer> <silent> \+oof :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open output file")
vnoremap <buffer> <silent> \+oif :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open input file","v")
nnoremap <buffer> <silent> \+oif :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open input file")
vnoremap <buffer> <silent> \+ex :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.extern C","v")
nnoremap <buffer> <silent> \+ex :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.extern C")
vnoremap <buffer> <silent> \+caa :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch all","v")
nnoremap <buffer> <silent> \+caa :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch all")
vnoremap <buffer> <silent> \+ca :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch","v")
nnoremap <buffer> <silent> \+ca :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch")
vnoremap <buffer> <silent> \+tr :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.try catch","v")
nnoremap <buffer> <silent> \+tr :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.try catch")
vnoremap <buffer> <silent> \+ioi :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, in")
nnoremap <buffer> <silent> \+ioi :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, in")
vnoremap <buffer> <silent> \+ioo :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, out")
nnoremap <buffer> <silent> \+ioo :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, out")
vnoremap <buffer> <silent> \+tf :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template function")
nnoremap <buffer> <silent> \+tf :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template function")
vnoremap <buffer> <silent> \+ita :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template accessor")
nnoremap <buffer> <silent> \+ita :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template accessor")
vnoremap <buffer> <silent> \+itm :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template method")
nnoremap <buffer> <silent> \+itm :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template method")
vnoremap <buffer> <silent> \+itcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class using new")
nnoremap <buffer> <silent> \+itcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class using new")
vnoremap <buffer> <silent> \+itc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class")
nnoremap <buffer> <silent> \+itc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class")
vnoremap <buffer> <silent> \+ia :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.accessor")
nnoremap <buffer> <silent> \+ia :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.accessor")
vnoremap <buffer> <silent> \+im :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.method")
nnoremap <buffer> <silent> \+im :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.method")
vnoremap <buffer> <silent> \+icn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class using new")
nnoremap <buffer> <silent> \+icn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class using new")
vnoremap <buffer> <silent> \+ic :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class")
nnoremap <buffer> <silent> \+ic :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class")
vnoremap <buffer> <silent> \+ec :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.error class")
nnoremap <buffer> <silent> \+ec :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.error class")
vnoremap <buffer> <silent> \+tcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class using new")
nnoremap <buffer> <silent> \+tcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class using new")
vnoremap <buffer> <silent> \+tc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class")
nnoremap <buffer> <silent> \+tc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class")
vnoremap <buffer> <silent> \+cn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class using new")
nnoremap <buffer> <silent> \+cn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class using new")
vnoremap <buffer> <silent> \+c :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class")
nnoremap <buffer> <silent> \+c :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class")
vnoremap <buffer> <silent> \+fb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.ios flagbits")
nnoremap <buffer> <silent> \+fb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.ios flagbits")
vnoremap <buffer> <silent> \+om :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.output manipulators")
nnoremap <buffer> <silent> \+om :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.output manipulators")
vnoremap <buffer> <silent> \+ich :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C std lib header")
nnoremap <buffer> <silent> \+ich :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C std lib header")
vnoremap <buffer> <silent> \+ih :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C++ std lib header")
nnoremap <buffer> <silent> \+ih :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C++ std lib header")
vnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.macros")
nnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.macros")
vnoremap <buffer> <silent> \csc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.special comments")
nnoremap <buffer> <silent> \csc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.special comments")
vnoremap <buffer> <silent> \ckc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.keyword comments")
nnoremap <buffer> <silent> \ckc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.keyword comments")
vnoremap <buffer> <silent> \chs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.H file sections")
nnoremap <buffer> <silent> \chs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.H file sections")
vnoremap <buffer> <silent> \ccs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.C file sections")
nnoremap <buffer> <silent> \ccs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.C file sections")
vnoremap <buffer> <silent> \cfdh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description header")
nnoremap <buffer> <silent> \cfdh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description header")
vnoremap <buffer> <silent> \cfdi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description impl")
nnoremap <buffer> <silent> \cfdi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description impl")
vnoremap <buffer> <silent> \ccl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.class")
nnoremap <buffer> <silent> \ccl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.class")
vnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.method")
nnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.method")
vnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.function")
nnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.function")
vnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.frame")
nnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.frame")
vnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:C_Templates,"Snippets.jump tags")
nnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:C_Templates,"Snippets.jump tags")
map <buffer> <silent> \hm :call C_Help("m")
map <buffer> <silent> \hp :call C_HelpCsupport()
map <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call C_XtermSize()
map <buffer> <silent> \rs :call C_Settings()
vmap <buffer> <silent> \rh :call C_Hardcopy()
omap <buffer> <silent> \rh :call C_Hardcopy()
map <buffer> <silent> \ri :call C_Indent()
map <buffer> <silent> \rccs :call C_CppcheckSeverityInput()
map <buffer> <silent> \rcc :call C_CppcheckCheck()
map <buffer> <silent> \rpa :call C_SplintArguments()
map <buffer> <silent> \rp :call C_SplintCheck()
map <buffer> <silent> \rma :call C_MakeArguments()
map <buffer> <silent> \rme :call C_ExeToRun()
map <buffer> <silent> \rmc :call C_MakeClean()
map <buffer> <silent> \rcm :call C_ChooseMakefile()
map <buffer> <silent> \rm :call C_Make()
map <buffer> <silent> \ra :call C_Arguments()
map <buffer> <silent> \rr :call C_Run()
map <buffer> <silent> \rl :call C_Link()
map <buffer> <silent> \rc :call C_Compile()
nnoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:C_Templates,"!pick")
nnoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:C_Templates,"reload","all")
nnoremap <buffer> <silent> \ntg :call mmtemplates#core#EditTemplateFiles(g:C_Templates,1)
nnoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:C_Templates,-1)
noremap <buffer> <silent> \ns :call C_ProtoShow()
noremap <buffer> <silent> \nc :call C_ProtoClear()
noremap <buffer> <silent> \ni :call C_ProtoInsert()
vnoremap <buffer> <silent> \nm :call C_ProtoPick("method")
onoremap <buffer> <silent> \nm :call C_ProtoPick("method")
vnoremap <buffer> <silent> \nf :call C_ProtoPick("function")
onoremap <buffer> <silent> \nf :call C_ProtoPick("function")
vnoremap <buffer> <silent> \np :call C_ProtoPick("function")
onoremap <buffer> <silent> \np :call C_ProtoPick("function")
noremap <buffer> <silent> \ne :call C_CodeSnippet("e")
vnoremap <buffer> <silent> \nw :call C_CodeSnippet("wv")
onoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
noremap <buffer> <silent> \nv :call C_CodeSnippet("view")
noremap <buffer> <silent> \nr :call C_CodeSnippet("r")
vnoremap <buffer> <silent> \in :call C_CodeFor("down","v")
onoremap <buffer> <silent> \in :call C_CodeFor("down"    )
vnoremap <buffer> <silent> \i0 :call C_CodeFor("up","v")
onoremap <buffer> <silent> \i0 :call C_CodeFor("up"    )
noremap <buffer> <silent> \pr0 :call C_PPIf0Remove()
vnoremap <buffer> <silent> \pi0 :call C_PPIf0("v")
onoremap <buffer> <silent> \pi0 :call C_PPIf0("a")
vnoremap <buffer> <silent> \cx :call C_CommentToggle( )
onoremap <buffer> <silent> \cx :call C_CommentToggle( )
vnoremap <buffer> <silent> \ct s:call C_InsertDateAndTime('dt')
onoremap <buffer> <silent> \ct :call C_InsertDateAndTime('dt')
vnoremap <buffer> <silent> \cd s:call C_InsertDateAndTime('d')
onoremap <buffer> <silent> \cd :call C_InsertDateAndTime('d')
vnoremap <buffer> <silent> \co :call C_CommentToCode()
onoremap <buffer> <silent> \co :call C_CommentToCode()
vnoremap <buffer> <silent> \cc :call C_CodeToCommentCpp()
onoremap <buffer> <silent> \cc :call C_CodeToCommentCpp()
vnoremap <buffer> <silent> \c* :call C_CodeToCommentC()
onoremap <buffer> <silent> \c* :call C_CodeToCommentC()
noremap <buffer> <silent> \cs :call C_GetLineEndCommCol()
vnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm()
nnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm()
noremap <buffer> <silent> \cl :call C_EndOfLineComment()
vnoremap <buffer> {
map <buffer> <silent> <S-F9> :call C_Arguments()
map <buffer> <silent> <C-F9> :call C_Run()
map <buffer> <silent> <F9> :call C_Link()
map <buffer> <silent> <M-F9> :call C_Compile()
imap <buffer> <silent> <NL> =C_JumpCtrlJ()
inoremap <buffer> /*
inoremap <buffer> /* /*  */<Left><Left><Left>
inoremap <buffer> <silent> \sb :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.block")
inoremap <buffer> <silent> \sc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.case")
inoremap <buffer> <silent> \ss :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.switch")
inoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while block")
inoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while")
inoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.else block")
inoremap <buffer> <silent> \sife :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block else")
inoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if else")
inoremap <buffer> <silent> \sif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block")
inoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if")
inoremap <buffer> <silent> \sfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.range-based for")
inoremap <buffer> <silent> \sfo :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for block")
inoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for")
inoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.do while")
inoremap <buffer> <silent> \pw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.warning")
inoremap <buffer> <silent> \pp :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.pragma")
inoremap <buffer> <silent> \pli :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.line")
inoremap <buffer> <silent> \pe :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.error")
inoremap <buffer> <silent> \pind :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-def-endif")
inoremap <buffer> <silent> \pin :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-else-endif")
inoremap <buffer> <silent> \pid :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifdef-else-endif")
inoremap <buffer> <silent> \pie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-else-endif")
inoremap <buffer> <silent> \pif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-endif")
inoremap <buffer> <silent> \pu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.undefine")
inoremap <buffer> <silent> \pd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.define")
inoremap <buffer> <silent> \pl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-local")
inoremap <buffer> <silent> \pg :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-global")
inoremap <buffer> <silent> \pih :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include std lib header")
inoremap <buffer> <silent> \ifpr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fscanf")
inoremap <buffer> <silent> \ifsc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fprintf")
inoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-output-file")
inoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-input-file")
inoremap <buffer> <silent> \ias :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.assert")
inoremap <buffer> <silent> \isi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.sizeof")
inoremap <buffer> <silent> \ire :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.realloc")
inoremap <buffer> <silent> \ima :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.malloc")
inoremap <buffer> <silent> \ica :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.calloc")
inoremap <buffer> <silent> \ipr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.printf")
inoremap <buffer> <silent> \isc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.scanf")
inoremap <buffer> <silent> \iu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.union")
inoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.struct")
inoremap <buffer> <silent> \ie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.enum")
inoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.main")
inoremap <buffer> <silent> \isf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function-static")
inoremap <buffer> <silent> \if :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function")
inoremap <buffer> <silent> \+rt :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.RTTI")
inoremap <buffer> <silent> \+na :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace alias")
inoremap <buffer> <silent> \+unb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace block xxx")
inoremap <buffer> <silent> \+un :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace xxx")
inoremap <buffer> <silent> \+uns :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace std")
inoremap <buffer> <silent> \+oof :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open output file")
inoremap <buffer> <silent> \+oif :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open input file")
inoremap <buffer> <silent> \+ex :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.extern C")
inoremap <buffer> <silent> \+caa :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch all")
inoremap <buffer> <silent> \+ca :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch")
inoremap <buffer> <silent> \+tr :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.try catch")
inoremap <buffer> <silent> \+ioi :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, in")
inoremap <buffer> <silent> \+ioo :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, out")
inoremap <buffer> <silent> \+tf :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template function")
inoremap <buffer> <silent> \+ita :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template accessor")
inoremap <buffer> <silent> \+itm :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template method")
inoremap <buffer> <silent> \+itcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class using new")
inoremap <buffer> <silent> \+itc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class")
inoremap <buffer> <silent> \+ia :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.accessor")
inoremap <buffer> <silent> \+im :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.method")
inoremap <buffer> <silent> \+icn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class using new")
inoremap <buffer> <silent> \+ic :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class")
inoremap <buffer> <silent> \+ec :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.error class")
inoremap <buffer> <silent> \+tcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class using new")
inoremap <buffer> <silent> \+tc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class")
inoremap <buffer> <silent> \+cn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class using new")
inoremap <buffer> <silent> \+c :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class")
inoremap <buffer> <silent> \+fb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.ios flagbits")
inoremap <buffer> <silent> \+om :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.output manipulators")
inoremap <buffer> <silent> \+ich :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C std lib header")
inoremap <buffer> <silent> \+ih :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C++ std lib header")
inoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.macros")
inoremap <buffer> <silent> \csc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.special comments")
inoremap <buffer> <silent> \ckc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.keyword comments")
inoremap <buffer> <silent> \chs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.H file sections")
inoremap <buffer> <silent> \ccs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.C file sections")
inoremap <buffer> <silent> \cfdh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description header")
inoremap <buffer> <silent> \cfdi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description impl")
inoremap <buffer> <silent> \ccl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.class")
inoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.method")
inoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.function")
inoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.frame")
inoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:C_Templates,"Snippets.jump tags")
imap <buffer> <silent> \hm :call C_Help("m")
imap <buffer> <silent> \hp :call C_HelpCsupport()
imap <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()
imap <buffer> <silent> \rx :call C_XtermSize()
imap <buffer> <silent> \rs :call C_Settings()
imap <buffer> <silent> \rh :call C_Hardcopy()
imap <buffer> <silent> \ri :call C_Indent()
imap <buffer> <silent> \rccs :call C_CppcheckSeverityInput()
imap <buffer> <silent> \rcc :call C_CppcheckCheck()
imap <buffer> <silent> \rpa :call C_SplintArguments()
imap <buffer> <silent> \rp :call C_SplintCheck()
imap <buffer> <silent> \rma :call C_MakeArguments()
imap <buffer> <silent> \rme :call C_ExeToRun()
imap <buffer> <silent> \rmc :call C_MakeClean()
imap <buffer> <silent> \rcm :call C_ChooseMakefile()
imap <buffer> <silent> \rm :call C_Make()
imap <buffer> <silent> \ra :call C_Arguments()
imap <buffer> <silent> \rr :call C_Run()
imap <buffer> <silent> \rl :call C_Link()
imap <buffer> <silent> \rc :call C_Compile()
inoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:C_Templates,"!pick")
inoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:C_Templates,"reload","all")
inoremap <buffer> <silent> \ntg :call mmtemplates#core#EditTemplateFiles(g:C_Templates,1)
inoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:C_Templates,-1)
inoremap <buffer> <silent> \ns :call C_ProtoShow()
inoremap <buffer> <silent> \nc :call C_ProtoClear()
inoremap <buffer> <silent> \ni :call C_ProtoInsert()
inoremap <buffer> <silent> \nm :call C_ProtoPick("method")
inoremap <buffer> <silent> \nf :call C_ProtoPick("function")
inoremap <buffer> <silent> \np :call C_ProtoPick("function")
inoremap <buffer> <silent> \ne :call C_CodeSnippet("e")
inoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
inoremap <buffer> <silent> \nv :call C_CodeSnippet("view")
inoremap <buffer> <silent> \nr :call C_CodeSnippet("r")
inoremap <buffer> <silent> \in :call C_CodeFor("down"    )
inoremap <buffer> <silent> \i0 :call C_CodeFor("up"    )
inoremap <buffer> <silent> \pr0 :call C_PPIf0Remove()
inoremap <buffer> <silent> \pi0 :call C_PPIf0("a")
inoremap <buffer> <silent> \cx :call C_CommentToggle( )
inoremap <buffer> <silent> \ct :call C_InsertDateAndTime('dt')
inoremap <buffer> <silent> \cd :call C_InsertDateAndTime('d')
inoremap <buffer> <silent> \cj :call C_AdjustLineEndComm()
inoremap <buffer> <silent> \cl :call C_EndOfLineComment()
inoremap <buffer> {
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=/usr/share/vim/vimfiles/c-support/wordlists/c-c++-keywords.list,/usr/share/vim/vimfiles/c-support/wordlists/k+r.list,/usr/share/vim/vimfiles/c-support/wordlists/stl_index.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'cpp'
setlocal filetype=cpp
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=ccomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=de
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'cpp'
setlocal syntax=cpp
endif
setlocal tabstop=8
setlocal tagcase=
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 106 - ((3 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
106
normal! 03|
tabedit inc/proxyModel.h
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
edit inc/proxyModel.h
let s:cpo_save=&cpo
set cpo&vim
imap <buffer> <silent> <S-F9> :call C_Arguments()
imap <buffer> <silent> <C-F9> :call C_Run()
imap <buffer> <silent> <F9> :call C_Link()
imap <buffer> <silent> <M-F9> :call C_Compile()
nmap <buffer> <silent> <NL> i=C_JumpCtrlJ()
vnoremap <buffer> /* s/*  */<Left><Left><Left>p
nmap <buffer> <silent> \rh :call C_Hardcopy()
nnoremap <buffer> <silent> \nm :call C_ProtoPick("method")
nnoremap <buffer> <silent> \nf :call C_ProtoPick("function")
nnoremap <buffer> <silent> \np :call C_ProtoPick("function")
nnoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
nnoremap <buffer> <silent> \in :call C_CodeFor("down"    )
nnoremap <buffer> <silent> \i0 :call C_CodeFor("up"    )
nnoremap <buffer> <silent> \pi0 :call C_PPIf0("a")
nnoremap <buffer> <silent> \cx :call C_CommentToggle( )
nnoremap <buffer> <silent> \ct :call C_InsertDateAndTime('dt')
nnoremap <buffer> <silent> \cd :call C_InsertDateAndTime('d')
nnoremap <buffer> <silent> \co :call C_CommentToCode()
nnoremap <buffer> <silent> \cc :call C_CodeToCommentCpp()
nnoremap <buffer> <silent> \c* :call C_CodeToCommentC()
vmap <buffer> <silent> \rh :call C_Hardcopy()
vnoremap <buffer> <silent> \nm :call C_ProtoPick("method")
vnoremap <buffer> <silent> \nf :call C_ProtoPick("function")
vnoremap <buffer> <silent> \np :call C_ProtoPick("function")
vnoremap <buffer> <silent> \nw :call C_CodeSnippet("wv")
vnoremap <buffer> <silent> \in :call C_CodeFor("down","v")
vnoremap <buffer> <silent> \i0 :call C_CodeFor("up","v")
vnoremap <buffer> <silent> \pi0 :call C_PPIf0("v")
vnoremap <buffer> <silent> \cx :call C_CommentToggle( )
vnoremap <buffer> <silent> \ct s:call C_InsertDateAndTime('dt')
vnoremap <buffer> <silent> \cd s:call C_InsertDateAndTime('d')
vnoremap <buffer> <silent> \co :call C_CommentToCode()
vnoremap <buffer> <silent> \cc :call C_CodeToCommentCpp()
vnoremap <buffer> <silent> \c* :call C_CodeToCommentC()
vnoremap <buffer> <silent> \sb :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.block","v")
nnoremap <buffer> <silent> \sb :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.block")
vnoremap <buffer> <silent> \sc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.case")
nnoremap <buffer> <silent> \sc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.case")
vnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while block","v")
nnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while block")
vnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while")
nnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while")
vnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.else block","v")
nnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.else block")
vnoremap <buffer> <silent> \sife :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block else","v")
nnoremap <buffer> <silent> \sife :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block else")
vnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if else","v")
nnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if else")
vnoremap <buffer> <silent> \sif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block","v")
nnoremap <buffer> <silent> \sif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block")
vnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if")
nnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if")
vnoremap <buffer> <silent> \sfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.range-based for","v")
nnoremap <buffer> <silent> \sfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.range-based for")
vnoremap <buffer> <silent> \sfo :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for block","v")
nnoremap <buffer> <silent> \sfo :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for block")
vnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for")
nnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for")
vnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.do while","v")
nnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.do while")
vnoremap <buffer> <silent> \pw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.warning")
nnoremap <buffer> <silent> \pw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.warning")
vnoremap <buffer> <silent> \pp :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.pragma")
nnoremap <buffer> <silent> \pp :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.pragma")
vnoremap <buffer> <silent> \pli :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.line")
nnoremap <buffer> <silent> \pli :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.line")
vnoremap <buffer> <silent> \pe :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.error")
nnoremap <buffer> <silent> \pe :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.error")
vnoremap <buffer> <silent> \pind :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-def-endif","v")
nnoremap <buffer> <silent> \pind :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-def-endif")
vnoremap <buffer> <silent> \pin :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-else-endif","v")
nnoremap <buffer> <silent> \pin :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-else-endif")
vnoremap <buffer> <silent> \pid :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifdef-else-endif","v")
nnoremap <buffer> <silent> \pid :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifdef-else-endif")
vnoremap <buffer> <silent> \pie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-else-endif","v")
nnoremap <buffer> <silent> \pie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-else-endif")
vnoremap <buffer> <silent> \pif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-endif","v")
nnoremap <buffer> <silent> \pif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-endif")
vnoremap <buffer> <silent> \pu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.undefine")
nnoremap <buffer> <silent> \pu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.undefine")
vnoremap <buffer> <silent> \pd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.define")
nnoremap <buffer> <silent> \pd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.define")
vnoremap <buffer> <silent> \pl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-local")
nnoremap <buffer> <silent> \pl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-local")
vnoremap <buffer> <silent> \pg :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-global")
nnoremap <buffer> <silent> \pg :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-global")
vnoremap <buffer> <silent> \pih :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include std lib header")
nnoremap <buffer> <silent> \pih :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include std lib header")
vnoremap <buffer> <silent> \ifpr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fscanf")
nnoremap <buffer> <silent> \ifpr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fscanf")
vnoremap <buffer> <silent> \ifsc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fprintf")
nnoremap <buffer> <silent> \ifsc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fprintf")
vnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-output-file","v")
nnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-output-file")
vnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-input-file","v")
nnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-input-file")
vnoremap <buffer> <silent> \ias :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.assert","v")
nnoremap <buffer> <silent> \ias :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.assert")
vnoremap <buffer> <silent> \isi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.sizeof","v")
nnoremap <buffer> <silent> \isi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.sizeof")
vnoremap <buffer> <silent> \ire :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.realloc")
nnoremap <buffer> <silent> \ire :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.realloc")
vnoremap <buffer> <silent> \ima :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.malloc")
nnoremap <buffer> <silent> \ima :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.malloc")
vnoremap <buffer> <silent> \ica :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.calloc")
nnoremap <buffer> <silent> \ica :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.calloc")
vnoremap <buffer> <silent> \ipr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.printf")
nnoremap <buffer> <silent> \ipr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.printf")
vnoremap <buffer> <silent> \isc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.scanf")
nnoremap <buffer> <silent> \isc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.scanf")
vnoremap <buffer> <silent> \iu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.union","v")
nnoremap <buffer> <silent> \iu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.union")
vnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.struct","v")
nnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.struct")
vnoremap <buffer> <silent> \ie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.enum","v")
nnoremap <buffer> <silent> \ie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.enum")
vnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.main","v")
nnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.main")
vnoremap <buffer> <silent> \isf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function-static","v")
nnoremap <buffer> <silent> \isf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function-static")
vnoremap <buffer> <silent> \if :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function","v")
nnoremap <buffer> <silent> \if :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function")
vnoremap <buffer> <silent> \+rt :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.RTTI","v")
nnoremap <buffer> <silent> \+rt :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.RTTI")
vnoremap <buffer> <silent> \+na :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace alias")
nnoremap <buffer> <silent> \+na :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace alias")
vnoremap <buffer> <silent> \+unb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace block xxx","v")
nnoremap <buffer> <silent> \+unb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace block xxx")
vnoremap <buffer> <silent> \+un :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace xxx")
nnoremap <buffer> <silent> \+un :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace xxx")
vnoremap <buffer> <silent> \+uns :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace std")
nnoremap <buffer> <silent> \+uns :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace std")
vnoremap <buffer> <silent> \+oof :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open output file","v")
nnoremap <buffer> <silent> \+oof :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open output file")
vnoremap <buffer> <silent> \+oif :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open input file","v")
nnoremap <buffer> <silent> \+oif :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open input file")
vnoremap <buffer> <silent> \+ex :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.extern C","v")
nnoremap <buffer> <silent> \+ex :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.extern C")
vnoremap <buffer> <silent> \+caa :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch all","v")
nnoremap <buffer> <silent> \+caa :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch all")
vnoremap <buffer> <silent> \+ca :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch","v")
nnoremap <buffer> <silent> \+ca :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch")
vnoremap <buffer> <silent> \+tr :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.try catch","v")
nnoremap <buffer> <silent> \+tr :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.try catch")
vnoremap <buffer> <silent> \+ioi :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, in")
nnoremap <buffer> <silent> \+ioi :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, in")
vnoremap <buffer> <silent> \+ioo :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, out")
nnoremap <buffer> <silent> \+ioo :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, out")
vnoremap <buffer> <silent> \+tf :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template function")
nnoremap <buffer> <silent> \+tf :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template function")
vnoremap <buffer> <silent> \+ita :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template accessor")
nnoremap <buffer> <silent> \+ita :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template accessor")
vnoremap <buffer> <silent> \+itm :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template method")
nnoremap <buffer> <silent> \+itm :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template method")
vnoremap <buffer> <silent> \+itcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class using new")
nnoremap <buffer> <silent> \+itcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class using new")
vnoremap <buffer> <silent> \+itc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class")
nnoremap <buffer> <silent> \+itc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class")
vnoremap <buffer> <silent> \+ia :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.accessor")
nnoremap <buffer> <silent> \+ia :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.accessor")
vnoremap <buffer> <silent> \+im :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.method")
nnoremap <buffer> <silent> \+im :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.method")
vnoremap <buffer> <silent> \+icn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class using new")
nnoremap <buffer> <silent> \+icn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class using new")
vnoremap <buffer> <silent> \+ic :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class")
nnoremap <buffer> <silent> \+ic :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class")
vnoremap <buffer> <silent> \+ec :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.error class")
nnoremap <buffer> <silent> \+ec :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.error class")
vnoremap <buffer> <silent> \+tcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class using new")
nnoremap <buffer> <silent> \+tcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class using new")
vnoremap <buffer> <silent> \+tc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class")
nnoremap <buffer> <silent> \+tc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class")
vnoremap <buffer> <silent> \+cn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class using new")
nnoremap <buffer> <silent> \+cn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class using new")
vnoremap <buffer> <silent> \+c :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class")
nnoremap <buffer> <silent> \+c :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class")
vnoremap <buffer> <silent> \+fb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.ios flagbits")
nnoremap <buffer> <silent> \+fb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.ios flagbits")
vnoremap <buffer> <silent> \+om :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.output manipulators")
nnoremap <buffer> <silent> \+om :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.output manipulators")
vnoremap <buffer> <silent> \+ich :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C std lib header")
nnoremap <buffer> <silent> \+ich :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C std lib header")
vnoremap <buffer> <silent> \+ih :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C++ std lib header")
nnoremap <buffer> <silent> \+ih :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C++ std lib header")
vnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.macros")
nnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.macros")
vnoremap <buffer> <silent> \csc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.special comments")
nnoremap <buffer> <silent> \csc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.special comments")
vnoremap <buffer> <silent> \ckc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.keyword comments")
nnoremap <buffer> <silent> \ckc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.keyword comments")
vnoremap <buffer> <silent> \chs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.H file sections")
nnoremap <buffer> <silent> \chs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.H file sections")
vnoremap <buffer> <silent> \ccs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.C file sections")
nnoremap <buffer> <silent> \ccs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.C file sections")
vnoremap <buffer> <silent> \cfdh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description header")
nnoremap <buffer> <silent> \cfdh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description header")
vnoremap <buffer> <silent> \cfdi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description impl")
nnoremap <buffer> <silent> \cfdi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description impl")
vnoremap <buffer> <silent> \ccl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.class")
nnoremap <buffer> <silent> \ccl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.class")
vnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.method")
nnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.method")
vnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.function")
nnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.function")
vnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.frame")
nnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.frame")
vnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:C_Templates,"Snippets.jump tags")
nnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:C_Templates,"Snippets.jump tags")
map <buffer> <silent> \hm :call C_Help("m")
map <buffer> <silent> \hp :call C_HelpCsupport()
map <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call C_XtermSize()
map <buffer> <silent> \rs :call C_Settings()
omap <buffer> <silent> \rh :call C_Hardcopy()
map <buffer> <silent> \ri :call C_Indent()
map <buffer> <silent> \rccs :call C_CppcheckSeverityInput()
map <buffer> <silent> \rcc :call C_CppcheckCheck()
map <buffer> <silent> \rpa :call C_SplintArguments()
map <buffer> <silent> \rp :call C_SplintCheck()
map <buffer> <silent> \rma :call C_MakeArguments()
map <buffer> <silent> \rme :call C_ExeToRun()
map <buffer> <silent> \rmc :call C_MakeClean()
map <buffer> <silent> \rcm :call C_ChooseMakefile()
map <buffer> <silent> \rm :call C_Make()
map <buffer> <silent> \ra :call C_Arguments()
map <buffer> <silent> \rr :call C_Run()
map <buffer> <silent> \rl :call C_Link()
map <buffer> <silent> \rc :call C_Compile()
nnoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:C_Templates,"!pick")
nnoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:C_Templates,"reload","all")
nnoremap <buffer> <silent> \ntg :call mmtemplates#core#EditTemplateFiles(g:C_Templates,1)
nnoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:C_Templates,-1)
noremap <buffer> <silent> \ns :call C_ProtoShow()
noremap <buffer> <silent> \nc :call C_ProtoClear()
noremap <buffer> <silent> \ni :call C_ProtoInsert()
onoremap <buffer> <silent> \nm :call C_ProtoPick("method")
onoremap <buffer> <silent> \nf :call C_ProtoPick("function")
onoremap <buffer> <silent> \np :call C_ProtoPick("function")
noremap <buffer> <silent> \ne :call C_CodeSnippet("e")
onoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
noremap <buffer> <silent> \nv :call C_CodeSnippet("view")
noremap <buffer> <silent> \nr :call C_CodeSnippet("r")
onoremap <buffer> <silent> \in :call C_CodeFor("down"    )
onoremap <buffer> <silent> \i0 :call C_CodeFor("up"    )
noremap <buffer> <silent> \pr0 :call C_PPIf0Remove()
onoremap <buffer> <silent> \pi0 :call C_PPIf0("a")
onoremap <buffer> <silent> \cx :call C_CommentToggle( )
onoremap <buffer> <silent> \ct :call C_InsertDateAndTime('dt')
onoremap <buffer> <silent> \cd :call C_InsertDateAndTime('d')
onoremap <buffer> <silent> \co :call C_CommentToCode()
onoremap <buffer> <silent> \cc :call C_CodeToCommentCpp()
onoremap <buffer> <silent> \c* :call C_CodeToCommentC()
noremap <buffer> <silent> \cs :call C_GetLineEndCommCol()
vnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm()
nnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm()
noremap <buffer> <silent> \cl :call C_EndOfLineComment()
vnoremap <buffer> {
map <buffer> <silent> <S-F9> :call C_Arguments()
map <buffer> <silent> <C-F9> :call C_Run()
map <buffer> <silent> <F9> :call C_Link()
map <buffer> <silent> <M-F9> :call C_Compile()
imap <buffer> <silent> <NL> =C_JumpCtrlJ()
inoremap <buffer> /*
inoremap <buffer> /* /*  */<Left><Left><Left>
inoremap <buffer> <silent> \sb :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.block")
inoremap <buffer> <silent> \sc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.case")
inoremap <buffer> <silent> \ss :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.switch")
inoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while block")
inoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while")
inoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.else block")
inoremap <buffer> <silent> \sife :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block else")
inoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if else")
inoremap <buffer> <silent> \sif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block")
inoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if")
inoremap <buffer> <silent> \sfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.range-based for")
inoremap <buffer> <silent> \sfo :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for block")
inoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for")
inoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.do while")
inoremap <buffer> <silent> \pw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.warning")
inoremap <buffer> <silent> \pp :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.pragma")
inoremap <buffer> <silent> \pli :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.line")
inoremap <buffer> <silent> \pe :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.error")
inoremap <buffer> <silent> \pind :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-def-endif")
inoremap <buffer> <silent> \pin :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-else-endif")
inoremap <buffer> <silent> \pid :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifdef-else-endif")
inoremap <buffer> <silent> \pie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-else-endif")
inoremap <buffer> <silent> \pif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-endif")
inoremap <buffer> <silent> \pu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.undefine")
inoremap <buffer> <silent> \pd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.define")
inoremap <buffer> <silent> \pl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-local")
inoremap <buffer> <silent> \pg :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-global")
inoremap <buffer> <silent> \pih :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include std lib header")
inoremap <buffer> <silent> \ifpr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fscanf")
inoremap <buffer> <silent> \ifsc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fprintf")
inoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-output-file")
inoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-input-file")
inoremap <buffer> <silent> \ias :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.assert")
inoremap <buffer> <silent> \isi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.sizeof")
inoremap <buffer> <silent> \ire :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.realloc")
inoremap <buffer> <silent> \ima :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.malloc")
inoremap <buffer> <silent> \ica :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.calloc")
inoremap <buffer> <silent> \ipr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.printf")
inoremap <buffer> <silent> \isc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.scanf")
inoremap <buffer> <silent> \iu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.union")
inoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.struct")
inoremap <buffer> <silent> \ie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.enum")
inoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.main")
inoremap <buffer> <silent> \isf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function-static")
inoremap <buffer> <silent> \if :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function")
inoremap <buffer> <silent> \+rt :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.RTTI")
inoremap <buffer> <silent> \+na :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace alias")
inoremap <buffer> <silent> \+unb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace block xxx")
inoremap <buffer> <silent> \+un :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace xxx")
inoremap <buffer> <silent> \+uns :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace std")
inoremap <buffer> <silent> \+oof :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open output file")
inoremap <buffer> <silent> \+oif :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open input file")
inoremap <buffer> <silent> \+ex :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.extern C")
inoremap <buffer> <silent> \+caa :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch all")
inoremap <buffer> <silent> \+ca :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch")
inoremap <buffer> <silent> \+tr :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.try catch")
inoremap <buffer> <silent> \+ioi :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, in")
inoremap <buffer> <silent> \+ioo :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, out")
inoremap <buffer> <silent> \+tf :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template function")
inoremap <buffer> <silent> \+ita :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template accessor")
inoremap <buffer> <silent> \+itm :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template method")
inoremap <buffer> <silent> \+itcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class using new")
inoremap <buffer> <silent> \+itc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class")
inoremap <buffer> <silent> \+ia :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.accessor")
inoremap <buffer> <silent> \+im :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.method")
inoremap <buffer> <silent> \+icn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class using new")
inoremap <buffer> <silent> \+ic :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class")
inoremap <buffer> <silent> \+ec :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.error class")
inoremap <buffer> <silent> \+tcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class using new")
inoremap <buffer> <silent> \+tc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class")
inoremap <buffer> <silent> \+cn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class using new")
inoremap <buffer> <silent> \+c :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class")
inoremap <buffer> <silent> \+fb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.ios flagbits")
inoremap <buffer> <silent> \+om :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.output manipulators")
inoremap <buffer> <silent> \+ich :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C std lib header")
inoremap <buffer> <silent> \+ih :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C++ std lib header")
inoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.macros")
inoremap <buffer> <silent> \csc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.special comments")
inoremap <buffer> <silent> \ckc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.keyword comments")
inoremap <buffer> <silent> \chs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.H file sections")
inoremap <buffer> <silent> \ccs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.C file sections")
inoremap <buffer> <silent> \cfdh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description header")
inoremap <buffer> <silent> \cfdi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description impl")
inoremap <buffer> <silent> \ccl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.class")
inoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.method")
inoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.function")
inoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.frame")
inoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:C_Templates,"Snippets.jump tags")
imap <buffer> <silent> \hm :call C_Help("m")
imap <buffer> <silent> \hp :call C_HelpCsupport()
imap <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()
imap <buffer> <silent> \rx :call C_XtermSize()
imap <buffer> <silent> \rs :call C_Settings()
imap <buffer> <silent> \rh :call C_Hardcopy()
imap <buffer> <silent> \ri :call C_Indent()
imap <buffer> <silent> \rccs :call C_CppcheckSeverityInput()
imap <buffer> <silent> \rcc :call C_CppcheckCheck()
imap <buffer> <silent> \rpa :call C_SplintArguments()
imap <buffer> <silent> \rp :call C_SplintCheck()
imap <buffer> <silent> \rma :call C_MakeArguments()
imap <buffer> <silent> \rme :call C_ExeToRun()
imap <buffer> <silent> \rmc :call C_MakeClean()
imap <buffer> <silent> \rcm :call C_ChooseMakefile()
imap <buffer> <silent> \rm :call C_Make()
imap <buffer> <silent> \ra :call C_Arguments()
imap <buffer> <silent> \rr :call C_Run()
imap <buffer> <silent> \rl :call C_Link()
imap <buffer> <silent> \rc :call C_Compile()
inoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:C_Templates,"!pick")
inoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:C_Templates,"reload","all")
inoremap <buffer> <silent> \ntg :call mmtemplates#core#EditTemplateFiles(g:C_Templates,1)
inoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:C_Templates,-1)
inoremap <buffer> <silent> \ns :call C_ProtoShow()
inoremap <buffer> <silent> \nc :call C_ProtoClear()
inoremap <buffer> <silent> \ni :call C_ProtoInsert()
inoremap <buffer> <silent> \nm :call C_ProtoPick("method")
inoremap <buffer> <silent> \nf :call C_ProtoPick("function")
inoremap <buffer> <silent> \np :call C_ProtoPick("function")
inoremap <buffer> <silent> \ne :call C_CodeSnippet("e")
inoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
inoremap <buffer> <silent> \nv :call C_CodeSnippet("view")
inoremap <buffer> <silent> \nr :call C_CodeSnippet("r")
inoremap <buffer> <silent> \in :call C_CodeFor("down"    )
inoremap <buffer> <silent> \i0 :call C_CodeFor("up"    )
inoremap <buffer> <silent> \pr0 :call C_PPIf0Remove()
inoremap <buffer> <silent> \pi0 :call C_PPIf0("a")
inoremap <buffer> <silent> \cx :call C_CommentToggle( )
inoremap <buffer> <silent> \ct :call C_InsertDateAndTime('dt')
inoremap <buffer> <silent> \cd :call C_InsertDateAndTime('d')
inoremap <buffer> <silent> \cj :call C_AdjustLineEndComm()
inoremap <buffer> <silent> \cl :call C_EndOfLineComment()
inoremap <buffer> {
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=/usr/share/vim/vimfiles/c-support/wordlists/c-c++-keywords.list,/usr/share/vim/vimfiles/c-support/wordlists/k+r.list,/usr/share/vim/vimfiles/c-support/wordlists/stl_index.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'cpp'
setlocal filetype=cpp
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=ccomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=de
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'cpp'
setlocal syntax=cpp
endif
setlocal tabstop=8
setlocal tagcase=
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 73 - ((24 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
73
normal! 018|
tabedit src/mainwindow_picture.cpp
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
edit src/mainwindow_picture.cpp
let s:cpo_save=&cpo
set cpo&vim
imap <buffer> <silent> <S-F9> :call C_Arguments()
imap <buffer> <silent> <C-F9> :call C_Run()
imap <buffer> <silent> <F9> :call C_Link()
imap <buffer> <silent> <M-F9> :call C_Compile()
nmap <buffer> <silent> <NL> i=C_JumpCtrlJ()
vnoremap <buffer> /* s/*  */<Left><Left><Left>p
nmap <buffer> <silent> \rh :call C_Hardcopy()
nnoremap <buffer> <silent> \nm :call C_ProtoPick("method")
nnoremap <buffer> <silent> \nf :call C_ProtoPick("function")
nnoremap <buffer> <silent> \np :call C_ProtoPick("function")
nnoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
nnoremap <buffer> <silent> \in :call C_CodeFor("down"    )
nnoremap <buffer> <silent> \i0 :call C_CodeFor("up"    )
nnoremap <buffer> <silent> \pi0 :call C_PPIf0("a")
nnoremap <buffer> <silent> \cx :call C_CommentToggle( )
nnoremap <buffer> <silent> \ct :call C_InsertDateAndTime('dt')
nnoremap <buffer> <silent> \cd :call C_InsertDateAndTime('d')
nnoremap <buffer> <silent> \co :call C_CommentToCode()
nnoremap <buffer> <silent> \cc :call C_CodeToCommentCpp()
nnoremap <buffer> <silent> \c* :call C_CodeToCommentC()
vmap <buffer> <silent> \rh :call C_Hardcopy()
vnoremap <buffer> <silent> \nm :call C_ProtoPick("method")
vnoremap <buffer> <silent> \nf :call C_ProtoPick("function")
vnoremap <buffer> <silent> \np :call C_ProtoPick("function")
vnoremap <buffer> <silent> \nw :call C_CodeSnippet("wv")
vnoremap <buffer> <silent> \in :call C_CodeFor("down","v")
vnoremap <buffer> <silent> \i0 :call C_CodeFor("up","v")
vnoremap <buffer> <silent> \pi0 :call C_PPIf0("v")
vnoremap <buffer> <silent> \cx :call C_CommentToggle( )
vnoremap <buffer> <silent> \ct s:call C_InsertDateAndTime('dt')
vnoremap <buffer> <silent> \cd s:call C_InsertDateAndTime('d')
vnoremap <buffer> <silent> \co :call C_CommentToCode()
vnoremap <buffer> <silent> \cc :call C_CodeToCommentCpp()
vnoremap <buffer> <silent> \c* :call C_CodeToCommentC()
vnoremap <buffer> <silent> \sb :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.block","v")
nnoremap <buffer> <silent> \sb :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.block")
vnoremap <buffer> <silent> \sc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.case")
nnoremap <buffer> <silent> \sc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.case")
vnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while block","v")
nnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while block")
vnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while")
nnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while")
vnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.else block","v")
nnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.else block")
vnoremap <buffer> <silent> \sife :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block else","v")
nnoremap <buffer> <silent> \sife :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block else")
vnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if else","v")
nnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if else")
vnoremap <buffer> <silent> \sif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block","v")
nnoremap <buffer> <silent> \sif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block")
vnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if")
nnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if")
vnoremap <buffer> <silent> \sfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.range-based for","v")
nnoremap <buffer> <silent> \sfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.range-based for")
vnoremap <buffer> <silent> \sfo :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for block","v")
nnoremap <buffer> <silent> \sfo :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for block")
vnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for")
nnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for")
vnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.do while","v")
nnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.do while")
vnoremap <buffer> <silent> \pw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.warning")
nnoremap <buffer> <silent> \pw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.warning")
vnoremap <buffer> <silent> \pp :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.pragma")
nnoremap <buffer> <silent> \pp :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.pragma")
vnoremap <buffer> <silent> \pli :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.line")
nnoremap <buffer> <silent> \pli :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.line")
vnoremap <buffer> <silent> \pe :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.error")
nnoremap <buffer> <silent> \pe :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.error")
vnoremap <buffer> <silent> \pind :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-def-endif","v")
nnoremap <buffer> <silent> \pind :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-def-endif")
vnoremap <buffer> <silent> \pin :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-else-endif","v")
nnoremap <buffer> <silent> \pin :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-else-endif")
vnoremap <buffer> <silent> \pid :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifdef-else-endif","v")
nnoremap <buffer> <silent> \pid :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifdef-else-endif")
vnoremap <buffer> <silent> \pie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-else-endif","v")
nnoremap <buffer> <silent> \pie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-else-endif")
vnoremap <buffer> <silent> \pif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-endif","v")
nnoremap <buffer> <silent> \pif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-endif")
vnoremap <buffer> <silent> \pu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.undefine")
nnoremap <buffer> <silent> \pu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.undefine")
vnoremap <buffer> <silent> \pd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.define")
nnoremap <buffer> <silent> \pd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.define")
vnoremap <buffer> <silent> \pl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-local")
nnoremap <buffer> <silent> \pl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-local")
vnoremap <buffer> <silent> \pg :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-global")
nnoremap <buffer> <silent> \pg :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-global")
vnoremap <buffer> <silent> \pih :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include std lib header")
nnoremap <buffer> <silent> \pih :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include std lib header")
vnoremap <buffer> <silent> \ifpr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fscanf")
nnoremap <buffer> <silent> \ifpr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fscanf")
vnoremap <buffer> <silent> \ifsc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fprintf")
nnoremap <buffer> <silent> \ifsc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fprintf")
vnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-output-file","v")
nnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-output-file")
vnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-input-file","v")
nnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-input-file")
vnoremap <buffer> <silent> \ias :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.assert","v")
nnoremap <buffer> <silent> \ias :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.assert")
vnoremap <buffer> <silent> \isi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.sizeof","v")
nnoremap <buffer> <silent> \isi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.sizeof")
vnoremap <buffer> <silent> \ire :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.realloc")
nnoremap <buffer> <silent> \ire :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.realloc")
vnoremap <buffer> <silent> \ima :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.malloc")
nnoremap <buffer> <silent> \ima :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.malloc")
vnoremap <buffer> <silent> \ica :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.calloc")
nnoremap <buffer> <silent> \ica :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.calloc")
vnoremap <buffer> <silent> \ipr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.printf")
nnoremap <buffer> <silent> \ipr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.printf")
vnoremap <buffer> <silent> \isc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.scanf")
nnoremap <buffer> <silent> \isc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.scanf")
vnoremap <buffer> <silent> \iu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.union","v")
nnoremap <buffer> <silent> \iu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.union")
vnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.struct","v")
nnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.struct")
vnoremap <buffer> <silent> \ie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.enum","v")
nnoremap <buffer> <silent> \ie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.enum")
vnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.main","v")
nnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.main")
vnoremap <buffer> <silent> \isf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function-static","v")
nnoremap <buffer> <silent> \isf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function-static")
vnoremap <buffer> <silent> \if :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function","v")
nnoremap <buffer> <silent> \if :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function")
vnoremap <buffer> <silent> \+rt :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.RTTI","v")
nnoremap <buffer> <silent> \+rt :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.RTTI")
vnoremap <buffer> <silent> \+na :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace alias")
nnoremap <buffer> <silent> \+na :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace alias")
vnoremap <buffer> <silent> \+unb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace block xxx","v")
nnoremap <buffer> <silent> \+unb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace block xxx")
vnoremap <buffer> <silent> \+un :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace xxx")
nnoremap <buffer> <silent> \+un :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace xxx")
vnoremap <buffer> <silent> \+uns :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace std")
nnoremap <buffer> <silent> \+uns :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace std")
vnoremap <buffer> <silent> \+oof :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open output file","v")
nnoremap <buffer> <silent> \+oof :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open output file")
vnoremap <buffer> <silent> \+oif :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open input file","v")
nnoremap <buffer> <silent> \+oif :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open input file")
vnoremap <buffer> <silent> \+ex :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.extern C","v")
nnoremap <buffer> <silent> \+ex :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.extern C")
vnoremap <buffer> <silent> \+caa :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch all","v")
nnoremap <buffer> <silent> \+caa :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch all")
vnoremap <buffer> <silent> \+ca :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch","v")
nnoremap <buffer> <silent> \+ca :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch")
vnoremap <buffer> <silent> \+tr :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.try catch","v")
nnoremap <buffer> <silent> \+tr :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.try catch")
vnoremap <buffer> <silent> \+ioi :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, in")
nnoremap <buffer> <silent> \+ioi :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, in")
vnoremap <buffer> <silent> \+ioo :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, out")
nnoremap <buffer> <silent> \+ioo :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, out")
vnoremap <buffer> <silent> \+tf :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template function")
nnoremap <buffer> <silent> \+tf :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template function")
vnoremap <buffer> <silent> \+ita :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template accessor")
nnoremap <buffer> <silent> \+ita :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template accessor")
vnoremap <buffer> <silent> \+itm :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template method")
nnoremap <buffer> <silent> \+itm :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template method")
vnoremap <buffer> <silent> \+itcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class using new")
nnoremap <buffer> <silent> \+itcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class using new")
vnoremap <buffer> <silent> \+itc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class")
nnoremap <buffer> <silent> \+itc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class")
vnoremap <buffer> <silent> \+ia :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.accessor")
nnoremap <buffer> <silent> \+ia :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.accessor")
vnoremap <buffer> <silent> \+im :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.method")
nnoremap <buffer> <silent> \+im :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.method")
vnoremap <buffer> <silent> \+icn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class using new")
nnoremap <buffer> <silent> \+icn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class using new")
vnoremap <buffer> <silent> \+ic :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class")
nnoremap <buffer> <silent> \+ic :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class")
vnoremap <buffer> <silent> \+ec :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.error class")
nnoremap <buffer> <silent> \+ec :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.error class")
vnoremap <buffer> <silent> \+tcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class using new")
nnoremap <buffer> <silent> \+tcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class using new")
vnoremap <buffer> <silent> \+tc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class")
nnoremap <buffer> <silent> \+tc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class")
vnoremap <buffer> <silent> \+cn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class using new")
nnoremap <buffer> <silent> \+cn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class using new")
vnoremap <buffer> <silent> \+c :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class")
nnoremap <buffer> <silent> \+c :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class")
vnoremap <buffer> <silent> \+fb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.ios flagbits")
nnoremap <buffer> <silent> \+fb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.ios flagbits")
vnoremap <buffer> <silent> \+om :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.output manipulators")
nnoremap <buffer> <silent> \+om :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.output manipulators")
vnoremap <buffer> <silent> \+ich :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C std lib header")
nnoremap <buffer> <silent> \+ich :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C std lib header")
vnoremap <buffer> <silent> \+ih :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C++ std lib header")
nnoremap <buffer> <silent> \+ih :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C++ std lib header")
vnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.macros")
nnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.macros")
vnoremap <buffer> <silent> \csc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.special comments")
nnoremap <buffer> <silent> \csc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.special comments")
vnoremap <buffer> <silent> \ckc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.keyword comments")
nnoremap <buffer> <silent> \ckc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.keyword comments")
vnoremap <buffer> <silent> \chs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.H file sections")
nnoremap <buffer> <silent> \chs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.H file sections")
vnoremap <buffer> <silent> \ccs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.C file sections")
nnoremap <buffer> <silent> \ccs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.C file sections")
vnoremap <buffer> <silent> \cfdh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description header")
nnoremap <buffer> <silent> \cfdh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description header")
vnoremap <buffer> <silent> \cfdi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description impl")
nnoremap <buffer> <silent> \cfdi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description impl")
vnoremap <buffer> <silent> \ccl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.class")
nnoremap <buffer> <silent> \ccl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.class")
vnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.method")
nnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.method")
vnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.function")
nnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.function")
vnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.frame")
nnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.frame")
vnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:C_Templates,"Snippets.jump tags")
nnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:C_Templates,"Snippets.jump tags")
map <buffer> <silent> \hm :call C_Help("m")
map <buffer> <silent> \hp :call C_HelpCsupport()
map <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call C_XtermSize()
map <buffer> <silent> \rs :call C_Settings()
omap <buffer> <silent> \rh :call C_Hardcopy()
map <buffer> <silent> \ri :call C_Indent()
map <buffer> <silent> \rccs :call C_CppcheckSeverityInput()
map <buffer> <silent> \rcc :call C_CppcheckCheck()
map <buffer> <silent> \rpa :call C_SplintArguments()
map <buffer> <silent> \rp :call C_SplintCheck()
map <buffer> <silent> \rma :call C_MakeArguments()
map <buffer> <silent> \rme :call C_ExeToRun()
map <buffer> <silent> \rmc :call C_MakeClean()
map <buffer> <silent> \rcm :call C_ChooseMakefile()
map <buffer> <silent> \rm :call C_Make()
map <buffer> <silent> \ra :call C_Arguments()
map <buffer> <silent> \rr :call C_Run()
map <buffer> <silent> \rl :call C_Link()
map <buffer> <silent> \rc :call C_Compile()
nnoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:C_Templates,"!pick")
nnoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:C_Templates,"reload","all")
nnoremap <buffer> <silent> \ntg :call mmtemplates#core#EditTemplateFiles(g:C_Templates,1)
nnoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:C_Templates,-1)
noremap <buffer> <silent> \ns :call C_ProtoShow()
noremap <buffer> <silent> \nc :call C_ProtoClear()
noremap <buffer> <silent> \ni :call C_ProtoInsert()
onoremap <buffer> <silent> \nm :call C_ProtoPick("method")
onoremap <buffer> <silent> \nf :call C_ProtoPick("function")
onoremap <buffer> <silent> \np :call C_ProtoPick("function")
noremap <buffer> <silent> \ne :call C_CodeSnippet("e")
onoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
noremap <buffer> <silent> \nv :call C_CodeSnippet("view")
noremap <buffer> <silent> \nr :call C_CodeSnippet("r")
onoremap <buffer> <silent> \in :call C_CodeFor("down"    )
onoremap <buffer> <silent> \i0 :call C_CodeFor("up"    )
noremap <buffer> <silent> \pr0 :call C_PPIf0Remove()
onoremap <buffer> <silent> \pi0 :call C_PPIf0("a")
onoremap <buffer> <silent> \cx :call C_CommentToggle( )
onoremap <buffer> <silent> \ct :call C_InsertDateAndTime('dt')
onoremap <buffer> <silent> \cd :call C_InsertDateAndTime('d')
onoremap <buffer> <silent> \co :call C_CommentToCode()
onoremap <buffer> <silent> \cc :call C_CodeToCommentCpp()
onoremap <buffer> <silent> \c* :call C_CodeToCommentC()
noremap <buffer> <silent> \cs :call C_GetLineEndCommCol()
vnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm()
nnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm()
noremap <buffer> <silent> \cl :call C_EndOfLineComment()
vnoremap <buffer> {
map <buffer> <silent> <S-F9> :call C_Arguments()
map <buffer> <silent> <C-F9> :call C_Run()
map <buffer> <silent> <F9> :call C_Link()
map <buffer> <silent> <M-F9> :call C_Compile()
imap <buffer> <silent> <NL> =C_JumpCtrlJ()
inoremap <buffer> /*
inoremap <buffer> /* /*  */<Left><Left><Left>
inoremap <buffer> <silent> \sb :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.block")
inoremap <buffer> <silent> \sc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.case")
inoremap <buffer> <silent> \ss :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.switch")
inoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while block")
inoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while")
inoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.else block")
inoremap <buffer> <silent> \sife :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block else")
inoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if else")
inoremap <buffer> <silent> \sif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block")
inoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if")
inoremap <buffer> <silent> \sfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.range-based for")
inoremap <buffer> <silent> \sfo :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for block")
inoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for")
inoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.do while")
inoremap <buffer> <silent> \pw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.warning")
inoremap <buffer> <silent> \pp :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.pragma")
inoremap <buffer> <silent> \pli :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.line")
inoremap <buffer> <silent> \pe :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.error")
inoremap <buffer> <silent> \pind :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-def-endif")
inoremap <buffer> <silent> \pin :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-else-endif")
inoremap <buffer> <silent> \pid :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifdef-else-endif")
inoremap <buffer> <silent> \pie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-else-endif")
inoremap <buffer> <silent> \pif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-endif")
inoremap <buffer> <silent> \pu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.undefine")
inoremap <buffer> <silent> \pd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.define")
inoremap <buffer> <silent> \pl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-local")
inoremap <buffer> <silent> \pg :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-global")
inoremap <buffer> <silent> \pih :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include std lib header")
inoremap <buffer> <silent> \ifpr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fscanf")
inoremap <buffer> <silent> \ifsc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fprintf")
inoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-output-file")
inoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-input-file")
inoremap <buffer> <silent> \ias :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.assert")
inoremap <buffer> <silent> \isi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.sizeof")
inoremap <buffer> <silent> \ire :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.realloc")
inoremap <buffer> <silent> \ima :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.malloc")
inoremap <buffer> <silent> \ica :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.calloc")
inoremap <buffer> <silent> \ipr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.printf")
inoremap <buffer> <silent> \isc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.scanf")
inoremap <buffer> <silent> \iu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.union")
inoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.struct")
inoremap <buffer> <silent> \ie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.enum")
inoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.main")
inoremap <buffer> <silent> \isf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function-static")
inoremap <buffer> <silent> \if :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function")
inoremap <buffer> <silent> \+rt :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.RTTI")
inoremap <buffer> <silent> \+na :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace alias")
inoremap <buffer> <silent> \+unb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace block xxx")
inoremap <buffer> <silent> \+un :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace xxx")
inoremap <buffer> <silent> \+uns :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace std")
inoremap <buffer> <silent> \+oof :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open output file")
inoremap <buffer> <silent> \+oif :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open input file")
inoremap <buffer> <silent> \+ex :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.extern C")
inoremap <buffer> <silent> \+caa :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch all")
inoremap <buffer> <silent> \+ca :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch")
inoremap <buffer> <silent> \+tr :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.try catch")
inoremap <buffer> <silent> \+ioi :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, in")
inoremap <buffer> <silent> \+ioo :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, out")
inoremap <buffer> <silent> \+tf :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template function")
inoremap <buffer> <silent> \+ita :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template accessor")
inoremap <buffer> <silent> \+itm :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template method")
inoremap <buffer> <silent> \+itcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class using new")
inoremap <buffer> <silent> \+itc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class")
inoremap <buffer> <silent> \+ia :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.accessor")
inoremap <buffer> <silent> \+im :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.method")
inoremap <buffer> <silent> \+icn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class using new")
inoremap <buffer> <silent> \+ic :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class")
inoremap <buffer> <silent> \+ec :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.error class")
inoremap <buffer> <silent> \+tcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class using new")
inoremap <buffer> <silent> \+tc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class")
inoremap <buffer> <silent> \+cn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class using new")
inoremap <buffer> <silent> \+c :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class")
inoremap <buffer> <silent> \+fb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.ios flagbits")
inoremap <buffer> <silent> \+om :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.output manipulators")
inoremap <buffer> <silent> \+ich :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C std lib header")
inoremap <buffer> <silent> \+ih :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C++ std lib header")
inoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.macros")
inoremap <buffer> <silent> \csc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.special comments")
inoremap <buffer> <silent> \ckc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.keyword comments")
inoremap <buffer> <silent> \chs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.H file sections")
inoremap <buffer> <silent> \ccs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.C file sections")
inoremap <buffer> <silent> \cfdh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description header")
inoremap <buffer> <silent> \cfdi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description impl")
inoremap <buffer> <silent> \ccl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.class")
inoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.method")
inoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.function")
inoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.frame")
inoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:C_Templates,"Snippets.jump tags")
imap <buffer> <silent> \hm :call C_Help("m")
imap <buffer> <silent> \hp :call C_HelpCsupport()
imap <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()
imap <buffer> <silent> \rx :call C_XtermSize()
imap <buffer> <silent> \rs :call C_Settings()
imap <buffer> <silent> \rh :call C_Hardcopy()
imap <buffer> <silent> \ri :call C_Indent()
imap <buffer> <silent> \rccs :call C_CppcheckSeverityInput()
imap <buffer> <silent> \rcc :call C_CppcheckCheck()
imap <buffer> <silent> \rpa :call C_SplintArguments()
imap <buffer> <silent> \rp :call C_SplintCheck()
imap <buffer> <silent> \rma :call C_MakeArguments()
imap <buffer> <silent> \rme :call C_ExeToRun()
imap <buffer> <silent> \rmc :call C_MakeClean()
imap <buffer> <silent> \rcm :call C_ChooseMakefile()
imap <buffer> <silent> \rm :call C_Make()
imap <buffer> <silent> \ra :call C_Arguments()
imap <buffer> <silent> \rr :call C_Run()
imap <buffer> <silent> \rl :call C_Link()
imap <buffer> <silent> \rc :call C_Compile()
inoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:C_Templates,"!pick")
inoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:C_Templates,"reload","all")
inoremap <buffer> <silent> \ntg :call mmtemplates#core#EditTemplateFiles(g:C_Templates,1)
inoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:C_Templates,-1)
inoremap <buffer> <silent> \ns :call C_ProtoShow()
inoremap <buffer> <silent> \nc :call C_ProtoClear()
inoremap <buffer> <silent> \ni :call C_ProtoInsert()
inoremap <buffer> <silent> \nm :call C_ProtoPick("method")
inoremap <buffer> <silent> \nf :call C_ProtoPick("function")
inoremap <buffer> <silent> \np :call C_ProtoPick("function")
inoremap <buffer> <silent> \ne :call C_CodeSnippet("e")
inoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
inoremap <buffer> <silent> \nv :call C_CodeSnippet("view")
inoremap <buffer> <silent> \nr :call C_CodeSnippet("r")
inoremap <buffer> <silent> \in :call C_CodeFor("down"    )
inoremap <buffer> <silent> \i0 :call C_CodeFor("up"    )
inoremap <buffer> <silent> \pr0 :call C_PPIf0Remove()
inoremap <buffer> <silent> \pi0 :call C_PPIf0("a")
inoremap <buffer> <silent> \cx :call C_CommentToggle( )
inoremap <buffer> <silent> \ct :call C_InsertDateAndTime('dt')
inoremap <buffer> <silent> \cd :call C_InsertDateAndTime('d')
inoremap <buffer> <silent> \cj :call C_AdjustLineEndComm()
inoremap <buffer> <silent> \cl :call C_EndOfLineComment()
inoremap <buffer> {
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=/usr/share/vim/vimfiles/c-support/wordlists/c-c++-keywords.list,/usr/share/vim/vimfiles/c-support/wordlists/k+r.list,/usr/share/vim/vimfiles/c-support/wordlists/stl_index.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'cpp'
setlocal filetype=cpp
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=ccomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=de
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'cpp'
setlocal syntax=cpp
endif
setlocal tabstop=8
setlocal tagcase=
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 106 - ((17 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
106
normal! 049|
tabedit src/networkmanager.cpp
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
edit src/networkmanager.cpp
let s:cpo_save=&cpo
set cpo&vim
imap <buffer> <silent> <S-F9> :call C_Arguments()
imap <buffer> <silent> <C-F9> :call C_Run()
imap <buffer> <silent> <F9> :call C_Link()
imap <buffer> <silent> <M-F9> :call C_Compile()
nmap <buffer> <silent> <NL> i=C_JumpCtrlJ()
vnoremap <buffer> /* s/*  */<Left><Left><Left>p
nnoremap <buffer> <silent> \c* :call C_CodeToCommentC()
nnoremap <buffer> <silent> \cc :call C_CodeToCommentCpp()
nnoremap <buffer> <silent> \co :call C_CommentToCode()
nnoremap <buffer> <silent> \cd :call C_InsertDateAndTime('d')
nnoremap <buffer> <silent> \ct :call C_InsertDateAndTime('dt')
nnoremap <buffer> <silent> \cx :call C_CommentToggle( )
nnoremap <buffer> <silent> \pi0 :call C_PPIf0("a")
nnoremap <buffer> <silent> \i0 :call C_CodeFor("up"    )
nnoremap <buffer> <silent> \in :call C_CodeFor("down"    )
nnoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
nnoremap <buffer> <silent> \np :call C_ProtoPick("function")
nnoremap <buffer> <silent> \nf :call C_ProtoPick("function")
nnoremap <buffer> <silent> \nm :call C_ProtoPick("method")
nmap <buffer> <silent> \rh :call C_Hardcopy()
vmap <buffer> <silent> \rh :call C_Hardcopy()
vnoremap <buffer> <silent> \nm :call C_ProtoPick("method")
vnoremap <buffer> <silent> \nf :call C_ProtoPick("function")
vnoremap <buffer> <silent> \np :call C_ProtoPick("function")
vnoremap <buffer> <silent> \nw :call C_CodeSnippet("wv")
vnoremap <buffer> <silent> \in :call C_CodeFor("down","v")
vnoremap <buffer> <silent> \i0 :call C_CodeFor("up","v")
vnoremap <buffer> <silent> \pi0 :call C_PPIf0("v")
vnoremap <buffer> <silent> \cx :call C_CommentToggle( )
vnoremap <buffer> <silent> \ct s:call C_InsertDateAndTime('dt')
vnoremap <buffer> <silent> \cd s:call C_InsertDateAndTime('d')
vnoremap <buffer> <silent> \co :call C_CommentToCode()
vnoremap <buffer> <silent> \cc :call C_CodeToCommentCpp()
vnoremap <buffer> <silent> \c* :call C_CodeToCommentC()
vnoremap <buffer> <silent> \sb :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.block","v")
nnoremap <buffer> <silent> \sb :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.block")
vnoremap <buffer> <silent> \sc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.case")
nnoremap <buffer> <silent> \sc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.case")
vnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while block","v")
nnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while block")
vnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while")
nnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while")
vnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.else block","v")
nnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.else block")
vnoremap <buffer> <silent> \sife :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block else","v")
nnoremap <buffer> <silent> \sife :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block else")
vnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if else","v")
nnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if else")
vnoremap <buffer> <silent> \sif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block","v")
nnoremap <buffer> <silent> \sif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block")
vnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if")
nnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if")
vnoremap <buffer> <silent> \sfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.range-based for","v")
nnoremap <buffer> <silent> \sfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.range-based for")
vnoremap <buffer> <silent> \sfo :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for block","v")
nnoremap <buffer> <silent> \sfo :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for block")
vnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for")
nnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for")
vnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.do while","v")
nnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.do while")
vnoremap <buffer> <silent> \pw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.warning")
nnoremap <buffer> <silent> \pw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.warning")
vnoremap <buffer> <silent> \pp :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.pragma")
nnoremap <buffer> <silent> \pp :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.pragma")
vnoremap <buffer> <silent> \pli :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.line")
nnoremap <buffer> <silent> \pli :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.line")
vnoremap <buffer> <silent> \pe :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.error")
nnoremap <buffer> <silent> \pe :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.error")
vnoremap <buffer> <silent> \pind :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-def-endif","v")
nnoremap <buffer> <silent> \pind :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-def-endif")
vnoremap <buffer> <silent> \pin :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-else-endif","v")
nnoremap <buffer> <silent> \pin :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-else-endif")
vnoremap <buffer> <silent> \pid :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifdef-else-endif","v")
nnoremap <buffer> <silent> \pid :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifdef-else-endif")
vnoremap <buffer> <silent> \pie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-else-endif","v")
nnoremap <buffer> <silent> \pie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-else-endif")
vnoremap <buffer> <silent> \pif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-endif","v")
nnoremap <buffer> <silent> \pif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-endif")
vnoremap <buffer> <silent> \pu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.undefine")
nnoremap <buffer> <silent> \pu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.undefine")
vnoremap <buffer> <silent> \pd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.define")
nnoremap <buffer> <silent> \pd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.define")
vnoremap <buffer> <silent> \pl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-local")
nnoremap <buffer> <silent> \pl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-local")
vnoremap <buffer> <silent> \pg :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-global")
nnoremap <buffer> <silent> \pg :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-global")
vnoremap <buffer> <silent> \pih :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include std lib header")
nnoremap <buffer> <silent> \pih :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include std lib header")
vnoremap <buffer> <silent> \ifpr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fscanf")
nnoremap <buffer> <silent> \ifpr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fscanf")
vnoremap <buffer> <silent> \ifsc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fprintf")
nnoremap <buffer> <silent> \ifsc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fprintf")
vnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-output-file","v")
nnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-output-file")
vnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-input-file","v")
nnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-input-file")
vnoremap <buffer> <silent> \ias :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.assert","v")
nnoremap <buffer> <silent> \ias :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.assert")
vnoremap <buffer> <silent> \isi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.sizeof","v")
nnoremap <buffer> <silent> \isi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.sizeof")
vnoremap <buffer> <silent> \ire :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.realloc")
nnoremap <buffer> <silent> \ire :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.realloc")
vnoremap <buffer> <silent> \ima :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.malloc")
nnoremap <buffer> <silent> \ima :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.malloc")
vnoremap <buffer> <silent> \ica :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.calloc")
nnoremap <buffer> <silent> \ica :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.calloc")
vnoremap <buffer> <silent> \ipr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.printf")
nnoremap <buffer> <silent> \ipr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.printf")
vnoremap <buffer> <silent> \isc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.scanf")
nnoremap <buffer> <silent> \isc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.scanf")
vnoremap <buffer> <silent> \iu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.union","v")
nnoremap <buffer> <silent> \iu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.union")
vnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.struct","v")
nnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.struct")
vnoremap <buffer> <silent> \ie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.enum","v")
nnoremap <buffer> <silent> \ie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.enum")
vnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.main","v")
nnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.main")
vnoremap <buffer> <silent> \isf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function-static","v")
nnoremap <buffer> <silent> \isf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function-static")
vnoremap <buffer> <silent> \if :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function","v")
nnoremap <buffer> <silent> \if :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function")
vnoremap <buffer> <silent> \+rt :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.RTTI","v")
nnoremap <buffer> <silent> \+rt :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.RTTI")
vnoremap <buffer> <silent> \+na :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace alias")
nnoremap <buffer> <silent> \+na :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace alias")
vnoremap <buffer> <silent> \+unb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace block xxx","v")
nnoremap <buffer> <silent> \+unb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace block xxx")
vnoremap <buffer> <silent> \+un :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace xxx")
nnoremap <buffer> <silent> \+un :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace xxx")
vnoremap <buffer> <silent> \+uns :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace std")
nnoremap <buffer> <silent> \+uns :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace std")
vnoremap <buffer> <silent> \+oof :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open output file","v")
nnoremap <buffer> <silent> \+oof :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open output file")
vnoremap <buffer> <silent> \+oif :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open input file","v")
nnoremap <buffer> <silent> \+oif :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open input file")
vnoremap <buffer> <silent> \+ex :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.extern C","v")
nnoremap <buffer> <silent> \+ex :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.extern C")
vnoremap <buffer> <silent> \+caa :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch all","v")
nnoremap <buffer> <silent> \+caa :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch all")
vnoremap <buffer> <silent> \+ca :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch","v")
nnoremap <buffer> <silent> \+ca :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch")
vnoremap <buffer> <silent> \+tr :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.try catch","v")
nnoremap <buffer> <silent> \+tr :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.try catch")
vnoremap <buffer> <silent> \+ioi :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, in")
nnoremap <buffer> <silent> \+ioi :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, in")
vnoremap <buffer> <silent> \+ioo :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, out")
nnoremap <buffer> <silent> \+ioo :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, out")
vnoremap <buffer> <silent> \+tf :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template function")
nnoremap <buffer> <silent> \+tf :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template function")
vnoremap <buffer> <silent> \+ita :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template accessor")
nnoremap <buffer> <silent> \+ita :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template accessor")
vnoremap <buffer> <silent> \+itm :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template method")
nnoremap <buffer> <silent> \+itm :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template method")
vnoremap <buffer> <silent> \+itcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class using new")
nnoremap <buffer> <silent> \+itcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class using new")
vnoremap <buffer> <silent> \+itc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class")
nnoremap <buffer> <silent> \+itc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class")
vnoremap <buffer> <silent> \+ia :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.accessor")
nnoremap <buffer> <silent> \+ia :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.accessor")
vnoremap <buffer> <silent> \+im :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.method")
nnoremap <buffer> <silent> \+im :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.method")
vnoremap <buffer> <silent> \+icn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class using new")
nnoremap <buffer> <silent> \+icn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class using new")
vnoremap <buffer> <silent> \+ic :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class")
nnoremap <buffer> <silent> \+ic :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class")
vnoremap <buffer> <silent> \+ec :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.error class")
nnoremap <buffer> <silent> \+ec :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.error class")
vnoremap <buffer> <silent> \+tcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class using new")
nnoremap <buffer> <silent> \+tcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class using new")
vnoremap <buffer> <silent> \+tc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class")
nnoremap <buffer> <silent> \+tc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class")
vnoremap <buffer> <silent> \+cn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class using new")
nnoremap <buffer> <silent> \+cn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class using new")
vnoremap <buffer> <silent> \+c :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class")
nnoremap <buffer> <silent> \+c :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class")
vnoremap <buffer> <silent> \+fb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.ios flagbits")
nnoremap <buffer> <silent> \+fb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.ios flagbits")
vnoremap <buffer> <silent> \+om :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.output manipulators")
nnoremap <buffer> <silent> \+om :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.output manipulators")
vnoremap <buffer> <silent> \+ich :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C std lib header")
nnoremap <buffer> <silent> \+ich :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C std lib header")
vnoremap <buffer> <silent> \+ih :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C++ std lib header")
nnoremap <buffer> <silent> \+ih :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C++ std lib header")
vnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.macros")
nnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.macros")
vnoremap <buffer> <silent> \csc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.special comments")
nnoremap <buffer> <silent> \csc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.special comments")
vnoremap <buffer> <silent> \ckc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.keyword comments")
nnoremap <buffer> <silent> \ckc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.keyword comments")
vnoremap <buffer> <silent> \chs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.H file sections")
nnoremap <buffer> <silent> \chs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.H file sections")
vnoremap <buffer> <silent> \ccs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.C file sections")
nnoremap <buffer> <silent> \ccs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.C file sections")
vnoremap <buffer> <silent> \cfdh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description header")
nnoremap <buffer> <silent> \cfdh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description header")
vnoremap <buffer> <silent> \cfdi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description impl")
nnoremap <buffer> <silent> \cfdi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description impl")
vnoremap <buffer> <silent> \ccl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.class")
nnoremap <buffer> <silent> \ccl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.class")
vnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.method")
nnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.method")
vnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.function")
nnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.function")
vnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.frame")
nnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.frame")
vnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:C_Templates,"Snippets.jump tags")
nnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:C_Templates,"Snippets.jump tags")
map <buffer> <silent> \hm :call C_Help("m")
map <buffer> <silent> \hp :call C_HelpCsupport()
map <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call C_XtermSize()
map <buffer> <silent> \rs :call C_Settings()
omap <buffer> <silent> \rh :call C_Hardcopy()
map <buffer> <silent> \ri :call C_Indent()
map <buffer> <silent> \rccs :call C_CppcheckSeverityInput()
map <buffer> <silent> \rcc :call C_CppcheckCheck()
map <buffer> <silent> \rpa :call C_SplintArguments()
map <buffer> <silent> \rp :call C_SplintCheck()
map <buffer> <silent> \rma :call C_MakeArguments()
map <buffer> <silent> \rme :call C_ExeToRun()
map <buffer> <silent> \rmc :call C_MakeClean()
map <buffer> <silent> \rcm :call C_ChooseMakefile()
map <buffer> <silent> \rm :call C_Make()
map <buffer> <silent> \ra :call C_Arguments()
map <buffer> <silent> \rr :call C_Run()
map <buffer> <silent> \rl :call C_Link()
map <buffer> <silent> \rc :call C_Compile()
nnoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:C_Templates,"!pick")
nnoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:C_Templates,"reload","all")
nnoremap <buffer> <silent> \ntg :call mmtemplates#core#EditTemplateFiles(g:C_Templates,1)
nnoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:C_Templates,-1)
noremap <buffer> <silent> \ns :call C_ProtoShow()
noremap <buffer> <silent> \nc :call C_ProtoClear()
noremap <buffer> <silent> \ni :call C_ProtoInsert()
onoremap <buffer> <silent> \nm :call C_ProtoPick("method")
onoremap <buffer> <silent> \nf :call C_ProtoPick("function")
onoremap <buffer> <silent> \np :call C_ProtoPick("function")
noremap <buffer> <silent> \ne :call C_CodeSnippet("e")
onoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
noremap <buffer> <silent> \nv :call C_CodeSnippet("view")
noremap <buffer> <silent> \nr :call C_CodeSnippet("r")
onoremap <buffer> <silent> \in :call C_CodeFor("down"    )
onoremap <buffer> <silent> \i0 :call C_CodeFor("up"    )
noremap <buffer> <silent> \pr0 :call C_PPIf0Remove()
onoremap <buffer> <silent> \pi0 :call C_PPIf0("a")
onoremap <buffer> <silent> \cx :call C_CommentToggle( )
onoremap <buffer> <silent> \ct :call C_InsertDateAndTime('dt')
onoremap <buffer> <silent> \cd :call C_InsertDateAndTime('d')
onoremap <buffer> <silent> \co :call C_CommentToCode()
onoremap <buffer> <silent> \cc :call C_CodeToCommentCpp()
onoremap <buffer> <silent> \c* :call C_CodeToCommentC()
noremap <buffer> <silent> \cs :call C_GetLineEndCommCol()
vnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm()
nnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm()
noremap <buffer> <silent> \cl :call C_EndOfLineComment()
vnoremap <buffer> {
map <buffer> <silent> <S-F9> :call C_Arguments()
map <buffer> <silent> <C-F9> :call C_Run()
map <buffer> <silent> <F9> :call C_Link()
map <buffer> <silent> <M-F9> :call C_Compile()
imap <buffer> <silent> <NL> =C_JumpCtrlJ()
inoremap <buffer> /*
inoremap <buffer> /* /*  */<Left><Left><Left>
inoremap <buffer> <silent> \sb :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.block")
inoremap <buffer> <silent> \sc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.case")
inoremap <buffer> <silent> \ss :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.switch")
inoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while block")
inoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while")
inoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.else block")
inoremap <buffer> <silent> \sife :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block else")
inoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if else")
inoremap <buffer> <silent> \sif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block")
inoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if")
inoremap <buffer> <silent> \sfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.range-based for")
inoremap <buffer> <silent> \sfo :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for block")
inoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for")
inoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.do while")
inoremap <buffer> <silent> \pw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.warning")
inoremap <buffer> <silent> \pp :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.pragma")
inoremap <buffer> <silent> \pli :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.line")
inoremap <buffer> <silent> \pe :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.error")
inoremap <buffer> <silent> \pind :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-def-endif")
inoremap <buffer> <silent> \pin :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-else-endif")
inoremap <buffer> <silent> \pid :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifdef-else-endif")
inoremap <buffer> <silent> \pie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-else-endif")
inoremap <buffer> <silent> \pif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-endif")
inoremap <buffer> <silent> \pu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.undefine")
inoremap <buffer> <silent> \pd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.define")
inoremap <buffer> <silent> \pl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-local")
inoremap <buffer> <silent> \pg :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-global")
inoremap <buffer> <silent> \pih :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include std lib header")
inoremap <buffer> <silent> \ifpr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fscanf")
inoremap <buffer> <silent> \ifsc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fprintf")
inoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-output-file")
inoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-input-file")
inoremap <buffer> <silent> \ias :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.assert")
inoremap <buffer> <silent> \isi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.sizeof")
inoremap <buffer> <silent> \ire :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.realloc")
inoremap <buffer> <silent> \ima :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.malloc")
inoremap <buffer> <silent> \ica :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.calloc")
inoremap <buffer> <silent> \ipr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.printf")
inoremap <buffer> <silent> \isc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.scanf")
inoremap <buffer> <silent> \iu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.union")
inoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.struct")
inoremap <buffer> <silent> \ie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.enum")
inoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.main")
inoremap <buffer> <silent> \isf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function-static")
inoremap <buffer> <silent> \if :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function")
inoremap <buffer> <silent> \+rt :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.RTTI")
inoremap <buffer> <silent> \+na :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace alias")
inoremap <buffer> <silent> \+unb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace block xxx")
inoremap <buffer> <silent> \+un :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace xxx")
inoremap <buffer> <silent> \+uns :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace std")
inoremap <buffer> <silent> \+oof :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open output file")
inoremap <buffer> <silent> \+oif :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open input file")
inoremap <buffer> <silent> \+ex :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.extern C")
inoremap <buffer> <silent> \+caa :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch all")
inoremap <buffer> <silent> \+ca :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch")
inoremap <buffer> <silent> \+tr :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.try catch")
inoremap <buffer> <silent> \+ioi :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, in")
inoremap <buffer> <silent> \+ioo :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, out")
inoremap <buffer> <silent> \+tf :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template function")
inoremap <buffer> <silent> \+ita :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template accessor")
inoremap <buffer> <silent> \+itm :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template method")
inoremap <buffer> <silent> \+itcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class using new")
inoremap <buffer> <silent> \+itc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class")
inoremap <buffer> <silent> \+ia :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.accessor")
inoremap <buffer> <silent> \+im :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.method")
inoremap <buffer> <silent> \+icn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class using new")
inoremap <buffer> <silent> \+ic :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class")
inoremap <buffer> <silent> \+ec :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.error class")
inoremap <buffer> <silent> \+tcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class using new")
inoremap <buffer> <silent> \+tc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class")
inoremap <buffer> <silent> \+cn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class using new")
inoremap <buffer> <silent> \+c :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class")
inoremap <buffer> <silent> \+fb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.ios flagbits")
inoremap <buffer> <silent> \+om :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.output manipulators")
inoremap <buffer> <silent> \+ich :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C std lib header")
inoremap <buffer> <silent> \+ih :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C++ std lib header")
inoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.macros")
inoremap <buffer> <silent> \csc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.special comments")
inoremap <buffer> <silent> \ckc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.keyword comments")
inoremap <buffer> <silent> \chs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.H file sections")
inoremap <buffer> <silent> \ccs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.C file sections")
inoremap <buffer> <silent> \cfdh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description header")
inoremap <buffer> <silent> \cfdi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description impl")
inoremap <buffer> <silent> \ccl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.class")
inoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.method")
inoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.function")
inoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.frame")
inoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:C_Templates,"Snippets.jump tags")
imap <buffer> <silent> \hm :call C_Help("m")
imap <buffer> <silent> \hp :call C_HelpCsupport()
imap <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()
imap <buffer> <silent> \rx :call C_XtermSize()
imap <buffer> <silent> \rs :call C_Settings()
imap <buffer> <silent> \rh :call C_Hardcopy()
imap <buffer> <silent> \ri :call C_Indent()
imap <buffer> <silent> \rccs :call C_CppcheckSeverityInput()
imap <buffer> <silent> \rcc :call C_CppcheckCheck()
imap <buffer> <silent> \rpa :call C_SplintArguments()
imap <buffer> <silent> \rp :call C_SplintCheck()
imap <buffer> <silent> \rma :call C_MakeArguments()
imap <buffer> <silent> \rme :call C_ExeToRun()
imap <buffer> <silent> \rmc :call C_MakeClean()
imap <buffer> <silent> \rcm :call C_ChooseMakefile()
imap <buffer> <silent> \rm :call C_Make()
imap <buffer> <silent> \ra :call C_Arguments()
imap <buffer> <silent> \rr :call C_Run()
imap <buffer> <silent> \rl :call C_Link()
imap <buffer> <silent> \rc :call C_Compile()
inoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:C_Templates,"!pick")
inoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:C_Templates,"reload","all")
inoremap <buffer> <silent> \ntg :call mmtemplates#core#EditTemplateFiles(g:C_Templates,1)
inoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:C_Templates,-1)
inoremap <buffer> <silent> \ns :call C_ProtoShow()
inoremap <buffer> <silent> \nc :call C_ProtoClear()
inoremap <buffer> <silent> \ni :call C_ProtoInsert()
inoremap <buffer> <silent> \nm :call C_ProtoPick("method")
inoremap <buffer> <silent> \nf :call C_ProtoPick("function")
inoremap <buffer> <silent> \np :call C_ProtoPick("function")
inoremap <buffer> <silent> \ne :call C_CodeSnippet("e")
inoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
inoremap <buffer> <silent> \nv :call C_CodeSnippet("view")
inoremap <buffer> <silent> \nr :call C_CodeSnippet("r")
inoremap <buffer> <silent> \in :call C_CodeFor("down"    )
inoremap <buffer> <silent> \i0 :call C_CodeFor("up"    )
inoremap <buffer> <silent> \pr0 :call C_PPIf0Remove()
inoremap <buffer> <silent> \pi0 :call C_PPIf0("a")
inoremap <buffer> <silent> \cx :call C_CommentToggle( )
inoremap <buffer> <silent> \ct :call C_InsertDateAndTime('dt')
inoremap <buffer> <silent> \cd :call C_InsertDateAndTime('d')
inoremap <buffer> <silent> \cj :call C_AdjustLineEndComm()
inoremap <buffer> <silent> \cl :call C_EndOfLineComment()
inoremap <buffer> {
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=/usr/share/vim/vimfiles/c-support/wordlists/c-c++-keywords.list,/usr/share/vim/vimfiles/c-support/wordlists/k+r.list,/usr/share/vim/vimfiles/c-support/wordlists/stl_index.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'cpp'
setlocal filetype=cpp
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=ccomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=de
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'cpp'
setlocal syntax=cpp
endif
setlocal tabstop=8
setlocal tagcase=
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 55 - ((6 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
55
normal! 0
tabedit README
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
9argu
edit README
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=fb:-,fb:*
setlocal commentstring=
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'text'
setlocal filetype=text
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=de
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'text'
setlocal syntax=text
endif
setlocal tabstop=8
setlocal tagcase=
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 129 - ((23 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
129
normal! 0120|
tabedit src/parameter_return.cpp
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
edit src/parameter_return.cpp
let s:cpo_save=&cpo
set cpo&vim
imap <buffer> <silent> <S-F9> :call C_Arguments()
imap <buffer> <silent> <C-F9> :call C_Run()
imap <buffer> <silent> <F9> :call C_Link()
imap <buffer> <silent> <M-F9> :call C_Compile()
nmap <buffer> <silent> <NL> i=C_JumpCtrlJ()
vnoremap <buffer> /* s/*  */<Left><Left><Left>p
nmap <buffer> <silent> \rh :call C_Hardcopy()
nnoremap <buffer> <silent> \nm :call C_ProtoPick("method")
nnoremap <buffer> <silent> \nf :call C_ProtoPick("function")
nnoremap <buffer> <silent> \np :call C_ProtoPick("function")
nnoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
nnoremap <buffer> <silent> \in :call C_CodeFor("down"    )
nnoremap <buffer> <silent> \i0 :call C_CodeFor("up"    )
nnoremap <buffer> <silent> \pi0 :call C_PPIf0("a")
nnoremap <buffer> <silent> \cx :call C_CommentToggle( )
nnoremap <buffer> <silent> \ct :call C_InsertDateAndTime('dt')
nnoremap <buffer> <silent> \cd :call C_InsertDateAndTime('d')
nnoremap <buffer> <silent> \co :call C_CommentToCode()
nnoremap <buffer> <silent> \cc :call C_CodeToCommentCpp()
nnoremap <buffer> <silent> \c* :call C_CodeToCommentC()
vmap <buffer> <silent> \rh :call C_Hardcopy()
vnoremap <buffer> <silent> \nm :call C_ProtoPick("method")
vnoremap <buffer> <silent> \nf :call C_ProtoPick("function")
vnoremap <buffer> <silent> \np :call C_ProtoPick("function")
vnoremap <buffer> <silent> \nw :call C_CodeSnippet("wv")
vnoremap <buffer> <silent> \in :call C_CodeFor("down","v")
vnoremap <buffer> <silent> \i0 :call C_CodeFor("up","v")
vnoremap <buffer> <silent> \pi0 :call C_PPIf0("v")
vnoremap <buffer> <silent> \cx :call C_CommentToggle( )
vnoremap <buffer> <silent> \ct s:call C_InsertDateAndTime('dt')
vnoremap <buffer> <silent> \cd s:call C_InsertDateAndTime('d')
vnoremap <buffer> <silent> \co :call C_CommentToCode()
vnoremap <buffer> <silent> \cc :call C_CodeToCommentCpp()
vnoremap <buffer> <silent> \c* :call C_CodeToCommentC()
vnoremap <buffer> <silent> \sb :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.block","v")
nnoremap <buffer> <silent> \sb :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.block")
vnoremap <buffer> <silent> \sc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.case")
nnoremap <buffer> <silent> \sc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.case")
vnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while block","v")
nnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while block")
vnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while")
nnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while")
vnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.else block","v")
nnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.else block")
vnoremap <buffer> <silent> \sife :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block else","v")
nnoremap <buffer> <silent> \sife :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block else")
vnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if else","v")
nnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if else")
vnoremap <buffer> <silent> \sif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block","v")
nnoremap <buffer> <silent> \sif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block")
vnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if")
nnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if")
vnoremap <buffer> <silent> \sfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.range-based for","v")
nnoremap <buffer> <silent> \sfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.range-based for")
vnoremap <buffer> <silent> \sfo :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for block","v")
nnoremap <buffer> <silent> \sfo :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for block")
vnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for")
nnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for")
vnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.do while","v")
nnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.do while")
vnoremap <buffer> <silent> \pw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.warning")
nnoremap <buffer> <silent> \pw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.warning")
vnoremap <buffer> <silent> \pp :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.pragma")
nnoremap <buffer> <silent> \pp :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.pragma")
vnoremap <buffer> <silent> \pli :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.line")
nnoremap <buffer> <silent> \pli :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.line")
vnoremap <buffer> <silent> \pe :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.error")
nnoremap <buffer> <silent> \pe :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.error")
vnoremap <buffer> <silent> \pind :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-def-endif","v")
nnoremap <buffer> <silent> \pind :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-def-endif")
vnoremap <buffer> <silent> \pin :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-else-endif","v")
nnoremap <buffer> <silent> \pin :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-else-endif")
vnoremap <buffer> <silent> \pid :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifdef-else-endif","v")
nnoremap <buffer> <silent> \pid :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifdef-else-endif")
vnoremap <buffer> <silent> \pie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-else-endif","v")
nnoremap <buffer> <silent> \pie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-else-endif")
vnoremap <buffer> <silent> \pif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-endif","v")
nnoremap <buffer> <silent> \pif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-endif")
vnoremap <buffer> <silent> \pu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.undefine")
nnoremap <buffer> <silent> \pu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.undefine")
vnoremap <buffer> <silent> \pd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.define")
nnoremap <buffer> <silent> \pd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.define")
vnoremap <buffer> <silent> \pl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-local")
nnoremap <buffer> <silent> \pl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-local")
vnoremap <buffer> <silent> \pg :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-global")
nnoremap <buffer> <silent> \pg :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-global")
vnoremap <buffer> <silent> \pih :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include std lib header")
nnoremap <buffer> <silent> \pih :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include std lib header")
vnoremap <buffer> <silent> \ifpr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fscanf")
nnoremap <buffer> <silent> \ifpr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fscanf")
vnoremap <buffer> <silent> \ifsc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fprintf")
nnoremap <buffer> <silent> \ifsc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fprintf")
vnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-output-file","v")
nnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-output-file")
vnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-input-file","v")
nnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-input-file")
vnoremap <buffer> <silent> \ias :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.assert","v")
nnoremap <buffer> <silent> \ias :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.assert")
vnoremap <buffer> <silent> \isi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.sizeof","v")
nnoremap <buffer> <silent> \isi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.sizeof")
vnoremap <buffer> <silent> \ire :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.realloc")
nnoremap <buffer> <silent> \ire :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.realloc")
vnoremap <buffer> <silent> \ima :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.malloc")
nnoremap <buffer> <silent> \ima :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.malloc")
vnoremap <buffer> <silent> \ica :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.calloc")
nnoremap <buffer> <silent> \ica :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.calloc")
vnoremap <buffer> <silent> \ipr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.printf")
nnoremap <buffer> <silent> \ipr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.printf")
vnoremap <buffer> <silent> \isc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.scanf")
nnoremap <buffer> <silent> \isc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.scanf")
vnoremap <buffer> <silent> \iu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.union","v")
nnoremap <buffer> <silent> \iu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.union")
vnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.struct","v")
nnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.struct")
vnoremap <buffer> <silent> \ie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.enum","v")
nnoremap <buffer> <silent> \ie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.enum")
vnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.main","v")
nnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.main")
vnoremap <buffer> <silent> \isf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function-static","v")
nnoremap <buffer> <silent> \isf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function-static")
vnoremap <buffer> <silent> \if :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function","v")
nnoremap <buffer> <silent> \if :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function")
vnoremap <buffer> <silent> \+rt :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.RTTI","v")
nnoremap <buffer> <silent> \+rt :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.RTTI")
vnoremap <buffer> <silent> \+na :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace alias")
nnoremap <buffer> <silent> \+na :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace alias")
vnoremap <buffer> <silent> \+unb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace block xxx","v")
nnoremap <buffer> <silent> \+unb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace block xxx")
vnoremap <buffer> <silent> \+un :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace xxx")
nnoremap <buffer> <silent> \+un :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace xxx")
vnoremap <buffer> <silent> \+uns :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace std")
nnoremap <buffer> <silent> \+uns :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace std")
vnoremap <buffer> <silent> \+oof :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open output file","v")
nnoremap <buffer> <silent> \+oof :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open output file")
vnoremap <buffer> <silent> \+oif :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open input file","v")
nnoremap <buffer> <silent> \+oif :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open input file")
vnoremap <buffer> <silent> \+ex :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.extern C","v")
nnoremap <buffer> <silent> \+ex :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.extern C")
vnoremap <buffer> <silent> \+caa :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch all","v")
nnoremap <buffer> <silent> \+caa :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch all")
vnoremap <buffer> <silent> \+ca :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch","v")
nnoremap <buffer> <silent> \+ca :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch")
vnoremap <buffer> <silent> \+tr :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.try catch","v")
nnoremap <buffer> <silent> \+tr :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.try catch")
vnoremap <buffer> <silent> \+ioi :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, in")
nnoremap <buffer> <silent> \+ioi :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, in")
vnoremap <buffer> <silent> \+ioo :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, out")
nnoremap <buffer> <silent> \+ioo :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, out")
vnoremap <buffer> <silent> \+tf :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template function")
nnoremap <buffer> <silent> \+tf :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template function")
vnoremap <buffer> <silent> \+ita :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template accessor")
nnoremap <buffer> <silent> \+ita :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template accessor")
vnoremap <buffer> <silent> \+itm :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template method")
nnoremap <buffer> <silent> \+itm :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template method")
vnoremap <buffer> <silent> \+itcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class using new")
nnoremap <buffer> <silent> \+itcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class using new")
vnoremap <buffer> <silent> \+itc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class")
nnoremap <buffer> <silent> \+itc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class")
vnoremap <buffer> <silent> \+ia :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.accessor")
nnoremap <buffer> <silent> \+ia :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.accessor")
vnoremap <buffer> <silent> \+im :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.method")
nnoremap <buffer> <silent> \+im :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.method")
vnoremap <buffer> <silent> \+icn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class using new")
nnoremap <buffer> <silent> \+icn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class using new")
vnoremap <buffer> <silent> \+ic :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class")
nnoremap <buffer> <silent> \+ic :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class")
vnoremap <buffer> <silent> \+ec :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.error class")
nnoremap <buffer> <silent> \+ec :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.error class")
vnoremap <buffer> <silent> \+tcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class using new")
nnoremap <buffer> <silent> \+tcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class using new")
vnoremap <buffer> <silent> \+tc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class")
nnoremap <buffer> <silent> \+tc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class")
vnoremap <buffer> <silent> \+cn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class using new")
nnoremap <buffer> <silent> \+cn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class using new")
vnoremap <buffer> <silent> \+c :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class")
nnoremap <buffer> <silent> \+c :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class")
vnoremap <buffer> <silent> \+fb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.ios flagbits")
nnoremap <buffer> <silent> \+fb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.ios flagbits")
vnoremap <buffer> <silent> \+om :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.output manipulators")
nnoremap <buffer> <silent> \+om :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.output manipulators")
vnoremap <buffer> <silent> \+ich :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C std lib header")
nnoremap <buffer> <silent> \+ich :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C std lib header")
vnoremap <buffer> <silent> \+ih :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C++ std lib header")
nnoremap <buffer> <silent> \+ih :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C++ std lib header")
vnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.macros")
nnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.macros")
vnoremap <buffer> <silent> \csc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.special comments")
nnoremap <buffer> <silent> \csc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.special comments")
vnoremap <buffer> <silent> \ckc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.keyword comments")
nnoremap <buffer> <silent> \ckc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.keyword comments")
vnoremap <buffer> <silent> \chs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.H file sections")
nnoremap <buffer> <silent> \chs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.H file sections")
vnoremap <buffer> <silent> \ccs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.C file sections")
nnoremap <buffer> <silent> \ccs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.C file sections")
vnoremap <buffer> <silent> \cfdh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description header")
nnoremap <buffer> <silent> \cfdh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description header")
vnoremap <buffer> <silent> \cfdi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description impl")
nnoremap <buffer> <silent> \cfdi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description impl")
vnoremap <buffer> <silent> \ccl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.class")
nnoremap <buffer> <silent> \ccl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.class")
vnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.method")
nnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.method")
vnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.function")
nnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.function")
vnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.frame")
nnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.frame")
vnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:C_Templates,"Snippets.jump tags")
nnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:C_Templates,"Snippets.jump tags")
map <buffer> <silent> \hm :call C_Help("m")
map <buffer> <silent> \hp :call C_HelpCsupport()
map <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call C_XtermSize()
map <buffer> <silent> \rs :call C_Settings()
omap <buffer> <silent> \rh :call C_Hardcopy()
map <buffer> <silent> \ri :call C_Indent()
map <buffer> <silent> \rccs :call C_CppcheckSeverityInput()
map <buffer> <silent> \rcc :call C_CppcheckCheck()
map <buffer> <silent> \rpa :call C_SplintArguments()
map <buffer> <silent> \rp :call C_SplintCheck()
map <buffer> <silent> \rma :call C_MakeArguments()
map <buffer> <silent> \rme :call C_ExeToRun()
map <buffer> <silent> \rmc :call C_MakeClean()
map <buffer> <silent> \rcm :call C_ChooseMakefile()
map <buffer> <silent> \rm :call C_Make()
map <buffer> <silent> \ra :call C_Arguments()
map <buffer> <silent> \rr :call C_Run()
map <buffer> <silent> \rl :call C_Link()
map <buffer> <silent> \rc :call C_Compile()
nnoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:C_Templates,"!pick")
nnoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:C_Templates,"reload","all")
nnoremap <buffer> <silent> \ntg :call mmtemplates#core#EditTemplateFiles(g:C_Templates,1)
nnoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:C_Templates,-1)
noremap <buffer> <silent> \ns :call C_ProtoShow()
noremap <buffer> <silent> \nc :call C_ProtoClear()
noremap <buffer> <silent> \ni :call C_ProtoInsert()
onoremap <buffer> <silent> \nm :call C_ProtoPick("method")
onoremap <buffer> <silent> \nf :call C_ProtoPick("function")
onoremap <buffer> <silent> \np :call C_ProtoPick("function")
noremap <buffer> <silent> \ne :call C_CodeSnippet("e")
onoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
noremap <buffer> <silent> \nv :call C_CodeSnippet("view")
noremap <buffer> <silent> \nr :call C_CodeSnippet("r")
onoremap <buffer> <silent> \in :call C_CodeFor("down"    )
onoremap <buffer> <silent> \i0 :call C_CodeFor("up"    )
noremap <buffer> <silent> \pr0 :call C_PPIf0Remove()
onoremap <buffer> <silent> \pi0 :call C_PPIf0("a")
onoremap <buffer> <silent> \cx :call C_CommentToggle( )
onoremap <buffer> <silent> \ct :call C_InsertDateAndTime('dt')
onoremap <buffer> <silent> \cd :call C_InsertDateAndTime('d')
onoremap <buffer> <silent> \co :call C_CommentToCode()
onoremap <buffer> <silent> \cc :call C_CodeToCommentCpp()
onoremap <buffer> <silent> \c* :call C_CodeToCommentC()
noremap <buffer> <silent> \cs :call C_GetLineEndCommCol()
vnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm()
nnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm()
noremap <buffer> <silent> \cl :call C_EndOfLineComment()
vnoremap <buffer> {
map <buffer> <silent> <S-F9> :call C_Arguments()
map <buffer> <silent> <C-F9> :call C_Run()
map <buffer> <silent> <F9> :call C_Link()
map <buffer> <silent> <M-F9> :call C_Compile()
imap <buffer> <silent> <NL> =C_JumpCtrlJ()
inoremap <buffer> /*
inoremap <buffer> /* /*  */<Left><Left><Left>
inoremap <buffer> <silent> \sb :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.block")
inoremap <buffer> <silent> \sc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.case")
inoremap <buffer> <silent> \ss :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.switch")
inoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while block")
inoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while")
inoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.else block")
inoremap <buffer> <silent> \sife :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block else")
inoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if else")
inoremap <buffer> <silent> \sif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block")
inoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if")
inoremap <buffer> <silent> \sfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.range-based for")
inoremap <buffer> <silent> \sfo :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for block")
inoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for")
inoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.do while")
inoremap <buffer> <silent> \pw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.warning")
inoremap <buffer> <silent> \pp :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.pragma")
inoremap <buffer> <silent> \pli :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.line")
inoremap <buffer> <silent> \pe :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.error")
inoremap <buffer> <silent> \pind :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-def-endif")
inoremap <buffer> <silent> \pin :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-else-endif")
inoremap <buffer> <silent> \pid :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifdef-else-endif")
inoremap <buffer> <silent> \pie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-else-endif")
inoremap <buffer> <silent> \pif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-endif")
inoremap <buffer> <silent> \pu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.undefine")
inoremap <buffer> <silent> \pd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.define")
inoremap <buffer> <silent> \pl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-local")
inoremap <buffer> <silent> \pg :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-global")
inoremap <buffer> <silent> \pih :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include std lib header")
inoremap <buffer> <silent> \ifpr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fscanf")
inoremap <buffer> <silent> \ifsc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fprintf")
inoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-output-file")
inoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-input-file")
inoremap <buffer> <silent> \ias :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.assert")
inoremap <buffer> <silent> \isi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.sizeof")
inoremap <buffer> <silent> \ire :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.realloc")
inoremap <buffer> <silent> \ima :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.malloc")
inoremap <buffer> <silent> \ica :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.calloc")
inoremap <buffer> <silent> \ipr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.printf")
inoremap <buffer> <silent> \isc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.scanf")
inoremap <buffer> <silent> \iu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.union")
inoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.struct")
inoremap <buffer> <silent> \ie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.enum")
inoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.main")
inoremap <buffer> <silent> \isf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function-static")
inoremap <buffer> <silent> \if :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function")
inoremap <buffer> <silent> \+rt :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.RTTI")
inoremap <buffer> <silent> \+na :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace alias")
inoremap <buffer> <silent> \+unb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace block xxx")
inoremap <buffer> <silent> \+un :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace xxx")
inoremap <buffer> <silent> \+uns :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace std")
inoremap <buffer> <silent> \+oof :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open output file")
inoremap <buffer> <silent> \+oif :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open input file")
inoremap <buffer> <silent> \+ex :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.extern C")
inoremap <buffer> <silent> \+caa :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch all")
inoremap <buffer> <silent> \+ca :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch")
inoremap <buffer> <silent> \+tr :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.try catch")
inoremap <buffer> <silent> \+ioi :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, in")
inoremap <buffer> <silent> \+ioo :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, out")
inoremap <buffer> <silent> \+tf :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template function")
inoremap <buffer> <silent> \+ita :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template accessor")
inoremap <buffer> <silent> \+itm :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template method")
inoremap <buffer> <silent> \+itcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class using new")
inoremap <buffer> <silent> \+itc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class")
inoremap <buffer> <silent> \+ia :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.accessor")
inoremap <buffer> <silent> \+im :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.method")
inoremap <buffer> <silent> \+icn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class using new")
inoremap <buffer> <silent> \+ic :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class")
inoremap <buffer> <silent> \+ec :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.error class")
inoremap <buffer> <silent> \+tcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class using new")
inoremap <buffer> <silent> \+tc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class")
inoremap <buffer> <silent> \+cn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class using new")
inoremap <buffer> <silent> \+c :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class")
inoremap <buffer> <silent> \+fb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.ios flagbits")
inoremap <buffer> <silent> \+om :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.output manipulators")
inoremap <buffer> <silent> \+ich :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C std lib header")
inoremap <buffer> <silent> \+ih :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C++ std lib header")
inoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.macros")
inoremap <buffer> <silent> \csc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.special comments")
inoremap <buffer> <silent> \ckc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.keyword comments")
inoremap <buffer> <silent> \chs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.H file sections")
inoremap <buffer> <silent> \ccs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.C file sections")
inoremap <buffer> <silent> \cfdh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description header")
inoremap <buffer> <silent> \cfdi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description impl")
inoremap <buffer> <silent> \ccl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.class")
inoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.method")
inoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.function")
inoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.frame")
inoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:C_Templates,"Snippets.jump tags")
imap <buffer> <silent> \hm :call C_Help("m")
imap <buffer> <silent> \hp :call C_HelpCsupport()
imap <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()
imap <buffer> <silent> \rx :call C_XtermSize()
imap <buffer> <silent> \rs :call C_Settings()
imap <buffer> <silent> \rh :call C_Hardcopy()
imap <buffer> <silent> \ri :call C_Indent()
imap <buffer> <silent> \rccs :call C_CppcheckSeverityInput()
imap <buffer> <silent> \rcc :call C_CppcheckCheck()
imap <buffer> <silent> \rpa :call C_SplintArguments()
imap <buffer> <silent> \rp :call C_SplintCheck()
imap <buffer> <silent> \rma :call C_MakeArguments()
imap <buffer> <silent> \rme :call C_ExeToRun()
imap <buffer> <silent> \rmc :call C_MakeClean()
imap <buffer> <silent> \rcm :call C_ChooseMakefile()
imap <buffer> <silent> \rm :call C_Make()
imap <buffer> <silent> \ra :call C_Arguments()
imap <buffer> <silent> \rr :call C_Run()
imap <buffer> <silent> \rl :call C_Link()
imap <buffer> <silent> \rc :call C_Compile()
inoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:C_Templates,"!pick")
inoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:C_Templates,"reload","all")
inoremap <buffer> <silent> \ntg :call mmtemplates#core#EditTemplateFiles(g:C_Templates,1)
inoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:C_Templates,-1)
inoremap <buffer> <silent> \ns :call C_ProtoShow()
inoremap <buffer> <silent> \nc :call C_ProtoClear()
inoremap <buffer> <silent> \ni :call C_ProtoInsert()
inoremap <buffer> <silent> \nm :call C_ProtoPick("method")
inoremap <buffer> <silent> \nf :call C_ProtoPick("function")
inoremap <buffer> <silent> \np :call C_ProtoPick("function")
inoremap <buffer> <silent> \ne :call C_CodeSnippet("e")
inoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
inoremap <buffer> <silent> \nv :call C_CodeSnippet("view")
inoremap <buffer> <silent> \nr :call C_CodeSnippet("r")
inoremap <buffer> <silent> \in :call C_CodeFor("down"    )
inoremap <buffer> <silent> \i0 :call C_CodeFor("up"    )
inoremap <buffer> <silent> \pr0 :call C_PPIf0Remove()
inoremap <buffer> <silent> \pi0 :call C_PPIf0("a")
inoremap <buffer> <silent> \cx :call C_CommentToggle( )
inoremap <buffer> <silent> \ct :call C_InsertDateAndTime('dt')
inoremap <buffer> <silent> \cd :call C_InsertDateAndTime('d')
inoremap <buffer> <silent> \cj :call C_AdjustLineEndComm()
inoremap <buffer> <silent> \cl :call C_EndOfLineComment()
inoremap <buffer> {
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=/usr/share/vim/vimfiles/c-support/wordlists/c-c++-keywords.list,/usr/share/vim/vimfiles/c-support/wordlists/k+r.list,/usr/share/vim/vimfiles/c-support/wordlists/stl_index.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'cpp'
setlocal filetype=cpp
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=ccomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=de
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'cpp'
setlocal syntax=cpp
endif
setlocal tabstop=8
setlocal tagcase=
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 85 - ((9 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
85
normal! 0
tabedit inc/parameter_return.h
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
edit inc/parameter_return.h
let s:cpo_save=&cpo
set cpo&vim
imap <buffer> <silent> <S-F9> :call C_Arguments()
imap <buffer> <silent> <C-F9> :call C_Run()
imap <buffer> <silent> <F9> :call C_Link()
imap <buffer> <silent> <M-F9> :call C_Compile()
nmap <buffer> <silent> <NL> i=C_JumpCtrlJ()
vnoremap <buffer> /* s/*  */<Left><Left><Left>p
nmap <buffer> <silent> \rh :call C_Hardcopy()
nnoremap <buffer> <silent> \nm :call C_ProtoPick("method")
nnoremap <buffer> <silent> \nf :call C_ProtoPick("function")
nnoremap <buffer> <silent> \np :call C_ProtoPick("function")
nnoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
nnoremap <buffer> <silent> \in :call C_CodeFor("down"    )
nnoremap <buffer> <silent> \i0 :call C_CodeFor("up"    )
nnoremap <buffer> <silent> \pi0 :call C_PPIf0("a")
nnoremap <buffer> <silent> \cx :call C_CommentToggle( )
nnoremap <buffer> <silent> \ct :call C_InsertDateAndTime('dt')
nnoremap <buffer> <silent> \cd :call C_InsertDateAndTime('d')
nnoremap <buffer> <silent> \co :call C_CommentToCode()
nnoremap <buffer> <silent> \cc :call C_CodeToCommentCpp()
nnoremap <buffer> <silent> \c* :call C_CodeToCommentC()
vmap <buffer> <silent> \rh :call C_Hardcopy()
vnoremap <buffer> <silent> \nm :call C_ProtoPick("method")
vnoremap <buffer> <silent> \nf :call C_ProtoPick("function")
vnoremap <buffer> <silent> \np :call C_ProtoPick("function")
vnoremap <buffer> <silent> \nw :call C_CodeSnippet("wv")
vnoremap <buffer> <silent> \in :call C_CodeFor("down","v")
vnoremap <buffer> <silent> \i0 :call C_CodeFor("up","v")
vnoremap <buffer> <silent> \pi0 :call C_PPIf0("v")
vnoremap <buffer> <silent> \cx :call C_CommentToggle( )
vnoremap <buffer> <silent> \ct s:call C_InsertDateAndTime('dt')
vnoremap <buffer> <silent> \cd s:call C_InsertDateAndTime('d')
vnoremap <buffer> <silent> \co :call C_CommentToCode()
vnoremap <buffer> <silent> \cc :call C_CodeToCommentCpp()
vnoremap <buffer> <silent> \c* :call C_CodeToCommentC()
vnoremap <buffer> <silent> \sb :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.block","v")
nnoremap <buffer> <silent> \sb :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.block")
vnoremap <buffer> <silent> \sc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.case")
nnoremap <buffer> <silent> \sc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.case")
vnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while block","v")
nnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while block")
vnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while")
nnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while")
vnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.else block","v")
nnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.else block")
vnoremap <buffer> <silent> \sife :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block else","v")
nnoremap <buffer> <silent> \sife :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block else")
vnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if else","v")
nnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if else")
vnoremap <buffer> <silent> \sif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block","v")
nnoremap <buffer> <silent> \sif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block")
vnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if")
nnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if")
vnoremap <buffer> <silent> \sfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.range-based for","v")
nnoremap <buffer> <silent> \sfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.range-based for")
vnoremap <buffer> <silent> \sfo :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for block","v")
nnoremap <buffer> <silent> \sfo :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for block")
vnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for")
nnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for")
vnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.do while","v")
nnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.do while")
vnoremap <buffer> <silent> \pw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.warning")
nnoremap <buffer> <silent> \pw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.warning")
vnoremap <buffer> <silent> \pp :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.pragma")
nnoremap <buffer> <silent> \pp :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.pragma")
vnoremap <buffer> <silent> \pli :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.line")
nnoremap <buffer> <silent> \pli :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.line")
vnoremap <buffer> <silent> \pe :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.error")
nnoremap <buffer> <silent> \pe :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.error")
vnoremap <buffer> <silent> \pind :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-def-endif","v")
nnoremap <buffer> <silent> \pind :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-def-endif")
vnoremap <buffer> <silent> \pin :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-else-endif","v")
nnoremap <buffer> <silent> \pin :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-else-endif")
vnoremap <buffer> <silent> \pid :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifdef-else-endif","v")
nnoremap <buffer> <silent> \pid :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifdef-else-endif")
vnoremap <buffer> <silent> \pie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-else-endif","v")
nnoremap <buffer> <silent> \pie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-else-endif")
vnoremap <buffer> <silent> \pif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-endif","v")
nnoremap <buffer> <silent> \pif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-endif")
vnoremap <buffer> <silent> \pu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.undefine")
nnoremap <buffer> <silent> \pu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.undefine")
vnoremap <buffer> <silent> \pd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.define")
nnoremap <buffer> <silent> \pd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.define")
vnoremap <buffer> <silent> \pl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-local")
nnoremap <buffer> <silent> \pl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-local")
vnoremap <buffer> <silent> \pg :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-global")
nnoremap <buffer> <silent> \pg :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-global")
vnoremap <buffer> <silent> \pih :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include std lib header")
nnoremap <buffer> <silent> \pih :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include std lib header")
vnoremap <buffer> <silent> \ifpr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fscanf")
nnoremap <buffer> <silent> \ifpr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fscanf")
vnoremap <buffer> <silent> \ifsc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fprintf")
nnoremap <buffer> <silent> \ifsc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fprintf")
vnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-output-file","v")
nnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-output-file")
vnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-input-file","v")
nnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-input-file")
vnoremap <buffer> <silent> \ias :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.assert","v")
nnoremap <buffer> <silent> \ias :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.assert")
vnoremap <buffer> <silent> \isi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.sizeof","v")
nnoremap <buffer> <silent> \isi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.sizeof")
vnoremap <buffer> <silent> \ire :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.realloc")
nnoremap <buffer> <silent> \ire :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.realloc")
vnoremap <buffer> <silent> \ima :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.malloc")
nnoremap <buffer> <silent> \ima :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.malloc")
vnoremap <buffer> <silent> \ica :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.calloc")
nnoremap <buffer> <silent> \ica :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.calloc")
vnoremap <buffer> <silent> \ipr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.printf")
nnoremap <buffer> <silent> \ipr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.printf")
vnoremap <buffer> <silent> \isc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.scanf")
nnoremap <buffer> <silent> \isc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.scanf")
vnoremap <buffer> <silent> \iu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.union","v")
nnoremap <buffer> <silent> \iu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.union")
vnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.struct","v")
nnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.struct")
vnoremap <buffer> <silent> \ie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.enum","v")
nnoremap <buffer> <silent> \ie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.enum")
vnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.main","v")
nnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.main")
vnoremap <buffer> <silent> \isf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function-static","v")
nnoremap <buffer> <silent> \isf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function-static")
vnoremap <buffer> <silent> \if :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function","v")
nnoremap <buffer> <silent> \if :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function")
vnoremap <buffer> <silent> \+rt :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.RTTI","v")
nnoremap <buffer> <silent> \+rt :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.RTTI")
vnoremap <buffer> <silent> \+na :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace alias")
nnoremap <buffer> <silent> \+na :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace alias")
vnoremap <buffer> <silent> \+unb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace block xxx","v")
nnoremap <buffer> <silent> \+unb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace block xxx")
vnoremap <buffer> <silent> \+un :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace xxx")
nnoremap <buffer> <silent> \+un :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace xxx")
vnoremap <buffer> <silent> \+uns :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace std")
nnoremap <buffer> <silent> \+uns :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace std")
vnoremap <buffer> <silent> \+oof :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open output file","v")
nnoremap <buffer> <silent> \+oof :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open output file")
vnoremap <buffer> <silent> \+oif :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open input file","v")
nnoremap <buffer> <silent> \+oif :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open input file")
vnoremap <buffer> <silent> \+ex :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.extern C","v")
nnoremap <buffer> <silent> \+ex :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.extern C")
vnoremap <buffer> <silent> \+caa :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch all","v")
nnoremap <buffer> <silent> \+caa :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch all")
vnoremap <buffer> <silent> \+ca :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch","v")
nnoremap <buffer> <silent> \+ca :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch")
vnoremap <buffer> <silent> \+tr :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.try catch","v")
nnoremap <buffer> <silent> \+tr :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.try catch")
vnoremap <buffer> <silent> \+ioi :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, in")
nnoremap <buffer> <silent> \+ioi :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, in")
vnoremap <buffer> <silent> \+ioo :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, out")
nnoremap <buffer> <silent> \+ioo :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, out")
vnoremap <buffer> <silent> \+tf :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template function")
nnoremap <buffer> <silent> \+tf :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template function")
vnoremap <buffer> <silent> \+ita :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template accessor")
nnoremap <buffer> <silent> \+ita :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template accessor")
vnoremap <buffer> <silent> \+itm :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template method")
nnoremap <buffer> <silent> \+itm :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template method")
vnoremap <buffer> <silent> \+itcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class using new")
nnoremap <buffer> <silent> \+itcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class using new")
vnoremap <buffer> <silent> \+itc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class")
nnoremap <buffer> <silent> \+itc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class")
vnoremap <buffer> <silent> \+ia :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.accessor")
nnoremap <buffer> <silent> \+ia :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.accessor")
vnoremap <buffer> <silent> \+im :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.method")
nnoremap <buffer> <silent> \+im :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.method")
vnoremap <buffer> <silent> \+icn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class using new")
nnoremap <buffer> <silent> \+icn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class using new")
vnoremap <buffer> <silent> \+ic :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class")
nnoremap <buffer> <silent> \+ic :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class")
vnoremap <buffer> <silent> \+ec :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.error class")
nnoremap <buffer> <silent> \+ec :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.error class")
vnoremap <buffer> <silent> \+tcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class using new")
nnoremap <buffer> <silent> \+tcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class using new")
vnoremap <buffer> <silent> \+tc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class")
nnoremap <buffer> <silent> \+tc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class")
vnoremap <buffer> <silent> \+cn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class using new")
nnoremap <buffer> <silent> \+cn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class using new")
vnoremap <buffer> <silent> \+c :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class")
nnoremap <buffer> <silent> \+c :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class")
vnoremap <buffer> <silent> \+fb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.ios flagbits")
nnoremap <buffer> <silent> \+fb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.ios flagbits")
vnoremap <buffer> <silent> \+om :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.output manipulators")
nnoremap <buffer> <silent> \+om :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.output manipulators")
vnoremap <buffer> <silent> \+ich :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C std lib header")
nnoremap <buffer> <silent> \+ich :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C std lib header")
vnoremap <buffer> <silent> \+ih :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C++ std lib header")
nnoremap <buffer> <silent> \+ih :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C++ std lib header")
vnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.macros")
nnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.macros")
vnoremap <buffer> <silent> \csc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.special comments")
nnoremap <buffer> <silent> \csc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.special comments")
vnoremap <buffer> <silent> \ckc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.keyword comments")
nnoremap <buffer> <silent> \ckc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.keyword comments")
vnoremap <buffer> <silent> \chs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.H file sections")
nnoremap <buffer> <silent> \chs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.H file sections")
vnoremap <buffer> <silent> \ccs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.C file sections")
nnoremap <buffer> <silent> \ccs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.C file sections")
vnoremap <buffer> <silent> \cfdh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description header")
nnoremap <buffer> <silent> \cfdh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description header")
vnoremap <buffer> <silent> \cfdi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description impl")
nnoremap <buffer> <silent> \cfdi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description impl")
vnoremap <buffer> <silent> \ccl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.class")
nnoremap <buffer> <silent> \ccl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.class")
vnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.method")
nnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.method")
vnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.function")
nnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.function")
vnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.frame")
nnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.frame")
vnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:C_Templates,"Snippets.jump tags")
nnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:C_Templates,"Snippets.jump tags")
map <buffer> <silent> \hm :call C_Help("m")
map <buffer> <silent> \hp :call C_HelpCsupport()
map <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()
map <buffer> <silent> \rx :call C_XtermSize()
map <buffer> <silent> \rs :call C_Settings()
omap <buffer> <silent> \rh :call C_Hardcopy()
map <buffer> <silent> \ri :call C_Indent()
map <buffer> <silent> \rccs :call C_CppcheckSeverityInput()
map <buffer> <silent> \rcc :call C_CppcheckCheck()
map <buffer> <silent> \rpa :call C_SplintArguments()
map <buffer> <silent> \rp :call C_SplintCheck()
map <buffer> <silent> \rma :call C_MakeArguments()
map <buffer> <silent> \rme :call C_ExeToRun()
map <buffer> <silent> \rmc :call C_MakeClean()
map <buffer> <silent> \rcm :call C_ChooseMakefile()
map <buffer> <silent> \rm :call C_Make()
map <buffer> <silent> \ra :call C_Arguments()
map <buffer> <silent> \rr :call C_Run()
map <buffer> <silent> \rl :call C_Link()
map <buffer> <silent> \rc :call C_Compile()
nnoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:C_Templates,"!pick")
nnoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:C_Templates,"reload","all")
nnoremap <buffer> <silent> \ntg :call mmtemplates#core#EditTemplateFiles(g:C_Templates,1)
nnoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:C_Templates,-1)
noremap <buffer> <silent> \ns :call C_ProtoShow()
noremap <buffer> <silent> \nc :call C_ProtoClear()
noremap <buffer> <silent> \ni :call C_ProtoInsert()
onoremap <buffer> <silent> \nm :call C_ProtoPick("method")
onoremap <buffer> <silent> \nf :call C_ProtoPick("function")
onoremap <buffer> <silent> \np :call C_ProtoPick("function")
noremap <buffer> <silent> \ne :call C_CodeSnippet("e")
onoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
noremap <buffer> <silent> \nv :call C_CodeSnippet("view")
noremap <buffer> <silent> \nr :call C_CodeSnippet("r")
onoremap <buffer> <silent> \in :call C_CodeFor("down"    )
onoremap <buffer> <silent> \i0 :call C_CodeFor("up"    )
noremap <buffer> <silent> \pr0 :call C_PPIf0Remove()
onoremap <buffer> <silent> \pi0 :call C_PPIf0("a")
onoremap <buffer> <silent> \cx :call C_CommentToggle( )
onoremap <buffer> <silent> \ct :call C_InsertDateAndTime('dt')
onoremap <buffer> <silent> \cd :call C_InsertDateAndTime('d')
onoremap <buffer> <silent> \co :call C_CommentToCode()
onoremap <buffer> <silent> \cc :call C_CodeToCommentCpp()
onoremap <buffer> <silent> \c* :call C_CodeToCommentC()
noremap <buffer> <silent> \cs :call C_GetLineEndCommCol()
vnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm()
nnoremap <buffer> <silent> \cj :call C_AdjustLineEndComm()
noremap <buffer> <silent> \cl :call C_EndOfLineComment()
vnoremap <buffer> {
map <buffer> <silent> <S-F9> :call C_Arguments()
map <buffer> <silent> <C-F9> :call C_Run()
map <buffer> <silent> <F9> :call C_Link()
map <buffer> <silent> <M-F9> :call C_Compile()
imap <buffer> <silent> <NL> =C_JumpCtrlJ()
inoremap <buffer> /*
inoremap <buffer> /* /*  */<Left><Left><Left>
inoremap <buffer> <silent> \sb :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.block")
inoremap <buffer> <silent> \sc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.case")
inoremap <buffer> <silent> \ss :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.switch")
inoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while block")
inoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.while")
inoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.else block")
inoremap <buffer> <silent> \sife :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block else")
inoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if else")
inoremap <buffer> <silent> \sif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if block")
inoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.if")
inoremap <buffer> <silent> \sfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.range-based for")
inoremap <buffer> <silent> \sfo :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for block")
inoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.for")
inoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Statements.do while")
inoremap <buffer> <silent> \pw :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.warning")
inoremap <buffer> <silent> \pp :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.pragma")
inoremap <buffer> <silent> \pli :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.line")
inoremap <buffer> <silent> \pe :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.error")
inoremap <buffer> <silent> \pind :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-def-endif")
inoremap <buffer> <silent> \pin :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifndef-else-endif")
inoremap <buffer> <silent> \pid :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.ifdef-else-endif")
inoremap <buffer> <silent> \pie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-else-endif")
inoremap <buffer> <silent> \pif :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.if-endif")
inoremap <buffer> <silent> \pu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.undefine")
inoremap <buffer> <silent> \pd :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.define")
inoremap <buffer> <silent> \pl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-local")
inoremap <buffer> <silent> \pg :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include-global")
inoremap <buffer> <silent> \pih :call mmtemplates#core#InsertTemplate(g:C_Templates,"Preprocessor.include std lib header")
inoremap <buffer> <silent> \ifpr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fscanf")
inoremap <buffer> <silent> \ifsc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.fprintf")
inoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-output-file")
inoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.open-input-file")
inoremap <buffer> <silent> \ias :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.assert")
inoremap <buffer> <silent> \isi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.sizeof")
inoremap <buffer> <silent> \ire :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.realloc")
inoremap <buffer> <silent> \ima :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.malloc")
inoremap <buffer> <silent> \ica :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.calloc")
inoremap <buffer> <silent> \ipr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.printf")
inoremap <buffer> <silent> \isc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.scanf")
inoremap <buffer> <silent> \iu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.union")
inoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.struct")
inoremap <buffer> <silent> \ie :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.enum")
inoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.main")
inoremap <buffer> <silent> \isf :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function-static")
inoremap <buffer> <silent> \if :call mmtemplates#core#InsertTemplate(g:C_Templates,"Idioms.function")
inoremap <buffer> <silent> \+rt :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.RTTI")
inoremap <buffer> <silent> \+na :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace alias")
inoremap <buffer> <silent> \+unb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.namespace block xxx")
inoremap <buffer> <silent> \+un :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace xxx")
inoremap <buffer> <silent> \+uns :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.using namespace std")
inoremap <buffer> <silent> \+oof :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open output file")
inoremap <buffer> <silent> \+oif :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.open input file")
inoremap <buffer> <silent> \+ex :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.extern C")
inoremap <buffer> <silent> \+caa :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch all")
inoremap <buffer> <silent> \+ca :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.catch")
inoremap <buffer> <silent> \+tr :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.try catch")
inoremap <buffer> <silent> \+ioi :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, in")
inoremap <buffer> <silent> \+ioo :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.operator, out")
inoremap <buffer> <silent> \+tf :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template function")
inoremap <buffer> <silent> \+ita :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template accessor")
inoremap <buffer> <silent> \+itm :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template method")
inoremap <buffer> <silent> \+itcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class using new")
inoremap <buffer> <silent> \+itc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.template class")
inoremap <buffer> <silent> \+ia :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.accessor")
inoremap <buffer> <silent> \+im :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.method")
inoremap <buffer> <silent> \+icn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class using new")
inoremap <buffer> <silent> \+ic :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.IMPLEMENTATION.class")
inoremap <buffer> <silent> \+ec :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.error class")
inoremap <buffer> <silent> \+tcn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class using new")
inoremap <buffer> <silent> \+tc :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.template class")
inoremap <buffer> <silent> \+cn :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class using new")
inoremap <buffer> <silent> \+c :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.class")
inoremap <buffer> <silent> \+fb :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.ios flagbits")
inoremap <buffer> <silent> \+om :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.output manipulators")
inoremap <buffer> <silent> \+ich :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C std lib header")
inoremap <buffer> <silent> \+ih :call mmtemplates#core#InsertTemplate(g:C_Templates,"C++.include C++ std lib header")
inoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.macros")
inoremap <buffer> <silent> \csc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.special comments")
inoremap <buffer> <silent> \ckc :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.keyword comments")
inoremap <buffer> <silent> \chs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.H file sections")
inoremap <buffer> <silent> \ccs :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.C file sections")
inoremap <buffer> <silent> \cfdh :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description header")
inoremap <buffer> <silent> \cfdi :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.file description impl")
inoremap <buffer> <silent> \ccl :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.class")
inoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.method")
inoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.function")
inoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:C_Templates,"Comments.frame")
inoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:C_Templates,"Snippets.jump tags")
imap <buffer> <silent> \hm :call C_Help("m")
imap <buffer> <silent> \hp :call C_HelpCsupport()
imap <buffer> <silent> \ro :call C_Toggle_Gvim_Xterm()
imap <buffer> <silent> \rx :call C_XtermSize()
imap <buffer> <silent> \rs :call C_Settings()
imap <buffer> <silent> \rh :call C_Hardcopy()
imap <buffer> <silent> \ri :call C_Indent()
imap <buffer> <silent> \rccs :call C_CppcheckSeverityInput()
imap <buffer> <silent> \rcc :call C_CppcheckCheck()
imap <buffer> <silent> \rpa :call C_SplintArguments()
imap <buffer> <silent> \rp :call C_SplintCheck()
imap <buffer> <silent> \rma :call C_MakeArguments()
imap <buffer> <silent> \rme :call C_ExeToRun()
imap <buffer> <silent> \rmc :call C_MakeClean()
imap <buffer> <silent> \rcm :call C_ChooseMakefile()
imap <buffer> <silent> \rm :call C_Make()
imap <buffer> <silent> \ra :call C_Arguments()
imap <buffer> <silent> \rr :call C_Run()
imap <buffer> <silent> \rl :call C_Link()
imap <buffer> <silent> \rc :call C_Compile()
inoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:C_Templates,"!pick")
inoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:C_Templates,"reload","all")
inoremap <buffer> <silent> \ntg :call mmtemplates#core#EditTemplateFiles(g:C_Templates,1)
inoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:C_Templates,-1)
inoremap <buffer> <silent> \ns :call C_ProtoShow()
inoremap <buffer> <silent> \nc :call C_ProtoClear()
inoremap <buffer> <silent> \ni :call C_ProtoInsert()
inoremap <buffer> <silent> \nm :call C_ProtoPick("method")
inoremap <buffer> <silent> \nf :call C_ProtoPick("function")
inoremap <buffer> <silent> \np :call C_ProtoPick("function")
inoremap <buffer> <silent> \ne :call C_CodeSnippet("e")
inoremap <buffer> <silent> \nw :call C_CodeSnippet("w")
inoremap <buffer> <silent> \nv :call C_CodeSnippet("view")
inoremap <buffer> <silent> \nr :call C_CodeSnippet("r")
inoremap <buffer> <silent> \in :call C_CodeFor("down"    )
inoremap <buffer> <silent> \i0 :call C_CodeFor("up"    )
inoremap <buffer> <silent> \pr0 :call C_PPIf0Remove()
inoremap <buffer> <silent> \pi0 :call C_PPIf0("a")
inoremap <buffer> <silent> \cx :call C_CommentToggle( )
inoremap <buffer> <silent> \ct :call C_InsertDateAndTime('dt')
inoremap <buffer> <silent> \cd :call C_InsertDateAndTime('d')
inoremap <buffer> <silent> \cj :call C_AdjustLineEndComm()
inoremap <buffer> <silent> \cl :call C_EndOfLineComment()
inoremap <buffer> {
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=/usr/share/vim/vimfiles/c-support/wordlists/c-c++-keywords.list,/usr/share/vim/vimfiles/c-support/wordlists/k+r.list,/usr/share/vim/vimfiles/c-support/wordlists/stl_index.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'cpp'
setlocal filetype=cpp
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=ccomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=de
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'cpp'
setlocal syntax=cpp
endif
setlocal tabstop=8
setlocal tagcase=
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabnext 2
set stal=1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :