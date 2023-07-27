function clean_dsstore
	find . -name '*.DS_Store' -type f -ls -delete;
end
