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

