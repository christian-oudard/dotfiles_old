reset="\033[0m"

# Chris Kempson's base16.

# Foreground.
base00="\033[38;5;0m"  # black 1
base01="\033[38;5;18m" # black 2
base02="\033[38;5;19m" # black 3
base03="\033[38;5;8m"  # black 4
base04="\033[38;5;20m" # white 1
base05="\033[38;5;7m"  # white 2
base06="\033[38;5;21m" # white 3
base07="\033[38;5;15m" # white 4
base08="\033[38;5;1m"  # red
base09="\033[38;5;16m" # orange
base0A="\033[38;5;11m" # yellow
base0B="\033[38;5;10m" # yellow-green
base0C="\033[38;5;14m" # green
base0D="\033[38;5;12m" # blue
base0E="\033[38;5;13m" # purple
base0F="\033[38;5;17m" # magenta

# Background.
base00bg="\033[48;5;0m"
base01bg="\033[48;5;18m"
base02bg="\033[48;5;19m"
base03bg="\033[48;5;8m"
base04bg="\033[48;5;20m"
base05bg="\033[48;5;7m"
base06bg="\033[48;5;21m"
base07bg="\033[48;5;15m"
base08bg="\033[48;5;1m"
base09bg="\033[48;5;16m"
base0Abg="\033[48;5;11m"
base0Bbg="\033[48;5;10m"
base0Cbg="\033[48;5;14m"
base0Dbg="\033[48;5;12m"
base0Ebg="\033[48;5;13m"
base0Fbg="\033[48;5;17m"

function colortest() {
    printf "\
${base00}black 1${reset}
${base01}black 2${reset}
${base02}black 3${reset}
${base03}black 4${reset}
${base04}white 1${reset}
${base05}white 2${reset}
${base06}white 3${reset}
${base07}white 4${reset}
${base08}red${reset}
${base09}orange${reset}
${base0A}yellow${reset}
${base0B}yellow-green${reset}
${base0C}green${reset}
${base0D}blue${reset}
${base0E}purple${reset}
${base0F}magenta${reset}

${base07}${base00bg}black 1${reset}
${base07}${base01bg}black 2${reset}
${base07}${base02bg}black 3${reset}
${base07}${base03bg}black 4${reset}
${base07}${base04bg}white 1${reset}
${base07}${base05bg}white 2${reset}
${base07}${base06bg}white 3${reset}
${base07}${base07bg}white 4${reset}
${base07}${base08bg}red${reset}
${base07}${base09bg}orange${reset}
${base07}${base0Abg}yellow${reset}
${base07}${base0Bbg}yellow-green${reset}
${base07}${base0Cbg}green${reset}
${base07}${base0Dbg}blue${reset}
${base07}${base0Ebg}purple${reset}
${base07}${base0Fbg}magenta${reset}
"
}
