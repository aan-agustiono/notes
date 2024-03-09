
```
SHOW GRANTS FOR 'user'@localhost;   

# Creating user
CREATE USER 'user' IDENTIFIED BY 'mypassword';
GRANT USAGE ON *.* TO 'user'@'%' IDENTIFIED BY 'mypassword';
FLUSH PRIVILEGES;
```
