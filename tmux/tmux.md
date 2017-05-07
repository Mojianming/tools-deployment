# tmux 常用命令和快捷键
---
* 常用命令

> tmux new -s 'session_name' : 启动一个sesssion
>
> tmux ls : 列从当前tmux下有那些session
>
> tmux a : 恢复至上一次的会话(配合 prefix + d 使用 )
>
> tmux a -t session_name : 根据session名字回到session中
>

---
* 前缀键

> prefix : ctrl + x

---
* 常用快捷键

> prefix + c : 创建新窗口
>
> prefix + d : 退出当前session(后台)
>
> prefix + | : 竖直方向切割窗口
>
> prefix + - : 水平方向切割窗口
>
> prefix + n : 切换下一个窗口
>
> prefix + p : 切换上一个窗口
>
> prefix + number : 切换到数字对应的窗口
>
> prefix + , : 重命名当前窗口
>
> prefix + w : 通过窗口列表切换窗口
>
> prefix + . : 修改当前窗口编号
>
> prefix + x : 关闭当前分屏
>
> prefix + ! : 将当前面板置于新窗口
>
> prefix + ^h/^j/^k/^l : 调节pane的到小
>
> prefix + h/j/k/l : 切换pane
>
> prefix + q : 退出当前面板
>
> prefix + s : 以菜单方式显示和选择session
>

