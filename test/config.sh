#!/bin/bash
set -e

testAlias+=(
	[astrad:trusty]='astrad'
)

imageTests+=(
	[astrad]='
		rpcpassword
	'
)
