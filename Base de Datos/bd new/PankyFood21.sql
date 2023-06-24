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

CREATE OR REPLACE PROCEDURE ELIMINAR_ALIMENTO (
    p_Id IN INT
)
AS
BEGIN
    DELETE FROM Alimento WHERE Id = p_Id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('El alimento ha sido eliminado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al eliminar el alimento.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/
DECLARE
  v_Id INT := 1; -- Reemplaza 1 con el ID del alimento que deseas eliminar
BEGIN
EliminarAlimento(v_Id);
END;  
/

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

--usuario
CREATE SEQUENCE Usuario_Id_Sequence START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE PROCEDURE AgregarUsuario (
    p_Nombre IN VARCHAR2,
    p_Contrasena IN VARCHAR2
) AS
BEGIN
    INSERT INTO Usuario (Nombre, Contrasena)
    VALUES (p_Nombre, p_Contrasena);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Nuevo usuario agregado correctamente.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al agregar el nuevo usuario: ' || SQLERRM);
END;



BEGIN
    AgregarUsuario('sDoe', '2122');
END;

select*from usuario;