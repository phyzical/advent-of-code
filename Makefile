include 2016/Makefile
include 2017/Makefile
include 2018/Makefile
include 2019/Makefile
include 2020/Makefile
include 2021/Makefile
include 2022/Makefile

install-dependencies:
	bundle install && npm i && pip3 install -r requirements.txt
