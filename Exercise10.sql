# 02.請授予使用者william對資料庫EXAMPLE底下所有物件的所有權限
grant all
on EXAMPLE.*
to 'william'@'%';
# 03.請撤銷william對資料庫EXAMPLE底下所有物件的所有權限
revoke all
on EXAMPLE.*
from 'william'@'%';