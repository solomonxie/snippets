#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Notice:  This is only as collection of snippets, CAN'T run directly

# [ LEARN BASH TODO ]
# =================================================

# True if file exists
if [ -r /etc/os-release ];

# True if the length of string is zero.
if [ -z "$CHANNEL" ];

#
DRY_RUN=${DRY_RUN:-}

# True if Number of arguments more than 0
if [ $# -gt 0 ];

# 
mirror="$2"; shift

#
shift $(( $# > 0 ? 1 : 0 ))

#
command -v "$@" > /dev/null 2>&1

# 
is_working(){ return 0 }

# If file exists than output a variable
lsb_dist="$(. /etc/os-release && echo "$ID")"

#
cat <<-EOF
......
EOF

# 
grep -Fxq "xenial" /etc/apt/sources.list


# [ ADVANCED ]
# =================================================




# [ COLLECTIONS ]
# =================================================

# Get parameters passed to current namespace (global or function)
# If it's in a funciton,
# "$#", "$1" could only get arguments passed to the function
get_arguments(){
    if [ $# -lt 1 ] ;then
        echo "Please specify a distro with --distro flag."
    fi
    while [ $# -gt 0 ]; do
        case "$1" in
            --distro)
                echo $2
                shift ;;
            --*)
                echo "Illegal option $1" ;;
            *)
                echo "Illegal input $1" ;;
        esac
        # Continue next loop
        shift $(( $# > 0 ? 1 : 0 ))
    done
}


add_debian_repo() {
    debian_version="xenial"
    backports="deb http://ftp.debian.org/debian $debian_version-backports main"
    if ! grep -Fxq "$backports" /etc/apt/sources.list; then
        (set -x; $sh_c "echo \"$backports\" >> /etc/apt/sources.list")
    fi
}

# From docker official script
get_distribution() {
    lsb_dist=""
    # Every system that docker officially support has /etc/os-release
    if [ -r /etc/os-release ]; then
        lsb_dist="$(. /etc/os-release && echo "$ID")"
    fi
    # Returning an empty string here should be alright since the
    # case statements don't act unless you provide an actual value
    echo "$lsb_dist"
}