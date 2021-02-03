SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, precio, precio * 1.21 FROM producto;
SELECT nombre AS 'nom de producte', precio AS 'preu en euros', precio * .15 AS 'preu en dólars' FROM producto;
SELECT UPPER(nombre), precio FROM producto;
SELECT LOWER(nombre), precio FROM producto;
SELECT nombre, UPPER(SUBSTR(nombre, 1, 2)) FROM fabricante;
SELECT nombre, ROUND(precio) FROM producto;
SELECT nombre, TRUNCATE(precio) FROM producto;
SELECT codigo_fabricante FROM producto;
SELECT DISTINCT codigo_fabricante FROM producto;
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 3, 2;
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
SELECT producto.nombre, precio, fabricante.nombre FROM producto, fabricante WHERE roducto.codigo_fabricante = fabricante.codigo;
SELECT producto.nombre, precio, fabricante.nombre FROM producto, fabricante WHERE producto.codigo_fabricante = fabricante.codigo ORDER BY fabicante.nombre ASC;
SELECT producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
SELECT producto.nombre, precio, fabricante.nombre FROM producto, fabricante ORDER BY nombre ASC LIMIT 1;
SELECT producto.nombre, precio, fabricante.nombre FROM producto, fabricante ORDER BY nombre DESC LIMIT 1;
SELECT * FROM producto WHERE fabricante.nombre = 'Lenovo';
SELECT * FROM producto WHERE fabricante.nombre = 'Crucial' AND precio > 200;
SELECT * FROM producto WHERE fabricante.nombre = 'Asus' OR fabricante.nombre = 'Hewlett Packard' OR fabricante.nombre = 'Seagate';
SELECT * FROM producto WHERE fabricante.nombre IN ('Asus', 'Hewlett Packard', 'Seagate');
SELECT producto.nombre, producto.precio FROM producto, fabricante WHERE fabricante.nombre LIKE '%e';
SELECT producto.nombre, producto.precio FROM producto, fabricante WHERE fabricante.nombre LIKE '%w%';
SELECT producto.nombre, producto.precio, fabicante.nombre FROM producto, fabricante WHERE precio => 180 ORDER BY precio DESC, nombre ASC;
SELECT nombre FROM fabricante WHERE codigo = ANY(SELECT codigo_fabricante FROM producto);
SELECT fabricante.nombre, COUNT(producto.codigo) FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante GROUP BY fabricante.codigo;
SELECT nombre FROM fabricante WHERE NOT codigo = ANY (SELECT codigo_fabricante FROM producto);
SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo');
SELECT * FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE producto.codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));
SELECT producto.nombre FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Lenovo' AND producto.precio = (SELECT MAX(precio)  FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Lenovo');
SELECT producto.nombre FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Hewlett-Packard' AND producto.precio = (SELECT MIN(precio) FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Hewlett-Packard');
SELECT * FROM producto WHERE precio >= (SELECT MAX(precio) FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Lenovo');
SELECT * FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Asus' AND producto.precio > (SELECT AVG(precio) FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Asus');
