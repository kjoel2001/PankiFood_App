-- Insertar aliementos
CREATE OR REPLACE PROCEDURE INSERT_ALIMENTO(NOMBREP VARCHAR2, DESCRIPCIONP VARCHAR2, PRECIOP NUMBER) AS
  V_ID ALIMENTO.ID%TYPE;
BEGIN
  SELECT NVL(MAX(ID), 0) + 1 INTO V_ID FROM ALIMENTO;
  
  INSERT INTO ALIMENTO(ID, NOMBRE, DESCRIPCION, PRECIO)
  VALUES (V_ID, NOMBREP, DESCRIPCIONP, PRECIOP);
  COMMIT;
END;
/

BEGIN
INSERT_ALIMENTO('Nombre del alimento', 'Descripción del alimento', 9);
END;

--Eliminar aliemento
CREATE OR REPLACE PROCEDURE ELIMINAR_ALIMENTO(ALIMENTOID NUMBER) AS
BEGIN
  DELETE FROM ALIMENTO WHERE ID = ALIMENTOID;
  DBMS_OUTPUT.PUT_LINE('EL REGISTRO HA SIDO ELIMINADO');
END;
/

SET SERVEROUTPUT ON
EXECUTE ELIMINAR_ALIMENTO(22);

--Actulizar Alimento
CREATE OR REPLACE PROCEDURE ActualizarAlimento(
    p_Id IN Alimento.Id%TYPE,
    p_Nombre IN Alimento.Nombre%TYPE,
    p_Descripcion IN Alimento.Descripcion%TYPE,
    p_Precio IN Alimento.Precio%TYPE
)
IS
BEGIN
    UPDATE Alimento
    SET Nombre = p_Nombre,
        Descripcion = p_Descripcion,
        Precio = p_Precio
    WHERE Id = p_Id;
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Registro actualizado correctamente.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al actualizar el registro: ' || SQLERRM);
END;

BEGIN
  ActualizarAlimento(1,'arroz','arroz',15);
END;


select*from alimento;
