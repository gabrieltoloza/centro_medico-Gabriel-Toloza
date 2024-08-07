USE centro_medico;


SELECT
    User,
    Host,
    Insert_priv,
    Update_priv,
    Select_priv,
    Delete_priv,
    Grant_priv,
    Super_priv,
    Create_user_priv,
    account_locked 
FROM mysql.user;