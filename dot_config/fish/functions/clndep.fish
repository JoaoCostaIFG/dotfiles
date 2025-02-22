function clndep --description 'Pacman -R unused dependencies'
    pacman -Qdtq | sudo pacman -R - $argv
end
