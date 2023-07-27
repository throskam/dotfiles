function pinit --description 'Initialize a project' --argument-names "type"
	argparse -N 1 -- $argv; or return

	npx license (npm get init-license) --name (npm get init-author-name) --email (npm get init-author-email)
	npx covgen (npm get init-author-email)
	npx gitignore $type --macos

	printf "# %s" (basename "$PWD") > README.md
	echo "\
root = true

[*]
charset = utf-8
end_of_line = lf
indent_style = tab
indent_size = 4
insert_final_newline = false
trim_trailing_whitespace = true

# HTML
[*.{htm,html}]
indent_style = space
indent_size = 2

# XML
[*.{xml,svg}]
indent_style = space
indent_size = 2

# Javascript
[*.{js,mjs,ts,tsx,vue}]
indent_style = space
indent_size = 2
insert_final_newline = true

# Style
[*.{css,sass,scss,less}]
indent_style = space
indent_size = 2

# JSON
[*.{json,json5}]
indent_style = space
indent_size = 2

# YAML
[*.{yml,yaml}]
indent_style = space
indent_size = 2

# Markdown
[*.md]
trim_trailing_whitespace = false
max_line_length = 80" > .editorconfig

	switch $type
		case node
			npm init -y --scope throskam
			npm init @eslint/config
		case go
			go mod init github.com/throskam/(basename "$PWD")
	end

	git init
	git add -A
	git commit -m "Initial commit"
end
