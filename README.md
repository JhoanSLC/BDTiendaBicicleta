<img src="IMG/diagramaDb.png">

# Casos de Uso para la Base de Datos

## Caso de Uso 1: Gestión de Inventario de Bicicletas

Descripción: Este caso de uso describe cómo el sistema gestiona el inventario de bicicletas,
permitiendo agregar nuevas bicicletas, actualizar la información existente y eliminar bicicletas que
ya no están disponibles.
Actores:
Administrador de Inventario

Flujo Principal:
1. El administrador de inventario ingresa al sistema.
2. El administrador selecciona la opción para agregar una nueva bicicleta.
3. El administrador ingresa los detalles de la bicicleta (modelo, marca, precio, stock).

```sql

```

4. El sistema valida y guarda la información de la nueva bicicleta.

```sql

```

5. El administrador selecciona una bicicleta existente para actualizar.

```sql

```

6. El administrador actualiza la información (precio, stock).
7. El sistema valida y guarda los cambios.

```sql

```

8. El administrador selecciona una bicicleta para eliminar.

```sql

```

9. El sistema elimina la bicicleta seleccionada del inventario.

```sql

```

## Caso de Uso 2: Registro de Ventas

Descripción: Este caso de uso describe el proceso de registro de una venta de bicicletas,
incluyendo la creación de una nueva venta, la selección de las bicicletas vendidas y el cálculo del
total de la venta.
Actores:
Vendedor

Flujo Principal:
1. El vendedor ingresa al sistema.
2. El vendedor selecciona la opción para registrar una nueva venta.
3. El vendedor selecciona el cliente que realiza la compra.
4. El vendedor selecciona las bicicletas que el cliente desea comprar y especifica la cantidad.

```sql

```

5. El sistema calcula el total de la venta.

```sql

```

6. El vendedor confirma la venta.
7. El sistema guarda la venta y actualiza el inventario de bicicletas.

```sql

```

## Caso de Uso 3: Gestión de Proveedores y Repuestos

Descripción: Este caso de uso describe cómo el sistema gestiona la información de proveedores y
repuestos, permitiendo agregar nuevos proveedores y repuestos, actualizar la información
existente y eliminar proveedores y repuestos que ya no están activos.
Actores:
Administrador de Proveedores
Flujo Principal:

1. El administrador de proveedores ingresa al sistema.
2. El administrador selecciona la opción para agregar un nuevo proveedor.
3. El administrador ingresa los detalles del proveedor (nombre, contacto, teléfono, correo
electrónico, ciudad).

```sql

```

4. El sistema valida y guarda la información del nuevo proveedor.

```sql

```

5. El administrador selecciona la opción para agregar un nuevo repuesto.

```sql

```

6. El administrador ingresa los detalles del repuesto (nombre, descripción, precio, stock,
proveedor).

```sql

```

7. El sistema valida y guarda la información del nuevo repuesto.

```sql

```

8. El administrador selecciona un proveedor existente para actualizar.
9. El administrador actualiza la información del proveedor.

```sql

```

10. El sistema valida y guarda los cambios.

```sql

```


11. El administrador selecciona un repuesto existente para actualizar.
12. El administrador actualiza la información del repuesto.

```sql

```

13. El sistema valida y guarda los cambios.

```sql

```


14. El administrador selecciona un proveedor para eliminar.

```sql

```

15. El sistema elimina el proveedor seleccionado.

```sql

```

16. El administrador selecciona un repuesto para eliminar.

```sql

```

17. El sistema elimina el repuesto seleccionado.

```sql

```

## Caso de Uso 4: Consulta de Historial de Ventas por Cliente

Descripción: Este caso de uso describe cómo el sistema permite a un usuario consultar el
historial de ventas de un cliente específico, mostrando todas las compras realizadas por el cliente
y los detalles de cada venta.
Actores:
Vendedor
Administrador
Flujo Principal:

1. El usuario ingresa al sistema.
2. El usuario selecciona la opción para consultar el historial de ventas.
3. El usuario selecciona el cliente del cual desea ver el historial.

```sql

```

4. El sistema muestra todas las ventas realizadas por el cliente seleccionado.

```sql

```

