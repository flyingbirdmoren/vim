" like org-mode ==>>  insert mode <A-CR> 自动增加 序号（无序+有序）
function AddOrderNumber()
    " 获取当前行的第一个word,判断它是否为*，+ ，-，1.等
    let cur_line = getline('.')
    let mark = str2nr(cur_line)
    let mark = mark + 1
    let content = repeat(' ',indent('.'))
    call append(line('.'), content + mark)
    
    let pos = [0,line('.')+1,col([line('.')+1,'$']),0]
    call setpos('.',pos)
endfunction

inoremap <m-j> <Esc>:call AddOrderNumber()<CR>a

