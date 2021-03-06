# Create and change to directory
function mkcd {
    if [ $# -ne 1 ]; then
        echo "usage: mkcd directory_name"
    elif [ -d "${1}" ]; then
        echo "(directory already existed)"
        cd "$1"
    elif [ -e "${1}" ]; then
        echo "file exists"
    else
        mkdir "${1}" && cd "${1}"
    fi
}

# Remove empty working directory
function rmwd {
    if (shopt -s nullglob dotglob; f=(*); ((! ${#f[@]}))); then
        # directory is empty
        rmdir `"pwd"`
        cd ..
    else
        echo "not empty"
    fi
}


##################
# SSH TO SERVERS #
##################
# alias server-name='ssh remote-id@remote.com'

# Private
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi


###############
# CD PROJECTS #
###############
# alias project-name='cd ~/Projects/project-name'

#################
# GITHUB SETUP #
################
alias github4="git init; touch README; git add README; git commit -m 'first commit'"

###########
# GENERAL #
###########
alias csdk='/Applications/CoronaSDK/Corona\ Terminal ; exit;'
alias home='cd ~'
alias l='ls -lah'
alias h='history'
alias hg='history|grep'
alias c='clear'
alias ..='cd ..'
alias ...='cd ../..'

alias sites='cd ~/Sites'
alias dotfiles='cd ~/dotfiles; mate ~/dotfiles'
alias learn='cd ~/Documents/Learning; mate ~/Documents/Learning'
alias rlearn='cd ~/Documents/Ruby\ Learning/ruby-learning-batch-24; mate ~/Documents/Ruby\ Learning/ruby-learning-batch-24'
alias html5="~/Documents/Html5boilerplate/sassed-html5boilerplate; mate ~/Documents/Html5boilerplate/sassed-html5boilerplate"

alias ebash='mate -w ~/.bash_profile; source ~/.bash_profile'
alias eirb='mate -w ~/.irbrc; source ~/.irbrc'
alias evim='mate -w ~/.vimrc; source ~/.vimrc'
alias rbash='source ~/.bash_profile'

alias gemup='sudo gem update' # gem update
alias gemno='sudo gem install --no-rdoc --no-ri' # gem install
alias gl='gem list | egrep -v "^( |$)"' # gems list
alias gv='gem ENV' # gems environment


alias nohide='defaults write com.apple.Finder AppleShowAllFiles YES && killall Finder && open /System/Library/CoreServices/Finder.app'
alias hide='defaults write com.apple.Finder AppleShowAllFiles NO && killall Finder && open /System/Library/CoreServices/Finder.app'

alias mk='make'
alias mks='sudo make install'

alias ip='curl ifconfig.me'
alias tracert='traceroute'
# alias dnsflush='dscacheutil -flushcache'
alias dnsflush='sudo killall -HUP mDNSResponder'
alias wowcache='rm -rf /Applications/World\ of\ Warcraft/Cache'
alias wownamed='rm -rf /Applications/World\ of\ Warcraft/Cache/WDB/enUS/creaturecache.wdb'
alias latency='sudo sysctl -w net.inet.tcp.delayed_ack=0'
alias d3="open /Applications/Diablo\ III/Diablo\ III.app --args -launch"
alias wow="rm -rf /Applications/World\ of\ Warcraft/Cache/WDB/enUS/creaturecache.wdb; open /Applications/World\ of\ Warcraft/World\ of\ Warcraft\ Launcher.app"

alias sassy='sass --watch public/stylesheets/sass:public/stylesheets'
alias sassup='sass --update public/stylesheets/sass:public/stylesheets'

alias projects='cd ~/Desktop/CX2\ Media/Projects/Corona\ Projects'

alias killhog="killall Finder; killall tcpblock; killall SystemUIServer; killall CalendarAgent"
alias killui="killall SystemUIServer"
alias killfinder='killall Finder'

alias killchrome="killall Google\ Chrome"
alias chromecss="cd ~/Library/Application\ Support/Google/Chrome/Default/User\ StyleSheets; open ."
alias getchromecss="curl -o ~/Library/Application\ Support/Google/Chrome/Default/User\ StyleSheets/Custom.css https://raw.github.com/mauricecruz/chrome-devtools-zerodarkmatrix-theme/master/Custom-Stable.css"

alias killmail="sudo chmod 000 /Applications/Mail.app/Contents/MacOS/Mail"
alias revivemail="sudo chmod 755 /Applications/Mail.app/Contents/MacOS/Mail"

alias googlefonts="cd /Volumes/USB\ External/Fonts/GoogleFontsGithub && git pull"
alias usbdrive="cd /Volumes/USB\ External/"

########
# BREW #
########
alias brewupdate="brew update; brew list | xargs brew upgrade"

########
# RUBY #
########
# alias irb='irb -f --simple-prompt'
# alias irb='irb --readline --simple-prompt -r irb/completion -rubygems' # use readline, completion and require rubygems by default for irb

# really awesome function, use: cdgem <gem name>, cd's into your gems directory and opens gem that best matches the gem name provided
function cdgem {
  cd ~/.rvm/gems/ruby-1.9.2-p290/gems; cd `ls|grep $1|sort|tail -1`
}

# gemdir function
function gemdir {
  if [[ -z "$1" ]] ; then
    echo "gemdir expects a parameter, which should be a valid RVM Ruby selector"
  else
    rvm "$1"
    cd $(rvm gemdir)
    pwd
  fi
}

#########
# RAILS #
#########
# ss='mongrel_rails start' # start up the beast
alias ss='script/server'
alias sc='script/console' # obvious
alias sg='script/generate'
alias a='autotest -rails' # makes autotesting even quicker
alias vlad='rake staging vlad:deploy'
alias rdbm="rake db:migrate && rake db:test:prepare"
alias rdbp="rake db:populate"
alias rdbt="rake db:test:prepare"
alias raket="rake -T"
alias rakec="rake cucumber:all"
alias testdb="RAILS_ENV=test rake db:test:prepare"
alias testpop="RAILS_ENV=test rake db:populate"
alias testsolr="RAILS_ENV=test rake solr:start"
alias testsolrt="RAILS_ENV=test rake solr:stop"
alias solr="rake solr:start"
alias solrt="rake solr:stop"
alias story="ruby stories/all.rb"
alias fix="find . -print0 | xargs -0 touch"
# setup="rake app:setup" #essentially a db:migrate:reset, db:spec:fixtures:load, db:spec
alias setup="rake db:setup"
alias tailf="tail -f log/development.log"
alias cfn="cucumber features -n"
alias bi="bundle install"

############
# TEXTMATE #
############
alias e='mate . &' # open current dir
alias et='mate README app/ config/ db/ lib/ public/ test/ vendor/plugins &' # open current dir assuming rails
# cd /Applications/TextMate.app/Contents/SharedSupport/Bundles
# svn co "http://macromates.com/svn/Bundles/trunk/Bundles/Ruby Haml.tmbundle"
# svn co svn://rubyforge.org/var/svn/rspec/trunk/RSpec.tmbundle
alias bundlepath="cd /Applications/TextMate.app/Contents/SharedSupport/Bundles"

#######
# GIT #
#######
alias gst='git status'
alias gad='git add .'
alias gps='git push'
alias gcl='git clone'
alias gd='git diff | mate'

alias gup='git pull --rebase'
alias gpl='git pull'
alias gpom='git pull origin master'

alias gto='git checkout'

alias gc='git commit'
alias gco='git commit -m'
alias gvo='git commit -v'

alias gb='git branch'
alias gba='git branch -a'
alias gdel='git branch -d'

#######
# SVN #
#######
alias sup='svn up' # trust me 3 chars makes a different
alias sst='svn st' # local file changes
alias stu='svn st -u' # remote repository changes
alias sco='svn commit -m' # commit
alias svnclear='find . -name .svn -print0 | xargs -0 rm -rf' # removes all .svn folders from directory recursively
alias svnaddall='svn status | grep "^\?" | awk "{print \$2}" | xargs svn add' # adds all unadded files

#########
# WEBBY #
#########
alias wg='webby-gen website'
alias wab='webby autobuild'
alias wrb='webby rebuild'
alias tds='thor deploy:scp'
alias wcp='webby create:page'
alias wcbk='webby create:book'
alias wcbl='webby create:blog'

##########
# APACHE #
##########
alias ehost='sudo mate /private/etc/hosts'
alias vhost='sudo mate /private/etc/apache2/extra/httpd-vhosts.conf'

alias apachestop='sudo apachectl graceful-stop'
alias apachestart='sudo apachectl start'
alias apacherestart='sudo apachectl restart'
alias apacheprod='touch tmp/restart.txt'

#########
# MYSQL #
#########

# binary install
alias mysqlstop='sudo /Library/StartupItems/MySQLCOM/MySQLCOM stop'
alias mysqlstart='sudo /Library/StartupItems/MySQLCOM/MySQLCOM start'
alias mysqlrestart='sudo /Library/StartupItems/MySQLCOM/MySQLCOM restart'

# Add mysql bin to path
export PATH=/usr/local/mysql/bin:$PATH

# Add /usr/local/bin to PATH
export PATH=/usr/local/bin:$PATH

# Add Node to PATH
#export NODE_PATH=/usr/local/lib/node_modules/npm/node_modules:$PATH
#export Path for Node installed via brew
export NODE_PATH=/usr/local/lib/node:$PATH
export PATH=/usr/local/share/npm/bin:$PATH

####################
# SERVER SHORTCUTS #
####################
alias serverstart='apachestart && mysqlstart'
alias serverstop='apachestop && mysqlstop'
alias serverrestart='apacherestart && mysqlrestart'

#############
#   Colors  #
#############
# Set prompt: " username@hostname/directory/tree $ " (with colors)
export PS1="  \[\e[32;1m\]\u\[\e[0m\]\[\e[32m\]@\h\[\e[36m\]\w \[\e[33m\]\$ \[\e[0m\]"

# export PATH="usr/bin/:/usr/sbin:$PATH"

export GREP_OPTIONS='--color=auto'
export HISTSIZE=1000
export HISTFILESIZE=1000
export VISUAL='mate -w'

#####################
# Load RVM function #
#####################
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"


########
# Coda #
########
# set path
export CODA_PATH=/Applications/Coda.app:$PATH
# function roughly like 'mate .' by expanding '.' to '*.htm*'
coda () {
if [[ "." == $1 ]]
then
    open -a $CODA_PATH $1 $2 $3
fi
}

#####################
# Android SDK TOOLS #
#####################
PATH=${PATH}:~/Desktop/Android/adt-bundle-mac-x86_64-20130219/sdk/platform-tools