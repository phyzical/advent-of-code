-include .env
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
	submit \
)
YEAR_COMMAND=$(shell echo 'find * -maxdepth 0 -type d | grep "20"')
export YEAR:=$(shell \
	while [ -z "$$YEAR" ] && [ -z "${YEAR}" ] && [ "${YEAR_CMDS}" != "" ]; do \
		TITLE="YEAR (Year to solve DAY from):"; \
		OPTIONS_COMMAND="$(YEAR_COMMAND)"; \
		$(call select_option,$$TITLE,$$OPTIONS_COMMAND); \
		YEAR="$$option"; \
	done \
	&& echo "$$YEAR"; \
)

DAY_CMDS=$(filter \
	$(MAKECMDGOALS), \
	solve \
	submit \
)
EXTENSION:=`cat ${YEAR}/.extension`
DAY_COMMAND=$(shell echo 'find ${YEAR}/* -maxdepth 0 -type f | grep "${EXTENSION}" | cut -d"/" -f2 | cut -d"." -f1 | sort -u | grep -v [a-z]')
export DAY:=$(shell \
	while [ -z "$$DAY" ] && [ -z "${DAY}" ] && [ "${DAY_CMDS}" != "" ]; do \
		TITLE="DAY (DAY number to solve from ${YEAR}):"; \
		OPTIONS_COMMAND="$(DAY_COMMAND)"; \
		$(call select_option,$$TITLE,$$OPTIONS_COMMAND); \
		DAY="$$option"; \
	done \
	&& echo "$$DAY"; \
)

PART_CMDS=$(filter \
	$(MAKECMDGOALS), \
	solve \
	submit \
)
PART_COMMAND=$(shell echo 'find ${YEAR}/${DAY}.* -maxdepth 0 -type f | grep "${EXTENSION}" | cut -d"/" -f2 | cut -d"." -f2 | grep -v [a-z]')
export PART:=$(shell \
	while [ -z "$$PART" ] && [ -z "${PART}" ] && [ "${PART_CMDS}" != "" ]; do \
		TITLE="PART (which part of ${YEAR} \#${DAY} to solve):"; \
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

ANSWER_CMDS=$(filter \
	$(MAKECMDGOALS), \
	submit \
)
export ANSWER:=$(shell \
	while [ -z "$$ANSWER" ] && [ -z "${ANSWER}" ] && [ "${INSTALL_DEPENDENCIES_CMDS}" != "" ]; do \
		TITLE="ANSWER (What is the answer to ${YEAR}.${DAY}.${PART}  ):"; \
		OPTIONS_COMMAND=""; \
		$(call select_option,$$TITLE,$$OPTIONS_COMMAND); \
		ANSWER="$$option"; \
	done \
	&& echo "$$ANSWER"; \
)

with-nvm:
	@. ${NVM_DIR}/nvm.sh && nvm use && ${CMD}

solve:
	@if [ "${INSTALL_DEPENDENCIES}" == "true" ]; then \
		make install-dependencies YEAR=${YEAR}; \
	fi
	@make solve-${YEAR} FILE="${YEAR}/${DAY}.${PART}${EXTENSION}"

install-dependencies:
	@pip3 install -r requirements.txt
	@make install-dependencies-${YEAR}

submit:
	@python3 submit.py --year ${YEAR} --day ${DAY} --part ${PART} "${ANSWER}"
# TODO if correct, then repull example and repull html
# make update_question YEAR=${YEAR} DAY=${DAY} 
bootstrap:
	@mkdir -p `date +%Y` || echo "${YEAR}/${DAY} already exists"; \
	for YEAR in `${YEAR_COMMAND}` ; do \
		for DAY in `seq -w 1 25` ; do \
			FOLDER="$$YEAR/$$DAY" && \
			if [ "`date +%Y`" != "$$YEAR" ] || [ $$DAY -le `date +%d` ]; then \
				mkdir -p "$$FOLDER" || echo "$$FOLDER already exists" && \
				if [ ! -f "$$FOLDER/example.txt" ]; then \
					make update_question YEAR=$$YEAR DAY=$$DAY; \
				fi && \
				if [ ! -f "$$FOLDER/input.txt" ]; then \
					AOC_SESSION=${AOC_SESSION} aocd $$YEAR $$DAY > "$$FOLDER/input.txt"; \
				fi && \
				make update_question YEAR=$$YEAR DAY=$$DAY && \
				sleep 10; \
			fi \
		done \
    done 

update_question:	
	@DAY_CLEANED=`bc<<<${DAY}` && \
	curl  -X GET -H 'Cookie: session=${AOC_SESSION}' https://adventofcode.com/${YEAR}/day/$$DAY_CLEANED > "${YEAR}/${DAY}/question.html"
#AOC_SESSION=${AOC_SESSION} aocd ${YEAR} ${DAY} --example > "${YEAR}/${DAY}/example.txt";

