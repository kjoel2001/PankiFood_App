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
