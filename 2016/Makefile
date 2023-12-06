with-nvm:
	@. ${NVM_DIR}/nvm.sh && nvm use && ${CMD}
solve-2016:
	@make with-nvm CMD="node --stack-size=9999 ${FILE}"
install-dependencies-2016:
	@make with-nvm CMD="npm i"