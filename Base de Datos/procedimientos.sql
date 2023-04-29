---------------------------------------------------------------------------
--            TAREA 1
---------------------------------------------------------------------------

/*
Muestra todas las reservas de un cliente en un determinado local 
*/
create or replace procedure Mostrar_Cliente_Reservas_Local(id_cliente int, id_local int) as 
begin 
    DBMS_OUTPUT.PUT_LINE('NOMBRE		RESERVA - LOCAL	NOMBRE_LOCAL		DIRECCION_LOCAL'); 
    for item in ( 
        select c.nombre as nombre_cliente, r.id as id_reserva, l.id as id_local, l.nombre as nombre_local, l.direccion as direccion_local 
            from Cliente c 
            inner join reserva r on r.idcliente = c.id and c.Id = id_cliente 
            inner join local l on l.Id = r.idlocal and l.Id = id_local 
    )  
    loop 
        DBMS_OUTPUT.PUT_LINE(item.nombre_cliente || '	' || item.id_reserva || '	' || item.id_local || '	' || item.nombre_local || '	' || item.direccion_local); 
    end loop; 
END; 
/

exec Mostrar_Cliente_Reservas_Local(1,1)
exec Mostrar_Cliente_Reservas_Local(2,3)


/*
Muestra los horarios de los empleados
*/
CREATE OR REPLACE PROCEDURE MostrarEmpleadosHorarioLocal AS
BEGIN
  FOR c IN (SELECT e.Nombre, h.Inicio, h.Fin, l.Nombre AS Local 
            FROM Empleado e 
            JOIN Local l ON e.IdLocal = l.Id 
            JOIN EmpleadoHorario eh ON e.Id = eh.IdEmpleado 
            JOIN Horario h ON eh.IdHorario = h.Id) LOOP
    DBMS_OUTPUT.PUT_LINE('Empleado: ' || c.Nombre || ' | Horario: ' || c.Inicio || ' - ' || c.Fin || ' | Local: ' || c.Local);
  END LOOP;
END;
/
--ejecucion 
BEGIN
  MostrarEmpleadosHorarioLocal;
END;


/*
Muestra el total de ventas de un local
*/

CREATE OR REPLACE PROCEDURE ventas_por_local(
    local_id IN NUMBER
) AS
    v_total NUMBER;
BEGIN
    SELECT SUM(a.Precio)
    INTO v_total
    FROM Orden o
    JOIN OrdenAlimentos oa ON o.Id = oa.IdOrden
    JOIN Alimento a ON oa.IdAlimento = a.Id
    JOIN Ventanilla v ON o.IdVentanilla = v.Id
    WHERE v.IdLocal = local_id;
    
    DBMS_OUTPUT.PUT_LINE('Total de ventas del local ' || local_id || ': $' || v_total);
END;
/
    
BEGIN
    ventas_por_local(1);
END;
/

---------------------------------------------------------------------------
--            TAREA 2
---------------------------------------------------------------------------

/*
Muestra los alimentos usando Cursores, Rowtypes, Types y Manejo de excepciones
*/
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

/*
Muestra todos los locales que no han realizado ventas (ordenes)
*/

CREATE OR REPLACE PROCEDURE obtener_locales_sin_ventas as
  CURSOR c_locales IS         
    SELECT l.id, l.nombre, l.direccion, l.telefono
        FROM Local l
        LEFT JOIN Orden o ON o.IdVentanilla = l.Id
        LEFT JOIN OrdenAlimentos oa ON oa.IdOrden = o.Id
        LEFT JOIN Alimento a ON a.Id = oa.IdAlimento
        WHERE a.Id IS NULL
        GROUP BY  l.id, l.nombre, l.direccion, l.telefono;
    
  TYPE t_local IS RECORD (
    Id Local.Id%TYPE,
    Nombre Local.Nombre%TYPE,
    Direccion Local.Direccion%TYPE,
    Telefono Local.Telefono%TYPE
  );

  locales t_local;
BEGIN
  OPEN c_locales;
  LOOP
    FETCH c_locales INTO locales;
    EXIT WHEN c_locales%NOTFOUND;
  DBMS_OUTPUT.PUT_LINE(locales.Id||'; '||locales.Nombre||'; '||locales.Direccion||'; '||locales.Telefono);
  END LOOP;
  
  CLOSE c_locales;

  EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: '||SQLCODE||' '||SQLERRM);
END;
/

exec obtener_locales_sin_ventas;

/*
Muestra el total de ventas de un local
*/

CREATE OR REPLACE PROCEDURE ventas_por_local(local_id IN NUMBER)  AS
  v_total NUMBER;
  v_orden_id Orden.Id%TYPE;
  v_alimento_precio Alimento.Precio%TYPE;

  CURSOR c_ordenes IS
    SELECT o.Id
      FROM Orden o
      JOIN Ventanilla v ON o.IdVentanilla = v.Id
      WHERE v.IdLocal = local_id;

  CURSOR c_ordenes_alimentos (orden_id Orden.Id%TYPE) IS
    SELECT oa.IdAlimento, a.Precio
      FROM OrdenAlimentos oa
      JOIN Alimento a ON oa.IdAlimento = a.Id
      WHERE oa.IdOrden = orden_id;
  BEGIN

  v_total := 0;

  FOR o IN c_ordenes LOOP
    FOR oa IN c_ordenes_alimentos(o.Id) LOOP
      v_total := v_total + oa.Precio;
    END LOOP;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Total de ventas del local ' || local_id|| ': $' || v_total);
END;
/