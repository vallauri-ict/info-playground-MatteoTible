CREATE TRIGGER UpdateClienti
	ON [dbo].[Clienti]
	AFTER UPDATE
	AS
	BEGIN
		DECLARE @IdCliente AS INT;
		DECLARE @NomeOld AS VARCHAR(50);
		DECLARE @NomeNew AS VARCHAR(50);
		DECLARE @CognomeOld AS VARCHAR(50);
		DECLARE @CognomeNew AS VARCHAR(50);
		DECLARE @IdCarrelloOld AS VARCHAR(50);
		DECLARE @IdCarrelloNew AS VARCHAR(50);

		SET @IdCliente = OLD.IdCliente;
		SET @NomeOld = OLD.Nome;
		SET @NomeNew = NEW.Nome;
		SET @CognomeOld = OLD.Cognome;
		SET @CognomeNew = NEW.Cognome;
		SET @IdCarrelloOld = OLD.IdCarrello;
		SET @IdCarrelloNew = NEW.IdCarrello;

		IF (@NomeOld = @NomeNew)
			SET @NomeOld = NULL;
		IF (@NomeOld = NULL)
			SET @NomeNew = NULL;

		IF (@CognomeOld = @CognomeNew)
			SET @CognomeOld = NULL;
		IF (@CognomeOld = NULL)
			SET @CognomeNew = NULL;
		
		IF (@IdCarrelloOld = @IdCarrelloNew)
			SET @IdCarrelloOld = NULL;
		IF (@IdCarrelloOld = NULL)
			SET @IdCarrelloNew = NULL;
		

		INSERT INTO StoricoAggiornamenti (IdCliente,NomeOld,NomeNew,CognomeOld,CognomeNew,IdCarrelloOld,IdCarrelloNew)
		VALUES (@IdCliente,@NomeOld,@NomeNew,@CognomeOld,@CognomeNew,@IdCarrelloOld,@IdCarrelloNew);
	END;