5. El usuario selecciona una venta específica para ver los detalles.

```sql

```

6. El sistema muestra los detalles de la venta seleccionada (bicicletas compradas, cantidad,
precio).

```sql

```

## Caso de Uso 5: Gestión de Compras de Repuestos

Descripción: Este caso de uso describe cómo el sistema gestiona las compras de repuestos a
proveedores, permitiendo registrar una nueva compra, especificar los repuestos comprados y
actualizar el stock de repuestos.
Actores:
Administrador de Compras
Flujo Principal:

1. El administrador de compras ingresa al sistema.
2. El administrador selecciona la opción para registrar una nueva compra.
3. El administrador selecciona el proveedor al que se realizó la compra.
4. El administrador ingresa los detalles de la compra (fecha, total).

```sql

```

5. El sistema guarda la compra y genera un identificador único.

```sql

```

6. El administrador selecciona los repuestos comprados y especifica la cantidad y el precio
unitario.

```sql

```

7. El sistema guarda los detalles de la compra y actualiza el stock de los repuestos comprados.

```sql

```

# Casos de Uso con Subconsultas

## Caso de Uso 6: Consulta de Bicicletas Más Vendidas por Marca

Descripción: Este caso de uso describe cómo el sistema permite a un usuario consultar las
bicicletas más vendidas por cada marca.
Actores:
Vendedor
Administrador
Flujo Principal:

1. El usuario ingresa al sistema.
2. El usuario selecciona la opción para consultar las bicicletas más vendidas por marca.

```sql

```

3. El sistema muestra una lista de marcas y el modelo de bicicleta más vendido para cada
marca.

```sql

```

## Caso de Uso 7: Clientes con Mayor Gasto en un Año Específico

Descripción: Este caso de uso describe cómo el sistema permite consultar los clientes que han
gastado más en un año específico.
Actores:
Administrador
Flujo Principal:

1. El administrador ingresa al sistema.
2. El administrador selecciona la opción para consultar los clientes con mayor gasto en un año
específico.
3. El administrador ingresa el año deseado.

```sql

```


4. El sistema muestra una lista de los clientes que han gastado más en ese año, ordenados por
total gastado.

```sql

```

## Caso de Uso 8: Proveedores con Más Compras en el Último Mes

Descripción: Este caso de uso describe cómo el sistema permite consultar los proveedores que
han recibido más compras en el último mes.
Actores:
Administrador de Compras
Flujo Principal:

1. El administrador de compras ingresa al sistema.
2. El administrador selecciona la opción para consultar los proveedores con más compras en el
último mes.

```sql

```

3. El sistema muestra una lista de proveedores ordenados por el número de compras recibidas
en el último mes.

```sql

```

## Caso de Uso 9: Repuestos con Menor Rotación en el Inventario

Descripción: Este caso de uso describe cómo el sistema permite consultar los repuestos que han
tenido menor rotación en el inventario, es decir, los menos vendidos.
Actores:
Administrador de Inventario
Flujo Principal:

1. El administrador de inventario ingresa al sistema.
2. El administrador selecciona la opción para consultar los repuestos con menor rotación.

```sql

```

3. El sistema muestra una lista de repuestos ordenados por la cantidad vendida, de menor a
mayor.

```sql

```

## Caso de Uso 10: Ciudades con Más Ventas Realizadas

Descripción: Este caso de uso describe cómo el sistema permite consultar las ciudades donde se
han realizado más ventas de bicicletas.
Actores:
Administrador
Flujo Principal:

1. El administrador ingresa al sistema.
2. El administrador selecciona la opción para consultar las ciudades con más ventas realizadas.

```sql

```

3. El sistema muestra una lista de ciudades ordenadas por la cantidad de ventas realizadas.

```sql

```

# Casos de Uso con Joins

## Caso de Uso 11: Consulta de Ventas por Ciudad

Descripción: Este caso de uso describe cómo el sistema permite consultar el total de ventas
realizadas en cada ciudad.
Actores:
Administrador
Flujo Principal:

1. El administrador ingresa al sistema.
2. El administrador selecciona la opción para consultar las ventas por ciudad.

```sql

```

