
#
#		file <- "daily_git.sh"
#	TODO

#		USAGE:		daily_git<CR>

##	Sat 13Aug2022
## #		
## 	line="==========================="
## 	echo "\n"
## 	echo "BEGIN ..." $line
## 	echo "--- daily_git.sh --- "
## 	echo "directory is .... ${1}"
## 	echo $(date) 
## 	echo $line

#	---------------------
#	FIRST, all the code repos
#	---------------------
#
#system2("git", "add, *", :w
#)
cd /home/jim/code/mp3
/home/jim/bin/git_add_push.sh .

cd /home/jim/code/youtube_api
/home/jim/bin/git_add_push.sh .

cd /home/jim/code/zsh_project
/home/jim/bin/git_add_push.sh .

cd /home/jim/code/code_publish
/home/jim/bin/git_add_push.sh .

cd /home/jim/code/docs
/home/jim/bin/git_add_push.sh .

cd /home/jim/code/try_things_here
/home/jim/bin/git_add_push.sh .

cd /home/jim/code/nvim_project
/home/jim/bin/git_add_push.sh .

cd /home/jim/code/lua_project
/home/jim/bin/git_add_push.sh .

cd /home/jim/code/SHINY
/home/jim/bin/git_add_push.sh .

# cd /home/jim/code/NSE_project
# /home/jim/bin/git_add_push.sh .

cd /home/jim/code/health_labs
/home/jim/bin/git_add_push.sh .

#	---------------------
#	BEGIN:			non - code REPOS 
#	---------------------
cd /home/jim/dotfiles
/home/jim/bin/git_add_push.sh .

cd /home/jim/bin/
/home/jim/bin/git_add_push.sh .

cd
