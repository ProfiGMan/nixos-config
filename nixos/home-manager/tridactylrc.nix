{
  home.file.".config/tridactyl/tridactylrc".text = ''
    " vim: filetype=vim

    " This wipes all existing settings. This means that if a setting in this file
    " is removed, then it will return to default. In other words, this file serves
    " as an enforced single point of truth for Tridactyl's configuration.
    sanitize tridactyllocal tridactylsync
    
    guiset_quiet hoverlink right
    
    set hintchars sadjklewcmpgh
    set smoothscroll true
    set keyboardlayoutforce true
    set editorcmd kitty --title float sh -c "nvim %f '+normal!%lGzv%c|'"
    
    command emuKey js -d' tri.controller.acceptExCmd(tri.config.get(JS_ARGS[1])[JS_ARGS[2]])'
    
    bind e nmode ignore 1 mode normal
    
    " tridactyl search
    bind <C-/> fillcmdline find
    bind ? fillcmdline find -?
    bind n findnext 1
    bind N findnext -1
    bind ,<Space> nohlsearch
    set findcase sensitive
    
    " Vcaret mode
    bind --mode=vcaret <Escape> emuKey vmaps <Escape>
    command selection_to_caret composite js document.getSelection().collapseToStart(); js document.getSelection().modify("extend","forward","character")
    bind --mode=visual c composite selection_to_caret; mode vcaret
    bind --mode=vcaret v mode visual
    bind ;c composite hint -h; emuKey vmaps c
    
    bind --mode=vcaret l js document.getSelection().collapseToStart(), document.getSelection().modify("move","forward","character"), document.getSelection().modify("extend","forward","character")
    bind --mode=vcaret h composite js document.getSelection().collapseToEnd(), document.getSelection().modify("move","backward","character"), document.getSelection().modify("extend","backward","character"); emuKey vmaps o
    bind --mode=vcaret j js document.getSelection().collapseToStart(), document.getSelection().modify("move","forward","line"), document.getSelection().modify("extend","forward","character")
    bind --mode=vcaret k composite js document.getSelection().collapseToEnd(), document.getSelection().modify("move","backward","line"), document.getSelection().modify("extend","backward","character"); emuKey vmaps o
    bind --mode=vcaret e js document.getSelection().collapseToStart(), document.getSelection().modify("move","forward","word"), document.getSelection().modify("extend","forward","character")
    bind --mode=vcaret b js document.getSelection().collapseToStart(), document.getSelection().modify("move","backward","word"), document.getSelection().modify("extend","forward","character")
    bind --mode=vcaret w js document.getSelection().collapseToStart(), document.getSelection().modify("move","forward","word"), document.getSelection().modify("move","forward","word"), document.getSelection().modify("move","backward","word"), document.getSelection().modify("extend","forward","character")
    bind --mode=vcaret $ composite js document.getSelection().collapseToStart(), document.getSelection().modify("move","forward","lineboundary"); emuKey vmaps H; emuKey vmaps o
    bind --mode=vcaret 0 composite js document.getSelection().collapseToStart(), document.getSelection().modify("move","backward","lineboundary"); emuKey vmaps l
    
    set vcaretmaps.🕷🕷INHERITS🕷🕷 nmaps
    
    " Visual mode corrections
    bind --mode=visual w js document.getSelection().modify("extend","forward","word"); document.getSelection().modify("extend","forward","word"); document.getSelection().modify("extend","backward","word")
    bind --mode=visual b js document.getSelection().modify("extend","backward","word")
  '';
}
