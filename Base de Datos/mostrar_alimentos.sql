CREATE OR REPLACE PROCEDURE MostrarAlimentos AS
  -- Define un cursor para contener el resultado de la consulta
  CURSOR c_alimentos IS 
    SELECT Id, Nombre, Descripcion, Precio 
    FROM Alimento;
  
  -- Define un tipo de registro para contener una sola fila del resultado del cursor
  TYPE t_alimento IS RECORD (
    Id Alimento.Id%TYPE,
    Nombre Alimento.Nombre%TYPE,
    Descripcion Alimento.Descripcion%TYPE,
    Precio Alimento.Precio%TYPE
  );
  
  -- Define una variable para contener una sola fila del resultado del cursor
  r_alimento t_alimento;

BEGIN
  -- Abre el cursor
  OPEN c_alimentos;
  
  -- Loop a través del resultado del cursor
  LOOP
    -- Obtén la siguiente fila en la variable de registro
    FETCH c_alimentos INTO r_alimento;
    
    -- Sal del loop si no hay más filas
    EXIT WHEN c_alimentos%NOTFOUND;
    
    -- Muestra la información del alimento utilizando la variable de registro
    DBMS_OUTPUT.PUT_LINE('Id: ' || r_alimento.Id || ' | Nombre: ' || r_alimento.Nombre || ' | Descripción: ' || r_alimento.Descripcion || ' | Precio: ' || r_alimento.Precio);
  END LOOP;
  
  -- Cierra el cursor
  CLOSE c_alimentos;
  
EXCEPTION
  -- Maneja cualquier excepción que ocurra durante la ejecución del procedimiento
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLCODE || ' - ' || SQLERRM);
END;
/
EXECUTE MostrarAlimentos;