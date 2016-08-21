" RltvNmbr.vim
"   Author: Charles E. Campbell, Jr.
"   Date:   Nov 21, 2008
"   Version: 3
"   GetLatestVimScripts: 2351 1 :AutoInstall: RltvNmbr.vim
"   Phillippians 1:27 :  Only let your manner of life be worthy of the gospel of
"     Christ, that, whether I come and see you or am absent, I may hear of
"     your state, that you stand firm in one spirit, with one soul striving
"     for the faith of the gospel
" ---------------------------------------------------------------------
"  Load Once: {{{1
if &cp || exists("g:loaded_RltvNmbr")
 finish
endif
let g:loaded_RltvNmbr = "v3"
if v:version < 700
 echohl WarningMsg
 echo "***warning*** this version of RltvNmbr needs vim 7.0"
 echohl Normal
 finish
endif
if !has("signs")
 echoerr 'Sorry, your vim is missing +signs; use  "configure --with-features=huge" , recompile, and install'
 finish
endif
if !has("syntax")
 echoerr 'Sorry, your vim is missing +syntax; use  "configure --with-features=huge" , recompile, and install'
 finish
endif
let s:keepcpo= &cpo
set cpo&vim
"DechoTabOn

" ---------------------------------------------------------------------
"  Parameters: {{{1
let s:RLTVNMBR= 2683
if !exists("g:DrChipTopLvlMenu")
 let g:DrChipTopLvlMenu= "DrChip."
endif

" =====================================================================
"  Functions: {{{1

" ---------------------------------------------------------------------
" RltvNmbr: {{{2
fun! s:RltvNmbr(mode,...)
"  call Dfunc("s:RltvNmbr(mode=".a:mode.((a:0 > 0)? " ".a:1.")" : ")"))

  if a:mode == 1
   " initial placement of signs
"   call Decho("mode ".a:mode.": initial sign placement")
   let wt                              = line("w0")
   let wc                              = line(".")
   let wb                              = line("w$")
"   call Decho("initial placement of signs: wt=".wt." wc=".wc." wb=".wb)
   let w                               = wt
   let s:rltvnmbr_topline_{bufnr("%")} = wt
   let s:rltvnmbr_curline_{bufnr("%")} = wc
   let s:rltvnmbr_botline_{bufnr("%")} = wb
   while w <= wb
	if w == wc
	 let w= w + 1
	 continue
	endif
	let wmwc = w - wc
	if foldclosed(w) != -1
"	 call Decho("skipping w=".w." wmwc=".wmwc." foldclosed=".foldclosed(w))
	 let w= foldclosedend(w)+1
	 continue
	endif
	if wmwc <= -100
	 let w= wc - 99
	 continue
	endif
	if wmwc >= 100
	 break
	endif
	if wmwc < 0
	 let name = "RLTVN_M".(-wmwc)
	 exe "sign place ".(s:RLTVNMBR + wmwc)." line=".w." name=".name." buffer=".bufnr("%")
	else
	 let name = "RLTVN_P".wmwc
	 exe "sign place ".(s:RLTVNMBR + wmwc)." line=".w." name=".name." buffer=".bufnr("%")
	endif
	let w= w + 1
   endwhile

  elseif a:mode == 2
"   call Decho("mode ".a:mode.": consider removing and placing signs")
   if exists("s:rltvnmbr_curline_{bufnr('%')}")
    " remove and place signs
    if line(".") != s:rltvnmbr_curline_{bufnr("%")} || line("w0") != s:rltvnmbr_topline_{bufnr("%")} || line("w$") != s:rltvnmbr_botline_{bufnr("%")}
"	 call Decho("do remove&place signs : (".line(".").",".line("w0").") =?= (".s:rltvnmbr_curline_{bufnr("%")}.",".s:rltvnmbr_topline_{bufnr("%")}.")")
     exe "sign place ".s:RLTVNMBR." line=".s:rltvnmbr_curline_{bufnr("%")}." name=RLTVCURID buffer=".bufnr("%")
     let lzkeep= &lz
	 set lz
     call s:RltvNmbr(3)  " remove signs
     call s:RltvNmbr(1)  " place signs
     exe "sign unplace ".s:RLTVNMBR." buffer=".bufnr("%")
     let &lz= lzkeep
    endif
   endif

  elseif a:mode == 3
   " removal of signs
"   call Decho("mode ".a:mode.": removal of signs")
   let wt = s:rltvnmbr_topline_{bufnr("%")}
   let wc = s:rltvnmbr_curline_{bufnr("%")}
   let wb = s:rltvnmbr_botline_{bufnr("%")}
"   call Decho("using s:wt=".wt." s:wc=".wc." s:wb=".wb)
   let w  = wt
   while w <= wb
	if w == wc
	 let w= w + 1
	 continue
	endif
	let wmwc = w - wc
	if foldclosed(w) != -1
"	 call Decho("skipping w=".w." wmwc=".wmwc." foldclosed=".foldclosed(w))
	 let w= foldclosedend(w)+1
	 continue
	endif
	if wmwc <= -100
	 let w= wc - 99
	 continue
	endif
	if wmwc >= 100
	 break
	endif
	if wmwc < 0
	 let name= "RLTVN_M".(-wmwc)
	else
	 let name= "RLTVN_P".wmwc
	endif
	exe "sign unplace ".(s:RLTVNMBR + wmwc)." buffer=".bufnr("%")
	let w= w + 1
   endwhile

  else
   echoerr "mode=".a:mode." unsupported"
  endif

"  call Dret("s:RltvNmbr")
endfun

