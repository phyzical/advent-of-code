
2018_FILE=

run-2018:
	elixir 2018/helper.ex
	elixirc 2018/helper.ex
	iex ${2018_FILE}

2018-1-1:
	make run-2018 2018_FILE=2018/1.1.ex
2018-1-2:
	make run-2018 2018_FILE=2018/1.2.ex

2018-2-1:
	make run-2018 2018_FILE=2018/2.1.ex
2018-2-2:
	make run-2018 2018_FILE=2018/2.2.ex

2018-3-1:
	make run-2018 2018_FILE=2018/3.1.ex
2018-3-2:
	make run-2018 2018_FILE=2018/3.2.ex

2018-4-1:
	make run-2018 2018_FILE=2018/4.1.ex
2018-4-2:
	make run-2018 2018_FILE=2018/4.2.ex

2018-5-1:
	make run-2018 2018_FILE=2018/5.1.ex
2018-5-2:
	make run-2018 2018_FILE=2018/5.2.ex
	
2017_FILE=

run-2017:
	python ${2017_FILE}

2017-1-1:
	make run-2017 2017_FILE=2017/1.1.py
2017-1-2:
	make run-2017 2017_FILE=2017/1.2.py

2017-2-1:
	make run-2017 2017_FILE=2017/2.1.py
2017-2-2:
	make run-2017 2017_FILE=2017/2.2.py

2017-3-1:
	make run-2017 2017_FILE=2017/3.1.py
2017-3-2:
	make run-2017 2017_FILE=2017/3.2.py

2017-4-1:
	make run-2017 2017_FILE=2017/4.1.py
2017-4-2:
	make run-2017 2017_FILE=2017/4.2.py

2017-5-1:
	make run-2017 2017_FILE=2017/5.1.py
2017-5-2:
	make run-2017 2017_FILE=2017/5.2.py

2017-6-1:
	make run-2017 2017_FILE=2017/6.1.py
2017-6-2:
	make run-2017 2017_FILE=2017/6.2.py