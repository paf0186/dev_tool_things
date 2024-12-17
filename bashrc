# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
export PATH=$HOME/local/bin:$PATH
export PATH=$PATH:$HOME/gcllm:/usr/lib64/mpich/bin/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib64/mpich/lib/

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTTIMEFORMAT="%F %T "
export HISTCONTROL=ignoredups
export PATH="/usr/local/bin:$PATH"
export PATH=/usr/lib64/ccache:$PATH
export CSCOPE_EDITOR=nvim

cd /shared/master_checkouts/

# all
alias cdmc='cd /shared/master_checkouts/'
alias cdddnc='cd /shared/ddn_checkouts/'
alias gcav='git commit -av'
alias gcllma='gcllm.sh -a'
alias gcllmar='gcllm.sh -a -r'
alias gcllmars='gcllm.sh -a -r -s'
# series --> all + get LU from previous commit
alias gcllms='gcllm.sh -s'
alias make='sudo PATH="/usr/lib64/ccache:$PATH" -E make -j16'
alias gitcowcmaster='git clone git://git.whamcloud.com/fs/lustre-release.git .'
alias gitcoddn='git clone ssh://pfarrell2@review.whamcloud.com:29418/ex/lustre-release .'
alias gitcoddn20='git clone ssh://pfarrell2@review.whamcloud.com:29418/fs/lustre-release-ee-ddn .'
alias gitpushwcmaster='git push ssh://pfarrell2@review.whamcloud.com:29418/fs/lustre-release HEAD:refs/for/master'
alias gitpushwcb210='git push ssh://pfarrell2@review.whamcloud.com:29418/fs/lustre-release HEAD:refs/for/b2_10'
alias gitpushwcb212='git push ssh://pfarrell2@review.whamcloud.com:29418/fs/lustre-release HEAD:refs/for/b2_12'
alias gitpushddn52='git push ssh://pfarrell2@review.whamcloud.com:29418/ex/lustre-release HEAD:refs/for/b_es5_2'
alias gitpushddn60='git push ssh://pfarrell2@review.whamcloud.com:29418/ex/lustre-release HEAD:refs/for/b_es6_0'
alias gitpushddn70='git push ssh://pfarrell2@review.whamcloud.com:29418/ex/lustre-release HEAD:refs/for/b_es7_0'
alias mkcscope='find . -type f -name "*.[chSs]" > cscope.files; cscope -b -q -k -v ./cscope.files'
alias wchooks='ln -sf ../../contrib/git-hooks/prepare-commit-msg .git/hooks/; ln -sf ../../contrib/git-hooks/commit-msg .git/hooks/'
alias cpdiff='git diff > cpdiff; ./contrib/scripts/checkpatch.pl cpdiff > checkpatch; vim checkpatch'
alias removerej='find . -name \*.rej -exec rm {} \;'
alias findrej='find . -name \*.rej'
alias nbuclinus='cd /home/build/cscope_sources/kernel/linus/linux; cscope -d'
alias nbucrocky8='cd /shared/build/build_sources/kernel/rpmbuild/BUILD/kernel-4.18.0-553.27.1.el8_10/linux-4.18.0-553.27.1.el8_lustre.x86_64/; cscope -d'
alias simple_build_norpms='sudo sh autogen.sh; sudo ./configure --with-linux=/shared/build/build_sources/kernel/rpmbuild/BUILD/kernel-4.18.0-553.27.1.el8_10/linux-4.18.0-553.27.1.el8_lustre.x86_64/ --disable-gss --disable-crypto; make -j 16'
alias simple_build='sh autogen.sh; ./configure --with-linux=/shared/build/build_sources/kernel/rpmbuild/BUILD/kernel-4.18.0-553.27.1.el8_10/linux-4.18.0-553.27.1.el8_lustre.x86_64/ --disable-gss --disable-crypto; make -j 16 rpms'
alias remakedirs='cd /shared/master_checkouts; rm -rf 1 2 3 4 5 6 7 8 9 10; mkdir {1,2,3,4,5,6,7,8,9,10}; cd 1; gitcowcmaster ; wchooks ; simple_build_norpms; cd ../2; gitcowcmaster ; wchooks ; simple_build_norpms ; cd ../3; gitcowcmaster ; wchooks ; simple_build_norpms ; cd ../4; gitcowcmaster ; wchooks ; simple_build_norpms ; cd ../5; gitcowcmaster ; wchooks ; simple_build_norpms ; cd ../6; gitcowcmaster ; wchooks ; simple_build_norpms ; cd ../7; gitcowcmaster ; wchooks ; simple_build_norpms ; cd ../8; gitcowcmaster ; wchooks ; simple_build_norpms ; cd ../9; gitcowcmaster ; wchooks ; simple_build_norpms ; cd ../10; gitcowcmaster ; wchooks ; simple_build_norpms '