3. El sistema muestra una lista de ciudades con el total de ventas realizadas en cada una.

```sql

```

## Caso de Uso 12: Consulta de Proveedores por País

Descripción: Este caso de uso describe cómo el sistema permite consultar los proveedores
agrupados por país.
Actores:
Administrador de Compras
Flujo Principal:

1. El administrador de compras ingresa al sistema.
2. El administrador selecciona la opción para consultar los proveedores por país.

```sql

```

3. El sistema muestra una lista de países con los proveedores en cada país.

```sql

```

## Caso de Uso 13: Compras de Repuestos por Proveedor

Descripción: Este caso de uso describe cómo el sistema permite consultar el total de repuestos
comprados a cada proveedor.
Actores:
Administrador de Compras
Flujo Principal:

1. El administrador de compras ingresa al sistema.
2. El administrador selecciona la opción para consultar las compras de repuestos por
proveedor.

```sql

```

3. El sistema muestra una lista de proveedores con el total de repuestos comprados a cada
uno.

```sql

```

## Caso de Uso 14: Clientes con Ventas en un Rango de Fechas

Descripción: Este caso de uso describe cómo el sistema permite consultar los clientes que han
realizado compras dentro de un rango de fechas específico.
Actores:
Vendedor
Administrador
Flujo Principal:

1. El usuario ingresa al sistema.
2. El usuario selecciona la opción para consultar los clientes con ventas en un rango de fechas.
3. El usuario ingresa las fechas de inicio y fin del rango.

```sql

```

4. El sistema muestra una lista de clientes que han realizado compras dentro del rango de
fechas especificado.

```sql

```

# Casos de Uso para Implementar Procedimientos Almacenados

## Caso de Uso 1: Actualización de Inventario de Bicicletas

Descripción: Este caso de uso describe cómo el sistema actualiza el inventario de bicicletas
cuando se realiza una venta.
Actores:
Vendedor
Flujo Principal:

1. El vendedor ingresa al sistema.
2. El vendedor registra una venta de bicicletas.

```sql

```

3. El sistema llama a un procedimiento almacenado para actualizar el inventario de las
bicicletas vendidas.
4. El procedimiento almacenado actualiza el stock de cada bicicleta.

```sql

```

## Caso de Uso 2: Registro de Nueva Venta

Descripción: Este caso de uso describe cómo el sistema registra una nueva venta, incluyendo la
creación de la venta y la inserción de los detalles de la venta.
Actores:
Vendedor
Flujo Principal:

1. El vendedor ingresa al sistema.
2. El vendedor registra una nueva venta.

```sql

```

3. El sistema llama a un procedimiento almacenado para registrar la venta y sus detalles.
4. El procedimiento almacenado inserta la venta y sus detalles en las tablas correspondientes.

```sql

```

## Caso de Uso 3: Generación de Reporte de Ventas por Cliente

Descripción: Este caso de uso describe cómo el sistema genera un reporte de ventas para un
cliente específico, mostrando todas las ventas realizadas por el cliente y los detalles de cada venta.
Actores:
Administrador
Flujo Principal:

1. El administrador ingresa al sistema.
2. El administrador selecciona un cliente para generar un reporte de ventas.

```sql

```

3. El sistema llama a un procedimiento almacenado para generar el reporte.
4. El procedimiento almacenado obtiene las ventas y los detalles de las ventas realizadas por el
cliente.

```sql

```

## Caso de Uso 4: Registro de Compra de Repuestos
Descripción: Este caso de uso describe cómo el sistema registra una nueva compra de repuestos
a un proveedor.
Actores:
Administrador de Compras
Flujo Principal:

1. El administrador de compras ingresa al sistema.
2. El administrador registra una nueva compra.

```sql

```

3. El sistema llama a un procedimiento almacenado para registrar la compra y sus detalles.
4. El procedimiento almacenado inserta la compra y sus detalles en las tablas correspondientes
y actualiza el stock de repuestos.

```sql

```

## Caso de Uso 5: Generación de Reporte de Inventario

Descripción: Este caso de uso describe cómo el sistema genera un reporte de inventario de
bicicletas y repuestos.
Actores:
Administrador de Inventario
Flujo Principal:

