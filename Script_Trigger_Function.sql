CREATE OR REPLACE FUNCTION insere_na_recuperacao()
  RETURNS TRIGGER AS
  $$
  BEGIN
	IF (SELECT nota FROM Nota WHERE id = NEW.id_nota) < 6 THEN
	
      INSERT INTO Recuperacao (id_aluno, id_disciplina, id_nota, data)
      VALUES (NEW.id_aluno, NEW.id_disciplina, NEW.id_nota, NOW());
	  
    END IF;
    RETURN NEW;
  END;
  $$
LANGUAGE plpgsql;

CREATE TRIGGER trig_insere_na_recuperacao
  AFTER INSERT ON Recuperacao
  FOR EACH ROW
  EXECUTE FUNCTION insere_na_recuperacao();
