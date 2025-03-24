
CREATE TRIGGER PreventInsufficientWithdrawal
ON Transactions
FOR INSERT
AS
BEGIN
    DECLARE @AccountID INT, @TransactionType VARCHAR(10), @Amount DECIMAL(10, 2), @CurrentBalance DECIMAL(12, 2);
    SELECT @AccountID = AccountID, @TransactionType = TransactionType, @Amount = Amount
    FROM inserted;
    IF @TransactionType = 'Withdraw'
    BEGIN
        SELECT @CurrentBalance = Balance
        FROM Accounts
        WHERE AccountID = @AccountID;
        IF @Amount > @CurrentBalance
        BEGIN
            THROW 50000, 'Insufficient balance for withdrawal', 1;
        END
    END
END;




INSERT INTO Transactions (AccountID, TransactionType, Amount)
VALUES (1, 'Withdraw', 6000.00);
