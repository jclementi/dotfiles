augroup filetypedetect
	au! BufRead,BufNewFile *.txt	set filetype=txt
	au! BufRead,BufNewFile *.md		set filetype=markdown
	au! BufRead,BufNewFile *.ts		set filetype=javascript
	au! BufRead,BufNewFile *.jade		set filetype=jade
augroup END