1. El administrador de inventario ingresa al sistema.
2. El administrador solicita un reporte de inventario.

```sql

```

3. El sistema llama a un procedimiento almacenado para generar el reporte.

4. El procedimiento almacenado obtiene la información del inventario de bicicletas y repuestos.

```sql

```

## Caso de Uso 6: Actualización Masiva de Precios

Descripción: Este caso de uso describe cómo el sistema permite actualizar masivamente los
precios de todas las bicicletas de una marca específica.
Actores:
Administrador
Flujo Principal:

1. El administrador ingresa al sistema.
2. El administrador selecciona la opción para actualizar los precios de una marca específica.
3. El administrador ingresa la marca y el porcentaje de incremento.

```sql

```

4. El sistema llama a un procedimiento almacenado para actualizar los precios.
5. El procedimiento almacenado actualiza los precios de todas las bicicletas de la marca
especificada.

```sql

```

## Caso de Uso 7: Generación de Reporte de Clientes por Ciudad

Descripción: Este caso de uso describe cómo el sistema genera un reporte de clientes agrupados
por ciudad.
Actores:
Administrador
Flujo Principal:

1. El administrador ingresa al sistema.
2. El administrador selecciona la opción para generar un reporte de clientes por ciudad.

```sql

```

3. El sistema llama a un procedimiento almacenado para generar el reporte.

4. El procedimiento almacenado obtiene la información de los clientes agrupados por ciudad.

```sql

```

## Caso de Uso 8: Verificación de Stock antes de Venta

Descripción: Este caso de uso describe cómo el sistema verifica el stock de una bicicleta antes de
permitir la venta.
Actores:
Vendedor
Flujo Principal:

1. El vendedor ingresa al sistema.
2. El vendedor selecciona una bicicleta para vender.

```sql

```

3. El sistema llama a un procedimiento almacenado para verificar el stock.
4. El procedimiento almacenado devuelve un mensaje indicando si hay suficiente stock para
realizar la venta.

```sql

```

## Caso de Uso 9: Registro de Devoluciones

Descripción: Este caso de uso describe cómo el sistema registra la devolución de una bicicleta por
un cliente.
Actores:
Vendedor
Flujo Principal:

1. El vendedor ingresa al sistema.
2. El vendedor registra una devolución de bicicleta.

```sql

```

3. El sistema llama a un procedimiento almacenado para registrar la devolución.
4. El procedimiento almacenado inserta la devolución y actualiza el stock de la bicicleta.

```sql

```

## Caso de Uso 10: Generación de Reporte de Compras por Proveedor
Descripción: Este caso de uso describe cómo el sistema genera un reporte de compras realizadas
a un proveedor específico, mostrando todos los detalles de las compras.
Actores:
Administrador de Compras
Flujo Principal:

1. El administrador de compras ingresa al sistema.
2. El administrador selecciona un proveedor para generar un reporte de compras.

```sql

```

3. El sistema llama a un procedimiento almacenado para generar el reporte.
4. El procedimiento almacenado obtiene las compras y los detalles de las compras realizadas al
proveedor.

```sql

```

## Caso de Uso 11: Calculadora de Descuentos en Ventas

Descripción: Este caso de uso describe cómo el sistema aplica un descuento a una venta antes de
registrar los detalles de la venta.
Actores:
Vendedor
Flujo Principal:

1. El vendedor ingresa al sistema.
2. El vendedor aplica un descuento a una venta.

```sql

```

3. El sistema llama a un procedimiento almacenado para calcular el total con descuento.
4. El procedimiento almacenado calcula el total con el descuento aplicado y registra la venta.

```sql

```

# Casos de Uso para Funciones de Resumen

## Caso de Uso 1: Calcular el Total de Ventas Mensuales

Descripción: Este caso de uso describe cómo el sistema calcula el total de ventas realizadas en un
mes específico.
Actores:
Administrador
Flujo Principal:

1. El administrador ingresa al sistema.
2. El administrador selecciona la opción para calcular el total de ventas mensuales.
3. El administrador ingresa el mes y el año.

```sql

```

4. El sistema llama a un procedimiento almacenado para calcular el total de ventas.
5. El procedimiento almacenado devuelve el total de ventas del mes especificado.

