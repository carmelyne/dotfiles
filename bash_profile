###########
# GENERAL #
###########
alias home='cd ~' # the tilda is too hard to reach
alias l='ls -lah' # l for list style, a for all including hidden, h for human readable file sizes
alias h='history' # shortcut for history
alias c='clear' # shortcut to clear your terminal
alias ..='cd ..' # move up 1 dir
alias ...='cd ../..' # move up 2 dirs
alias ebash='mate -w ~/.bash_profile && source ~/.bash_profile' 
alias eirb='mate -w ~/.irbrc && source ~/.irbrc'
alias evim='mate -w ~/.vimrc && source ~/.vimrc'
alias rbash='source ~/.bash_profile' 
alias gemup='sudo gem update' # gem update
alias gemno='sudo gem install --no-rdoc --no-ri' # gem install
alias porti='sudo port install' # macports install
alias gl='gem list | egrep -v "^( |$)"' # gems list
alias gv='gem ENV' # gems environment
alias dnsflush='dscacheutil -flushcache'
alias wowcache='rm -rf /Applications/World\ of\ Warcraft/Cache'
alias latency='sudo sysctl -w net.inet.tcp.delayed_ack=0'
alias sassy='sass --watch public/stylesheets/sass:public/stylesheets'

############
# TEXTMATE #
############
alias e='mate . &' # open current dir
alias et='mate README app/ config/ db/ lib/ public/ test/ vendor/plugins &' # open current dir assuming rails
# cd /Applications/TextMate.app/Contents/SharedSupport/Bundles
# svn co "http://macromates.com/svn/Bundles/trunk/Bundles/Ruby Haml.tmbundle"
# svn co svn://rubyforge.org/var/svn/rspec/trunk/RSpec.tmbundle
alias bundlepath="cd /Applications/TextMate.app/Contents/SharedSupport/Bundles"

##########
#  MISC  #
##########
alias learn='cd ~/Documents/Learning'

#######
# SVN #
#######
alias sup='svn up' # trust me 3 chars makes a different
alias sst='svn st' # local file changes
alias stu='svn st -u' # remote repository changes
alias sco='svn commit -m' # commit
alias svnclear='find . -name .svn -print0 | xargs -0 rm -rf' # removes all .svn folders from directory recursively
alias svnaddall='svn status | grep "^\?" | awk "{print \$2}" | xargs svn add' # adds all unadded files

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

########
# RUBY #
########
# alias irb='irb -f --simple-prompt'
# alias irb='irb --readline --simple-prompt -r irb/completion -rubygems' # use readline, completion and require rubygems by default for irb

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


##########
# APACHE #
##########
alias ehost='sudo mate /private/etc/hosts'
alias vhost='sudo mate /private/etc/apache2/extra/httpd-vhosts.conf'
alias apachestop='sudo apachectl graceful-stop'
alias apachestart='sudo apachectl start'
alias apacherestart='sudo apachectl restart'

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