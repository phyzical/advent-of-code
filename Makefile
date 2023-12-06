include 2016/Makefile
include 2017/Makefile
include 2018/Makefile
include 2019/Makefile
include 2020/Makefile
include 2021/Makefile
include 2022/Makefile
include 2023/Makefile


# 1 is title to echo 
# 2 is a command to run i.e echo \"option1 option2 option\"
# if 2 results in an empty string i.e echo "" then assume they want to manually enter
# if an options is submitted that isnt an option number it is taken at face value
# if a " " is submited this is a "blank" value
#echo $(2) 1>&2; << this will let you preview the command being run
define select_option
	eval "options='$$(eval $2)'";
	echo $(1) 1>&2;
	export PS3="~~> ";
	if [ "$$options" != "" ]; then 
		select option in $$options; do
		  	if [ "$$REPLY" == " " ]; then  
		  		option="";
		  	elif [ "$$option" == "" ]; then  
		  		option="$$REPLY";
			fi;
		  	break; 
		done; 
	else 
		read -r -e -p "$$PS3" option; 
	fi;
	echo "You have choosen $$option" 1>&2;
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" 1>&2
endef


YEAR_CMDS=$(filter \
	$(MAKECMDGOALS), \
	solve \
	install-dependencies \
)
YEARS_COMMAND=$(shell echo 'find * -maxdepth 0 -type d | grep "20"')
export YEAR:=$(shell \
	while [ -z "$$YEAR" ] && [ -z "${YEAR}" ] && [ "${YEAR_CMDS}" != "" ]; do \
		TITLE="YEAR (Year to solve puzzle from):"; \
		OPTIONS_COMMAND="$(YEARS_COMMAND)"; \
		$(call select_option,$$TITLE,$$OPTIONS_COMMAND); \
		YEAR="$$option"; \
	done \
	&& echo "$$YEAR"; \
)

PUZZLE_CMDS=$(filter \
	$(MAKECMDGOALS), \
	solve \
)
EXTENSION=`cat ${YEAR}/.extension`
PUZZLE_COMMAND=$(shell echo 'find ${YEAR}/* -maxdepth 0 -type f | grep "${EXTENSION}" | cut -d"/" -f2 | cut -d"." -f1 | sort -u | grep -v [a-z]')
export PUZZLE:=$(shell \
	while [ -z "$$PUZZLE" ] && [ -z "${PUZZLE}" ] && [ "${PUZZLE_CMDS}" != "" ]; do \
		TITLE="PUZZLE (Puzzle number to solve from ${YEAR}):"; \
		OPTIONS_COMMAND="$(PUZZLE_COMMAND)"; \
		$(call select_option,$$TITLE,$$OPTIONS_COMMAND); \
		PUZZLE="$$option"; \
	done \
	&& echo "$$PUZZLE"; \
)

PART_CMDS=$(filter \
	$(MAKECMDGOALS), \
	solve \
)
PART_COMMAND=$(shell echo 'find ${YEAR}/${PUZZLE}.* -maxdepth 0 -type f | grep "${EXTENSION}" | cut -d"/" -f2 | cut -d"." -f2 | grep -v [a-z]')
export PART:=$(shell \
	while [ -z "$$PART" ] && [ -z "${PART}" ] && [ "${PART_CMDS}" != "" ]; do \
		TITLE="PART (which part of ${YEAR} \#${PUZZLE} to solve):"; \
		OPTIONS_COMMAND="$(PART_COMMAND)"; \
		$(call select_option,$$TITLE,$$OPTIONS_COMMAND); \
		PART="$$option"; \
	done \
	&& echo "$$PART"; \
)

INSTALL_DEPENDENCIES_CMDS=$(filter \
	$(MAKECMDGOALS), \
	solve \
)
export INSTALL_DEPENDENCIES:=$(shell \
	while [ -z "$$INSTALL_DEPENDENCIES" ] && [ -z "${INSTALL_DEPENDENCIES}" ] && [ "${INSTALL_DEPENDENCIES_CMDS}" != "" ]; do \
		TITLE="INSTALL_DEPENDENCIES (Would you like to install dependencies?):"; \
		OPTIONS_COMMAND="true false"; \
		$(call select_option,$$TITLE,$$OPTIONS_COMMAND); \
		INSTALL_DEPENDENCIES="$$option"; \
	done \
	&& echo "$$INSTALL_DEPENDENCIES"; \
)

solve:
	@if [ "${INSTALL_DEPENDENCIES}" == "true" ]; then \
		make install-dependencies YEAR=${YEAR}; \
	fi
	@make solve-${YEAR} FILE="${YEAR}/${PUZZLE}.${PART}${EXTENSION}"

install-dependencies:
	@make install-dependencies-${YEAR}

# bundle install && npm i && pip3 install -r requirements.txt
