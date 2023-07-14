# rstudio服务器设置的笔记

根据[官方文档](https://docs.rstudio.com/ide/server-pro/r_sessions/customizing_session_settings.html)的说法，rstudio server的设置文件分别在

- `/etc/rstudio/`：全局设置
- `~/.config/rstudio/`：个人设置

# backup guide

另外根据[文档](https://docs.rstudio.com/ide/server-pro/server_management/backup_guide.html)的说法，以下路径应该被备份

```
/etc/rstudio/
/var/lib/rstudio-server/
/var/lib/rstudio-launcher/
/var/log/rstudio/rstudio-server/
/var/log/rstudio/launcher/
~/.config/rstudio, for each user
~/.local/share/rstudio, for each user
```