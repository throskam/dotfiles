function ninit --description 'Initialize a node project'
	npx license (npm get init.license) -o (npm get init.author.name)
	npx gitignore node
	npx covgen (npm get init.author.email)
	npm init -y --scope throskam
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

[*.{json,json5}]
indent_style = space
indent_size = 2

# YAML Files
indent_style = space
indent_size = 2

# Markdown Files
[*.md]
trim_trailing_whitespace = false
max_line_length = 80" > .editorconfig
	npx eslint --init
	git init
	git add -A
	git commit -m "Initial commit"
end