" ---------------------------------------------------------------------
" RltvNmbr#RltvNmbrCtrl: {{{2
fun! RltvNmbr#RltvNmbrCtrl(start)
"  call Dfunc("RltvNmbr#RltvNmbrCtrl(start=".a:start.")")

  if      a:start && !exists("s:rltvnmbr_{bufnr('%')}")
   let s:rltvnmbr_{bufnr("%")}= 1
   let b:rltvnmbrmode         = 1

   if !exists("s:rltvnmbr_signs")
	let s:rltvnmbr_signs= 1
	hi default HL_RltvNmbr_Minus	gui=none,italic ctermfg=red   ctermbg=black guifg=red   guibg=black
	hi default HL_RltvNmbr_Positive	gui=none,italic ctermfg=green ctermbg=black guifg=green guibg=black
	silent call s:AvoidOtherSigns()
    let L= 1
    while L <= 99
	 exe "sign define RLTVN_M".L.' text='.string(L).' texthl=HL_RltvNmbr_Minus'
	 exe "sign define RLTVN_P".L.' text='.string(L).' texthl=HL_RltvNmbr_Positive'
     let L= L+1
    endwhile
   endif
   sign define RLTVCURID text=-- texthl=Ignore

   exe "menu ".g:DrChipTopLvlMenu."RltvNmbr.Stop<tab>:RltvNmbr!	:RltvNmbr!<cr>"
   exe 'silent! unmenu '.g:DrChipTopLvlMenu.'RltvNmbr.Start'
   call s:RltvNmbr(1)
   augroup RltvNmbrAutoCmd
	au!
    au CursorHold           * call <SID>RltvNmbr(2,"cursorhold")
	au CursorMoved          * call <SID>RltvNmbr(2,"cursormoved")
	au FileChangedShellPost * call <SID>RltvNmbr(2,"filechangedshellpost")
	au FocusGained          * call <SID>RltvNmbr(2,"focusgained")
	au FocusLost            * call <SID>RltvNmbr(2,"focuslost")
	au ShellCmdPost         * call <SID>RltvNmbr(2,"shellcmdpost")
	au ShellFilterPost      * call <SID>RltvNmbr(2,"shellfilterpost")
	au TabEnter             * call <SID>RltvNmbr(2,"tabenter")
	au VimResized           * call <SID>RltvNmbr(2,"vimresized")
	au WinEnter             * call <SID>RltvNmbr(2,"winenter")
    au ColorScheme          * call <SID>ColorschemeLoaded()
   augroup END

  elseif !a:start && exists("s:rltvnmbr_{bufnr('%')}")
   let b:rltvnmbrmode         = 0
   unlet s:rltvnmbr_{bufnr("%")}
   augroup RltvNmbrAutoCmd
	au!
   augroup END
   augroup! RltvNmbrAutoCmd
   call s:RltvNmbr(3)
   exe "sign unplace ".s:RLTVNMBR." buffer=".bufnr("%")
   exe "menu ".g:DrChipTopLvlMenu."RltvNmbr.Start<tab>:RltvNmbr	:RltvNmbr<cr>"
   exe 'silent! unmenu '.g:DrChipTopLvlMenu.'RltvNmbr.Stop'

  else
   echo "RltvNmbr is already ".((a:start)? "enabled" : "off")
  endif
"  call Dret("RltvNmbr#RltvNmbrCtrl")
endfun

" ---------------------------------------------------------------------
" RltvNmbr#RltvNmbrToggle: supports the :RN command for quick relative-number-mode toggling {{{2
"                          If the :RN command is already available, then it will not be overridden.
fun! RltvNmbr#RltvNmbrToggle()
"  call Dfunc("RltvNmbr#RltvNmbrToggle()")
  
  if !exists("b:rltvnmbrmode")
   let b:rltvnmbrmode= 0
  endif
  if b:rltvnmbrmode == 0
   RltvNmbr
  else
   RltvNmbr!
  endif

"  call Dret("RltvNmbr#RltvNmbrToggle")
endfun

" ---------------------------------------------------------------------
" s:ColorschemeLoaded: {{{2
fun! s:ColorschemeLoaded()
"  call Dfunc("s:ColorschemeLoaded()")
	hi HL_RltvNmbr_Minus	ctermfg=red   ctermbg=black guifg=red   guibg=black
	hi HL_RltvNmbr_Positive	ctermfg=green ctermbg=black guifg=green guibg=black
"  call Dret("s:ColorschemeLoaded")
endfun

" ---------------------------------------------------------------------
" s:AvoidOtherSigns: {{{2
fun! s:AvoidOtherSigns()
"  call Dfunc("s:AvoidOtherSigns()")
  if !exists("s:othersigns")
   " only do this one time
   redir => s:othersigns
    sign place
   redir END
   " determine the max id being used and use one more than that as the beginning of RltvNmbr ids
   let signlist= split(s:othersigns,'\n')
   let idlist  = map(signlist,"substitute(v:val,'^.\\{-}\\<id=\\(\\d\\+\\)\\s.*$','\\1','')")
   if len(idlist) > 2
    let idlist = remove(idlist,2,-1)
    let idlist = map(idlist,"str2nr(v:val)")
    let idmax  = max(idlist)
	if idmax > s:RLTVNMBR
	 let s:RLTVNMBR = idmax + 1
"     call Decho("s:RLTVNMBR=".s:RLTVNMBR)
	endif
   endif
   unlet s:othersigns
   let s:othersigns= 1
   endif
"  call Dret("s:AvoidOtherSigns : s:RLTVNMBR=".s:RLTVNMBR)
endfun

" ---------------------------------------------------------------------
"  Restore: {{{1
let &cpo= s:keepcpo
unlet s:keepcpo
" vim: ts=4 fdm=marker
