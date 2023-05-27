CREATE SEQUENCE telefono_id_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER telefono_trigger
BEFORE INSERT ON telefono
FOR EACH ROW
BEGIN
  SELECT telefono_id_seq.NEXTVAL INTO :new.id FROM dual;
END;
/

create or replace PROCEDURE CrearNuevoTelefono(
     p_numero IN VARCHAR2
) IS
BEGIN
    INSERT INTO Telefono (Numero) VALUES (p_numero);
    DBMS_OUTPUT.PUT_LINE('Número de teléfono insertado: ' || p_numero);

END;
/

BEGIN
    CREARNUEVOTELEFONO('1011121');
END;
/

create or replace PROCEDURE ActualizarTelefono(
    p_id IN NUMBER,
    p_numero IN VARCHAR2
) IS
BEGIN
    UPDATE Telefono
    SET Numero = p_numero
    WHERE Id = p_id;

    IF SQL%ROWCOUNT = 1 THEN
        DBMS_OUTPUT.PUT_LINE('Teléfono actualizado correctamente.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No se encontró el teléfono con el ID especificado.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

create or replace PROCEDURE EliminarTelefono(
    p_id IN NUMBER
) IS
BEGIN
    DELETE FROM Telefono
    WHERE Id = p_id;

    IF SQL%ROWCOUNT = 1 THEN
        DBMS_OUTPUT.PUT_LINE('Teléfono eliminado correctamente.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No se encontró el teléfono con el ID especificado.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/