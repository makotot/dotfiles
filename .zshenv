if [[ -f ~/.nvm/nvm.sh ]]; then
	source ~/.nvm/nvm.sh

	if which nvm >/dev/null 2>&1 ;then
		_nodejs_use_version="v0.10.0"
		if nvm ls | grep -F -e "${_nodejs_use_version}" >/dev/null 2>&1 ;then
			nvm use "${_nodejs_use_version}" >/dev/null
			export NODE_PATH=${NVM_PATH}_modules${NODE_PATH:+:}${NODE_PATH}
		fi
		unset _nodejs_use_version
	fi
fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export GOPATH=~/.go
export PATH=$GOPATH/bin:$PATH
