branch = "master"

init:
	git checkout master
	git pull
	git submodule init
	git submodule update --recursive --init
	git submodule foreach 'git checkout master'

checkout:
	git checkout $(branch)
	git submodule foreach 'git checkout $(branch)'

branch:
	git branch $(name)
	git submodule foreach 'git branch $(name)'
	git checkout $(name)
	git submodule foreach 'git checkout $(name)'
pull:
	git pull
	git submodule foreach 'git pull'