```sql

```

## Caso de Uso 2: Calcular el Promedio de Ventas por Cliente

Descripción: Este caso de uso describe cómo el sistema calcula el promedio de ventas realizadas
por un cliente específico.
Actores:
Administrador
Flujo Principal:

1. El administrador ingresa al sistema.
2. El administrador selecciona la opción para calcular el promedio de ventas por cliente.
3. El administrador ingresa el ID del cliente.

```sql

```

4. El sistema llama a un procedimiento almacenado para calcular el promedio de ventas.
5. El procedimiento almacenado devuelve el promedio de ventas del cliente especificado.

```sql

```

## Caso de Uso 3: Contar el Número de Ventas Realizadas en un Rango de
Fechas
Descripción: Este caso de uso describe cómo el sistema cuenta el número de ventas realizadas
dentro de un rango de fechas específico.
Actores:
Administrador
Flujo Principal:

1. El administrador ingresa al sistema.
2. El administrador selecciona la opción para contar el número de ventas en un rango de
fechas.
3. El administrador ingresa las fechas de inicio y fin.

```sql

```

4. El sistema llama a un procedimiento almacenado para contar las ventas.
5. El procedimiento almacenado devuelve el número de ventas en el rango de fechas
especificado.

```sql

```

## Caso de Uso 4: Calcular el Total de Repuestos Comprados por Proveedor

Descripción: Este caso de uso describe cómo el sistema calcula el total de repuestos comprados a
un proveedor específico.
Actores:
Administrador de Compras
Flujo Principal:

1. El administrador de compras ingresa al sistema.
2. El administrador selecciona la opción para calcular el total de repuestos comprados por
proveedor.
3. El administrador ingresa el ID del proveedor.

```sql

```

4. El sistema llama a un procedimiento almacenado para calcular el total de repuestos.
5. El procedimiento almacenado devuelve el total de repuestos comprados al proveedor
especificado.

```sql

```

## Caso de Uso 5: Calcular el Ingreso Total por Año

Descripción: Este caso de uso describe cómo el sistema calcula el ingreso total generado en un
año específico.
Actores:
Administrador
Flujo Principal:

1. El administrador ingresa al sistema.
2. El administrador selecciona la opción para calcular el ingreso total por año.
3. El administrador ingresa el año.

```sql

```

4. El sistema llama a un procedimiento almacenado para calcular el ingreso total.
5. El procedimiento almacenado devuelve el ingreso total del año especificado.

```sql

```

## Caso de Uso 6: Calcular el Número de Clientes Activos en un Mes

Descripción: Este caso de uso describe cómo el sistema cuenta el número de clientes que han
realizado al menos una compra en un mes específico.
Actores:
Administrador
Flujo Principal:

1. El administrador ingresa al sistema.
2. El administrador selecciona la opción para contar el número de clientes activos en un mes.
3. El administrador ingresa el mes y el año.

```sql

```

4. El sistema llama a un procedimiento almacenado para contar los clientes activos.
5. El procedimiento almacenado devuelve el número de clientes que han realizado compras en
el mes especificado.

```sql

```

## Caso de Uso 7: Calcular el Promedio de Compras por Proveedor

Descripción: Este caso de uso describe cómo el sistema calcula el promedio de compras
realizadas a un proveedor específico.
Actores:
Administrador de Compras
Flujo Principal:

1. El administrador de compras ingresa al sistema.
2. El administrador selecciona la opción para calcular el promedio de compras por proveedor.
3. El administrador ingresa el ID del proveedor.

```sql

```

4. El sistema llama a un procedimiento almacenado para calcular el promedio de compras.
5. El procedimiento almacenado devuelve el promedio de compras del proveedor especificado.

```sql

```

## Caso de Uso 8: Calcular el Total de Ventas por Marca

Descripción: Este caso de uso describe cómo el sistema calcula el total de ventas agrupadas por
la marca de las bicicletas vendidas.
Actores:
Administrador
Flujo Principal:

1. El administrador ingresa al sistema.
2. El administrador selecciona la opción para calcular el total de ventas por marca.

```sql

```

