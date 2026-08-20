#!/usr/bin/env bash
# solarized-osaka dark para tmux
#
# Paleta: solarized-osaka.nvim (lua/solarized-osaka/colors.lua), resolvida de HSL.
# Layout: separadores powerline do arquivo original do tema, com a estrutura de
#   blocos do craftzdog/dotfiles (.config/tmux/statusline.conf) -- nome de
#   janela = basename do cwd em vez de #W.
#
# O arquivo que vinha do extras/ do tema usava #268bd3 em TUDO (sessao, janela
# ativa, relogio, host) -- dai a impressao de "so azul". Aqui cada bloco tem
# acento proprio:
#   base04 #001419   base03 #002c38   base02 #063540   base00 #637981
#   base0  #9eabac   base2  #ede7d3
#   blue #268bd3   yellow #b28500   violet #6d71c4   red #db302d
#   orange #c94c16  cyan #29a298    green #849900    magenta #d23681
#
# Separadores (exigem Nerd Font; o Ghostty aqui usa JetBrainsMono Nerd Font):
#    U+E0B0 solida apontando pra direita   -> transicao de bloco, lado esquerdo
#    U+E0B1 fina apontando pra direita     -> separador interno, mesmo bg
#    U+E0B2 solida apontando pra esquerda  -> transicao de bloco, lado direito
# Regra: pra sair da cor A e entrar na cor B use  fg=A,bg=B  com 
# e  fg=B,bg=A  com  (a tinta do glifo e sempre a continuacao do bloco).

set -g status "on"
set -g status-justify "left"
set -g status-interval 5          # default e 15s -> o relogio %H:%M atrasava
set -g status-left-length 100
set -g status-right-length 100
set -g status-left-style NONE
set -g status-right-style NONE

set -g status-style "fg=#9eabac,bg=#002c38"

set -g mode-style            "fg=#001419,bg=#b28500"   # selecao no copy-mode
set -g message-style         "fg=#001419,bg=#b28500"
set -g message-command-style "fg=#001419,bg=#b28500"

set -g pane-border-style        "fg=#063540"
set -g pane-active-border-style "fg=#29a298"

set -g display-panes-colour        "#268bd3"
set -g display-panes-active-colour "#b28500"
setw -g clock-mode-colour          "#29a298"

# -- esquerda: sessao (creme)  janela.pane (azul)  barra --
set -g status-left "#[fg=#001419,bg=#ede7d3,bold] #S #[fg=#ede7d3,bg=#268bd3,nobold,nounderscore,noitalics]#[fg=#001419,bg=#268bd3,bold] #I.#P #[fg=#268bd3,bg=#002c38,nobold,nounderscore,noitalics]"

# -- janelas: a ativa ganha os blocos creme  amarelo; as outras ficam lisas
#    com a chevron fina, de proposito, pra so a atual ter relevo --
setw -g window-status-separator ""
setw -g window-status-style          "NONE,fg=#9eabac,bg=#002c38"
setw -g window-status-activity-style "underscore,fg=#c94c16,bg=#002c38"
setw -g window-status-bell-style     "bold,fg=#db302d,bg=#002c38"
setw -g window-status-format         "#[fg=#637981,bg=#002c38,nobold,nounderscore,noitalics] #I  #[fg=#9eabac]#{b:pane_current_path} "
setw -g window-status-current-format "#[fg=#002c38,bg=#ede7d3,nobold,nounderscore,noitalics]#[fg=#b28500,bg=#ede7d3,bold] #I #[fg=#ede7d3,bg=#b28500,nobold]#[fg=#001419,bg=#b28500,bold] #{b:pane_current_path} #[fg=#b28500,bg=#002c38,nobold]"

# -- direita: prefix / zoom + data  hora  host --
# %H:%M ou %I:%M %p conforme clock-mode-style. O arquivo original decidia isso
# com  if-shell '[ ... == ... ]'  -- o `==` nao existe no dash (que e o /bin/sh
# do Ubuntu), o teste falhava sempre e o relogio ficava travado em 12h. Aqui e
# %if nativo do tmux, sem shell nenhum no meio.
%if "#{==:#{clock-mode-style},24}"
set -g @sol_clock "%H:%M"
%else
set -g @sol_clock "%I:%M %p"
%endif

# Blocos flutuantes (cap  na esquerda,  na direita). Ficam em opcoes porque
# o `,` dentro de #{?...} separaria os ramos da condicional -- referenciados
# como #{@sol_prefix} a expansao acontece depois da escolha do ramo, sem escape.
set -g @sol_prefix "#[fg=#db302d,bg=#002c38,nobold]#[fg=#001419,bg=#db302d,bold] PREFIX #[fg=#db302d,bg=#002c38,nobold]"
set -g @sol_zoom   "#[fg=#c94c16,bg=#002c38,nobold]#[fg=#001419,bg=#c94c16,bold] ZOOM #[fg=#c94c16,bg=#002c38,nobold]"

# #{?client_prefix,...} e #{?window_zoomed_flag,...} sao nativos -- substituem
# o #{prefix_highlight}, que exigia o plugin tmux-prefix-highlight (nao
# instalado aqui, logo expandia pra string vazia).
set -g status-right "#{?client_prefix,#{@sol_prefix},}#{?window_zoomed_flag,#{@sol_zoom},}#[fg=#063540,bg=#002c38,nobold,nounderscore,noitalics]#[fg=#9eabac,bg=#063540] %Y-%m-%d #[fg=#6d71c4,bg=#063540,nobold]#[fg=#001419,bg=#6d71c4,bold] #{T:@sol_clock} #[fg=#ede7d3,bg=#6d71c4,nobold]#[fg=#001419,bg=#ede7d3,bold] #h "
