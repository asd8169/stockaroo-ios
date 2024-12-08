# Apple Intel Mac
if test -d "/usr/local/bin/"; then
	PATH="/usr/local/bin/:${PATH}"
fi

export PATH
YML="$(dirname "$0")/.swiftlint.yml" # Script/

if which swiftlint > /dev/null; then
	swiftlint --config "${YML}"
else
	echo "warning: SwiftLint not installed, please run 'brew install swiftlint'"
fi