3. El sistema llama a un procedimiento almacenado para calcular el total de ventas por marca.
4. El procedimiento almacenado devuelve el total de ventas agrupadas por marca.

```sql

```

## Caso de Uso 9: Calcular el Promedio de Precios de Bicicletas por Marca

Descripción: Este caso de uso describe cómo el sistema calcula el promedio de precios de las
bicicletas agrupadas por marca.
Actores:
Administrador
Flujo Principal:

1. El administrador ingresa al sistema.
2. El administrador selecciona la opción para calcular el promedio de precios por marca.

```sql

```

3. El sistema llama a un procedimiento almacenado para calcular el promedio de precios.
4. El procedimiento almacenado devuelve el promedio de precios agrupadas por marca.

```sql

```

## Caso de Uso 10: Contar el Número de Repuestos por Proveedor

Descripción: Este caso de uso describe cómo el sistema cuenta el número de repuestos
suministrados por cada proveedor.
Actores:
Administrador de Compras
Flujo Principal:

1. El administrador de compras ingresa al sistema.
2. El administrador selecciona la opción para contar el número de repuestos por proveedor.

```sql

```

3. El sistema llama a un procedimiento almacenado para contar los repuestos.
4. El procedimiento almacenado devuelve el número de repuestos suministrados por cada
proveedor.

```sql

```

## Caso de Uso 11: Calcular el Total de Ingresos por Cliente

Descripción: Este caso de uso describe cómo el sistema calcula el total de ingresos generados por
cada cliente.
Actores:
Administrador
Flujo Principal:

1. El administrador ingresa al sistema.
2. El administrador selecciona la opción para calcular el total de ingresos por cliente.

```sql

```

3. El sistema llama a un procedimiento almacenado para calcular el total de ingresos.
4. El procedimiento almacenado devuelve el total de ingresos generados por cada cliente.

```sql

```

## Caso de Uso 12: Calcular el Promedio de Compras Mensuales

Descripción: Este caso de uso describe cómo el sistema calcula el promedio de compras
realizadas mensualmente por todos los clientes.
Actores:
Administrador
Flujo Principal:

1. El administrador ingresa al sistema.
2. El administrador selecciona la opción para calcular el promedio de compras mensuales.

```sql

```

3. El sistema llama a un procedimiento almacenado para calcular el promedio de compras
mensuales.
4. El procedimiento almacenado devuelve el promedio de compras realizadas mensualmente.

```sql

```

## Caso de Uso 13: Calcular el Total de Ventas por Día de la Semana

Descripción: Este caso de uso describe cómo el sistema calcula el total de ventas realizadas en
cada día de la semana.
Actores:
Administrador
Flujo Principal:

1. El administrador ingresa al sistema.
2. El administrador selecciona la opción para calcular el total de ventas por día de la semana.

```sql

```

3. El sistema llama a un procedimiento almacenado para calcular el total de ventas.
4. El procedimiento almacenado devuelve el total de ventas agrupadas por día de la semana.

```sql

```

## Caso de Uso 14: Contar el Número de Ventas por Categoría de Bicicleta

Descripción: Este caso de uso describe cómo el sistema cuenta el número de ventas realizadas
para cada categoría de bicicleta (por ejemplo, montaña, carretera, híbrida).
Actores:
Administrador
Flujo Principal:

1. El administrador ingresa al sistema.
2. El administrador selecciona la opción para contar el número de ventas por categoría de
bicicleta.

```sql

```

3. El sistema llama a un procedimiento almacenado para contar las ventas.
4. El procedimiento almacenado devuelve el número de ventas por categoría de bicicleta.

```sql

```

## Caso de Uso 15: Calcular el Total de Ventas por Año y Mes

Descripción: Este caso de uso describe cómo el sistema calcula el total de ventas realizadas cada
mes, agrupadas por año.
Actores:
Administrador
Flujo Principal:

1. El administrador ingresa al sistema.
2. El administrador selecciona la opción para calcular el total de ventas por año y mes.

```sql

```

3. El sistema llama a un procedimiento almacenado para calcular el total de ventas.
4. El procedimiento almacenado devuelve el total de ventas agrupadas por año y mes.

```sql

```